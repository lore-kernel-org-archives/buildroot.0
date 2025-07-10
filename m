Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016E9C83F0F
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 02:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6217D60FDF;
	Thu, 10 Jul 2025 02:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fi98bvnEtfJd; Thu, 10 Jul 2025 02:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73E0360B8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73E0360B8F;
	Thu, 10 Jul 2025 02:51:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 887F615F
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 02:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F7314012D
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 02:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G156HiFEqEFW for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 02:51:29 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F26340063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F26340063
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F26340063
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 02:51:27 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 01E49BDE1563;
 Thu, 10 Jul 2025 04:51:23 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 10 Jul 2025 02:51:23 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Tim Soubry <tim.soubry@mind.be>
Cc: buildroot <buildroot@buildroot.org>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
In-Reply-To: <mailman.1.1752062402.1941804.buildroot@buildroot.org>
References: <mailman.1.1752062402.1941804.buildroot@buildroot.org>
Message-ID: <4f419b5f3c0ffe87cd6e8b0da9aa3220@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1752115884; bh=Y7v+SxhuOEWpq/BnKjAj1IKJuK+5oxT63aglr2E6Niw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=UnbtJIRhq//Q9DrYl55S8tSb56mIgvOAk9faRkb3xqJWFjXI5KBpxwACmCveprjEo
 ss6prcutat2WeqErml0e5J7lPL3zkBQBpYRqXI5qcM5uCbV/G2xypcy/UjFQphkWi8
 DHN2v3JSWKajuq3BJeKMK11wm+f9c3BpTLvSVSNc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=UnbtJIRh
Subject: Re: [Buildroot] [PATCH 1/1] package/ncmpc: bump version to 0.52
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

Hi Tim, *

Do you have any idea why the libatomic patch is now obsolete? The 
regression test 
(http://autobuild.buildroot.org/results/7ac1a07e4f72633d3ec92b79dc5d8c062490abdc) 
builds (after removing a lot of legacy config options).

You have spaces instead of tabs in Config.in, please see the comment 
below.

Kind regards,
Andreas


On 2025-07-08 15:17, Tim Soubry wrote:
> 
> Applying version bump of ncmpc to version 0.52 as proposed in [1].
> As from version 0.50 of ncmpc, fmt got added as a dependency [2]. This 
> was
> also added to package/ncmpc/Config.in and package/ncmpc/ncmpc.mk.
> 
> For release notes, see:
> https://github.com/MusicPlayerDaemon/ncmpc/blob/master/NEWS
> 
> Comparision between version 0.49 and 0.52:
> https://github.com/MusicPlayerDaemon/ncmpc/compare/v0.49..v0.52
> 
> [1] 
> https://lore.kernel.org/buildroot/20250707112536.1644236-1-tim.soubry@mind.be/T/#rb3b968fff23bac0298e33f473d63a1ad470d38e3
> [2] 
> https://github.com/MusicPlayerDaemon/ncmpc/commit/c3b0055d06f8e8efab7f388646beb7645b90d063
> 
> Signed-off-by: Tim Soubry <tim.soubry@mind.be>
> ---
>  ...cro-my_gettext-do-not-define-gettext.patch | 199 ------------------
>  ...uild-add-atomic-dependency-for-sparc.patch |  45 ----
>  package/ncmpc/Config.in                       |   5 +-
>  package/ncmpc/ncmpc.hash                      |   2 +-
>  package/ncmpc/ncmpc.mk                        |   3 +-
>  5 files changed, 6 insertions(+), 248 deletions(-)
>  delete mode 100644 
> package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch
>  delete mode 100644 
> package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch

<elision>

> diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
> index 61c186a4ae..e4bda449e3 100644
> --- a/package/ncmpc/Config.in
> +++ b/package/ncmpc/Config.in
> @@ -5,8 +5,9 @@ config BR2_PACKAGE_NCMPC
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
> -	select BR2_PACKAGE_LIBMPDCLIENT
> -	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_FMT
> +       select BR2_PACKAGE_LIBMPDCLIENT
> +       select BR2_PACKAGE_NCURSES

    ^^^ utils/check-package complains here.

>  	help
>  	  ncmpc is a fully featured MPD client, which runs in a terminal
>  	  (using ncurses). Its goal is to provide a keyboard oriented
> diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
> index 1d288294d1..41cfd86584 100644
> --- a/package/ncmpc/ncmpc.hash
> +++ b/package/ncmpc/ncmpc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256  
> 65bbec0ede9e6bcf62ac647b0c706485beb2bdd5db70ca8d60103f32f162cf29  
> ncmpc-0.49.tar.xz
> +sha256  
> 3af225496fe363a8534a9780fb46ae1bd17baefd80cf4ba7430a19cddd73eb1a  
> ncmpc-0.52.tar.xz
> 
>  # Hash for license file:
>  sha256  
> ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  
> COPYING
> diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
> index ee75c2a676..726f524bfa 100644
> --- a/package/ncmpc/ncmpc.mk
> +++ b/package/ncmpc/ncmpc.mk
> @@ -5,13 +5,14 @@
>  
> ################################################################################
> 
>  NCMPC_VERSION_MAJOR = 0
> -NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).49
> +NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).52
>  NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
>  NCMPC_SITE = 
> http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
>  NCMPC_DEPENDENCIES = \
>  	host-pkgconf \
>  	libmpdclient \
>  	ncurses \
> +	fmt \
>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
>  	$(TARGET_NLS_DEPENDENCIES)
>  NCMPC_LICENSE = GPL-2.0+
> --
> 2.39.5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
