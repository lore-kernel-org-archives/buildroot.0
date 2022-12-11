Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DB3C001B2
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7019460AC2;
	Sun, 11 Dec 2022 08:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7019460AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7dygyujkgRq; Sun, 11 Dec 2022 08:21:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A86E7607F6;
	Sun, 11 Dec 2022 08:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A86E7607F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B4E91BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F10540128
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F10540128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOu7wW5Hc-I5 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:20:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 261FE404C9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 261FE404C9
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:20:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9fcf:911b:99f4:8b0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E1D485FF9A;
 Sun, 11 Dec 2022 09:20:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 09:20:50 +0100
Date: Sun, 11 Dec 2022 09:20:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211082050.GH1044805@scaer>
References: <20221210214054.34790-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221210214054.34790-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670746853;
 bh=1CPaEGqQZX2raEzj2LFQi9TVWcrFqy1dW+b/WuPCha4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bBdqOUsbzY9Y8E3d3nKxu8Yot8E2syGeWqOWBDxXoO0uSrI0Tk+9/L4PQEXq+r1gH
 azYdeV+vlG4p+kLxJelOmlrnnp4vUiuj9Kbg0ETZ49I2XYn0v0+y/5rZ7MaW0l8/oK
 LGM/gJB2mMYHGwRcmAdn0PL7+gNN1xMW0VtpTruWbcQYEDS2rgsGA/cHZQuyvTDML4
 MWVmvobBlNWiAFt/Q0xlyfWcamExUgPvkYpY6ODwWaLuOnPhg8Z5jUIcvhaQ9EjeNd
 O+E/yxMzw25qnLHvHyLi5CNQ6g2ine7r7/H2DdjQsgj5wc3k9ACClO5vM7f3gvcgiv
 S4T1lfz6NrYcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bBdqOUsb
Subject: Re: [Buildroot] [PATCH 1/1] package/sed: bump to version 4.9
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-10 22:40 +0100, Fabrice Fontaine spake thusly:
> Update hash of COPYING (URL updated:
> https://git.savannah.gnu.org/cgit/sed.git/commit/?id=5adab913a82ef1b7f844339ab209531ccf198990)
> 
> https://git.savannah.gnu.org/cgit/sed.git/tree/NEWS?h=v4.9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sed/sed.hash | 6 +++---
>  package/sed/sed.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sed/sed.hash b/package/sed/sed.hash
> index bb48128526..10e2c36d8f 100644
> --- a/package/sed/sed.hash
> +++ b/package/sed/sed.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz.sig
> +# https://ftp.gnu.org/gnu/sed/sed-4.9.tar.xz.sig
>  # with the key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
> -sha256  f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633  sed-4.8.tar.xz
> +sha256  6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181  sed-4.9.tar.xz
>  # Locally calculated
> -sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
> +sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/sed/sed.mk b/package/sed/sed.mk
> index 64fb2035b0..8165083658 100644
> --- a/package/sed/sed.mk
> +++ b/package/sed/sed.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SED_VERSION = 4.8
> +SED_VERSION = 4.9
>  SED_SOURCE = sed-$(SED_VERSION).tar.xz
>  SED_SITE = $(BR2_GNU_MIRROR)/sed
>  SED_LICENSE = GPL-3.0
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
