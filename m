Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E4DC021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 20:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387C74141A;
	Tue, 18 Feb 2025 20:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSEs1DlW1dFj; Tue, 18 Feb 2025 20:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32FAF4141F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32FAF4141F;
	Tue, 18 Feb 2025 20:35:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A31E7C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90FCE4142C
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlP7X6Z7TjwL for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 20:35:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8C904141A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8C904141A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8C904141A
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:35:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8243478034E;
 Tue, 18 Feb 2025 21:35:02 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 18 Feb 2025 21:35:02 +0100
MIME-Version: 1.0
Date: Tue, 18 Feb 2025 21:35:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250213093314.3367824-1-peter@korsgaard.com>
References: <20250213093314.3367824-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a8f8854b666a84e8be0ca8d43a43a19e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739910904;
 bh=guhQrpesAGBODEF41MfF68/yUVTraDKAz9jm2JQkIHM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M3NAekROX2yHJM3h3B3HeXC+j2xwoO8h8LNoMQFjeGKiY9sDF41GY95u8VQ0/H0XW
 rjJQEb/i8o9rC3DMCQSONlZtTDxiQk7+lb88MzZ92NZVZLZZep2TrpFYcHF0s6xSoY
 V9G0WmdUXnTqgTYHdVMqR+JRfM1c/owq+LKc7AGb1XCYPFoEUQUxgx5rV62skgLem3
 qUL8PJbrAHXnlXUA0RGsmvJtP42tnPzvUkvoHF2e0vbcMAu24hAGnUY2GKcQ/dmNsg
 rG9kGUsFLjRMaJLAEZJN3Zj53sz4+OPFgRQp91RbnuabxBAJSrbqa+PobE5e/utt8V
 Vm4Sk8F1d2EJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M3NAekRO
Subject: Re: [Buildroot] [PATCH] package/rnnoise: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/02/2025 10:33, Peter Korsgaard wrote:
> RNNoise is a noise suppression library based on a recurrent neural 
> network.
> 
> Add an upstream post-0.2 patch to fix a build issue.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
