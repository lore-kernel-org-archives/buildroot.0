Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82022C83F25
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 21:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56256844E6;
	Mon, 21 Jul 2025 21:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1v7FpLORTXW0; Mon, 21 Jul 2025 21:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80F498441A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80F498441A;
	Mon, 21 Jul 2025 21:05:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41427127
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32A9F83EA9
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvYnsIG_KD6X for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 21:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55B3C83D35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55B3C83D35
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55B3C83D35
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:05:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D89126013D;
 Mon, 21 Jul 2025 23:05:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Jul 2025 23:05:37 +0200
MIME-Version: 1.0
Date: Mon, 21 Jul 2025 23:05:37 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Christian Stewart <christian@aperture.us>
In-Reply-To: <20250701193705.761121-3-giulio.benetti@benettiengineering.com>
References: <20250701193705.761121-1-giulio.benetti@benettiengineering.com>
 <20250701193705.761121-3-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c65128889dfe9a504c4bc3796a4c2003@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753131944;
 bh=eMzyJwMJu393mA5VjqKPEPj2qexG/Hqbd//Va4yQIME=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZI4Un+ISjvnSMVX8xtp2pYsaITQQYQCtxRmFBLxT7ldXeIMA9JqVS5bsfiLxRYMeF
 qP7bB/ia0ChGO7HnqNSUAVEc2+qkGJ0f3RuxBEjqvw2SZEuQ4FBI9nVgLIClF9au5e
 onSkvtYpp7aM3lnodIj5FMABdfzNIDXpEXL34M01a7Wz54xz6wAemT91p+4pPHjkKP
 OuFd+IZsXdJ+/V70yhjeuc153bWWLnHS32eLoz4mt5MAcmUsAcIB0WxCsZjiaWc+w3
 X+G23AzPVY+ea/S/0xTctIyO66yfTGCL8F7KUVm6g/t6chRYvemXQ51Kw0hnP0r9Td
 BsS1hwABpshEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZI4Un+IS
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: fix build failure with
 Linux 6.15
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

On 01/07/2025 21:37, Giulio Benetti wrote:
> Benetti Engineering just took over Larry Finger(lwfinger)'s repository 
> [0]
> rtl8723ds since Larry unfortunately passed away[1](RIP) and there are
> pending PRs that will never be checked as stated here. So basically 
> move
> github user to benetti-engineering-sas and update version with latest 
> that
> fixes build failure with Linux version 6.15. And let's drop local 
> patches
> that are now upstreamed as well. And of course let's update package's
> URL due to the moving.
> 
> [0]: https://github.com/lwfinger/rtl8723ds/issues/53
> [1]: https://lwn.net/Articles/979419/
> 
> Fixes:
> still not occured.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
