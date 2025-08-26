Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B10CA0FE9
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 20:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF0D606CF;
	Tue, 26 Aug 2025 20:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwSd9zoPD2Av; Tue, 26 Aug 2025 20:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F162606EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F162606EE;
	Tue, 26 Aug 2025 20:06:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56925114
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 20:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48A58606EE
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 20:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZsXOWAdHOtM3 for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 20:06:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94376606CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94376606CF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94376606CF
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 20:06:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 88F3813F861;
 Tue, 26 Aug 2025 22:06:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 Aug 2025 22:06:27 +0200
MIME-Version: 1.0
Date: Tue, 26 Aug 2025 22:06:27 +0200
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Buildroot development <buildroot@buildroot.org>
In-Reply-To: <9ce2daa8-6493-47b6-9159-52591480ebfd@grenoble.cnrs.fr>
References: <9ce2daa8-6493-47b6-9159-52591480ebfd@grenoble.cnrs.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <04e8df6023c01fa551fcd121ca589487@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756238788;
 bh=fiDDvThwAUvXDNNzyCov0Qv0+QLbiJWJA9bSx0OZYew=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YoCm7mJ1J2+bRV3XY/9m3Phd4KYg7LEPDBSytHXRCHk8CyVjwyNFpJ/uwrpr200qB
 vjcRzK0ByKyV6ehLAOve+Bwgw+pQIg0XEoc/okBeTphVZZbybTBz7GRXUrzCcVDvQg
 1VNp3ol7h6Shy+opQaC70ehVRHR1M9+3RPnUe6poFnmujdgH1by2pf22sMBWUykHCg
 Fgk26uk9m+ZS/4P3UORAZQ06b3IqxqFVVgmWXFsUtGbTqiLtT7TRroztppmqoprHmA
 cG8NilcYAu+WS4D8Z4LChMCrCUabSzbnbkG3vApaUX3z6gELP7vFymfRmt6s0hgawG
 NKZ5wo5DdDwhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YoCm7mJ1
Subject: Re: [Buildroot] [PATCH 1/1] arch/Config.in.arm: fix typo in help
 text
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/08/2025 14:15, Edgar Bonet via buildroot wrote:
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
