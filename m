Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC94CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9738680C88;
	Tue, 16 Sep 2025 20:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqICWTVezbWM; Tue, 16 Sep 2025 20:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3845C80C6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3845C80C6C;
	Tue, 16 Sep 2025 20:19:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7106D199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5776841215
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-0ruq2eQs34 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:19:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AC9641211
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AC9641211
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AC9641211
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:19:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A40427804FD;
 Tue, 16 Sep 2025 22:19:35 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Sep 2025 22:19:35 +0200
MIME-Version: 1.0
Date: Tue, 16 Sep 2025 22:19:35 +0200
To: Saeed Kazemi <kazemi.ms@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915144547.3727313-1-kazemi.ms@gmail.com>
References: <20250915144547.3727313-1-kazemi.ms@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f00df63c7933588d87d78827e9e5579f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758053976;
 bh=R7rVAOknsLo+rz09R9ysXg1XVRX2lJwrhtAH52cK4qY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ig7UpRTJsYN1ZdxTnKLtxJVCnE4s4AdT5UC30A7CnL9DjIqY0EqHgW2wKWwhYS/9n
 c6xKEniP/wh4Octv7O3Rgl1MZsiskXwcycL0A2y8Qn1PUmhqvZmaydBITWeQ1ZZAmu
 vT5pM+En/xKZtB9O9PnCCi3gZwmb62dYocjU2FqhS9Qqs/aPa3+qwTdCMLOgxb/K6l
 kqwyaiptFJU+pGWJqQa6McEtd5/WGJq7Sej/hF9DqGKGEEIE/2m4YJ0gg9AoccMxVn
 Kokk8yO2ns/zJwe9lB/3UEt7ruhl3KaR1A7pDbheVjkV6PHVwL9uTarGo9ro4+sWkk
 AB9KvzTp36Bog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ig7UpRTJ
Subject: Re: [Buildroot] [PATCH 1/1] package/mxt-app: bump to version 1.45
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

On 15/09/2025 16:45, Saeed Kazemi wrote:
> Release notes:
> https://github.com/atmel-maxtouch/mxt-app/releases/tag/v1.45
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
