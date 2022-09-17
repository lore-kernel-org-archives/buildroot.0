Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1962C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 11:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C0C60C07;
	Sat, 17 Sep 2022 11:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76C0C60C07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgx7T68X_Exr; Sat, 17 Sep 2022 11:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA01960B9E;
	Sat, 17 Sep 2022 11:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA01960B9E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E60A21BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 11:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFD1A41D98
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 11:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFD1A41D98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wNCZFH_PhDIz for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 11:50:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D9DB41CAB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D9DB41CAB
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 11:50:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8762:7a18:1c41:2137])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 13B7E2003EE;
 Sat, 17 Sep 2022 13:50:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 17 Sep 2022 13:50:27 +0200
Date: Sat, 17 Sep 2022 13:50:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20220917115027.GA1419013@scaer>
References: <20220917073445.2536513-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220917073445.2536513-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663415430;
 bh=1gXtGu5GZd71OMTEmpcK7typI4V1VdFN90y0CEbiMaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=knCOaBjGtWy1GyRt19e1Xr54s3d96qfIAnG+Ytx2vtOQLZTmECqCd1+ZEubAJG04E
 RFWrQY5hdrI/QBEx/iRZ8x31SNeNStdfNcXAo8E0ohNzKW2q7OYaA/9ye4bhEx7UW+
 sOpOpdV27mn2IVrlRCteFm7Kg2MQYz4kfVwRsyJYmLPwAtcwmollOwjhBUv2gbFkTb
 j1QG6Q8tbn9cHW2D3TwF1X0DXBZjeCqDUCJf3VAzzMWColg7HDI0EY2Q69NY2p1roq
 Rw9+PVi5a6LkbyJJ40RrnrBwX6OlCUYnZx3I5HRrU6FeozuTrU7cv0gX+sdp1JnZtM
 B+q0pia9cnAPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=knCOaBjG
Subject: Re: [Buildroot] [PATCH] Makefile: fix use of many br2-external trees
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: David Lawson <david.lawson1@tx.rr.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2022-09-17 09:34 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> To keep the promise that later defconfig files override previous ones
> (which we do doucment in our manual), we need to memorise what defconfig
         ,----'^^^
*document

[--SNIP--]
> -# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig

I forgot to restore this comment before comitting. It contains an
important information, so must be kept.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
