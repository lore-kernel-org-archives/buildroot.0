Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A90C00528
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 18:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 442154282B;
	Mon, 31 Jul 2023 18:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 442154282B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJ_iFuIrdpCs; Mon, 31 Jul 2023 18:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEA7342018;
	Mon, 31 Jul 2023 18:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEA7342018
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FA8D1BF334
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 18:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B300E615D3
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 18:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B300E615D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xi6QS41o1RRV for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 18:55:39 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97C83615B8
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 18:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97C83615B8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9f57:78c5:813c:6b41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 805C4B0057F;
 Mon, 31 Jul 2023 20:55:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Jul 2023 20:55:34 +0200
Date: Mon, 31 Jul 2023 20:55:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230731185534.GC421096@scaer>
References: <20230727122840.642816-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727122840.642816-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690829736;
 bh=frWhsyrpE6BnEPPVZJOVsYHjEnFexX1jdcTSZc0XY7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cbQfgwtbxh+mk1KWEH7LEgSnekifDYm1NXKzmpwTKJqC+V8d9fVsKGmAfwDaX0C/j
 prq6x2pEtJlQJaFphmHJX4tLj4joWafLsRRzWt1NaYpxkR+tDRFiJu2eRpWiOhamiU
 QJF7mXuLJOWWJou/og8tXsqRDAFdzuC6opmxeNMHerl8hT+QecMYF7QP9Kykev9JA/
 RJoyasJ/p0AMi16TYDn2dXU8vFvq8AmNq6OLXx7oFPKr+orEE0eX3fokuoLtiJ+0Ao
 4oYs+NlTBkFBwmDz/I3zRyhByJQ4vVd/SRaWDW/Gb+V5L1v5BbCpEN5w9Lr1yoOS/X
 5YOyC+D5KwgIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cbQfgwtb
Subject: Re: [Buildroot] [PATCH] package/msmtp: bump version to 1.8.24
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

Thomas, All,

On 2023-07-27 14:28 +0200, Thomas Petazzoni via buildroot spake thusly:
> From https://marlam.de/msmtp/news/:
> 
> """
> msmtp 1.8.24 is released
> 
> 2023-06-29
> 
> This release fixes the allow_from_override command, adds the
> from_full_name command, fixes a few minor bugs and updates the
> translations (thanks again to everyone at translationproject.org).
> 
> msmtp 1.8.23 is released
> 
> 2023-01-30
> 
> This release fixes XOAUTH2 authentication with some servers, updates
> the msmtpq scripts, and updates the translations (including a new
> Swedish translation).
> """
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/msmtp/msmtp.hash | 4 ++--
>  package/msmtp/msmtp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
> index c5571f2fb3..c5fe9d9176 100644
> --- a/package/msmtp/msmtp.hash
> +++ b/package/msmtp/msmtp.hash
> @@ -1,7 +1,7 @@
>  # Locally calculated after checking signature
> -# https://marlam.de/msmtp/releases/msmtp-1.8.22.tar.xz.sig
> +# https://marlam.de/msmtp/releases/msmtp-1.8.24.tar.xz.sig
>  # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
> -sha256  1b04206286a5b82622335e4eb09e17074368b7288e53d134543cbbc6b79ea3e7  msmtp-1.8.22.tar.xz
> +sha256  bd6644b1aaab17d61b86647993e3efad860b23c54283b00ddc579c1f5110aa59  msmtp-1.8.24.tar.xz
>  
>  # Hash for license file:
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
> index c3928ffcbb..93c923a123 100644
> --- a/package/msmtp/msmtp.mk
> +++ b/package/msmtp/msmtp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MSMTP_VERSION = 1.8.22
> +MSMTP_VERSION = 1.8.24
>  MSMTP_SITE = https://marlam.de/msmtp/releases
>  MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
>  MSMTP_DEPENDENCIES = host-pkgconf
> -- 
> 2.41.0
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
