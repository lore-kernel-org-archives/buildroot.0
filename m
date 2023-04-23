Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB6DC77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 11:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56DCC8213E;
	Sun, 23 Apr 2023 11:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56DCC8213E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCXZ8IAK8zkF; Sun, 23 Apr 2023 11:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FFA28212F;
	Sun, 23 Apr 2023 11:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FFA28212F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FAF01BF859
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35AB8410A1
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35AB8410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wLpnWVD7wCCZ for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 11:06:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF954410EC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF954410EC
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 11:06:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f69d:4ee8:8d2a:132a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 06D2EB0053E;
 Sun, 23 Apr 2023 13:06:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 13:06:15 +0200
Date: Sun, 23 Apr 2023 13:06:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230423110615.GF2696@scaer>
References: <SN4P221MB06822B245A5155FE545F0362A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
 <SN4P221MB06826BE9E12B14BEBB4F4826A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB06826BE9E12B14BEBB4F4826A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682247979;
 bh=PlretQTZYy4z16p5eGBKMCkyyA1WB/2G42Qzw9wPphI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pvAuBFe7IV9dA54BTivhMXQj54gVn5O6doyfQRUOwpVLwDF8uVYqBhpCxKY+Zesj5
 F0RQ19DNziFh7uP5Gh4cQGqnRPDH3D6bAtRj2ur0KdYaOox4Q7QFitf9MyzYU8DAhL
 q8hyDpezCG3H2zCTNMaSM/AU1NpowPE+mk4oaDx65Hpu75pO43OkKZtNr1Zx8spEWt
 9DF9pGaNzBdbqUju4syuytSCVGh6DSWJikCgUL8RHXhYC4F+0IGS4+BFF7GM252w3q
 gEgvp54UYFlWJxEencrpQwadSVVVnhcSVg/Hb0zAdBbETnGCXtD0zDPiiO92CWr9/w
 msf5tY5CRy3HQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pvAuBFe7
Subject: Re: [Buildroot] [PATCH 3/4] package/glib-networking: bump version
 to 2.76.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-04-21 10:12 -0400, James Knight spake thusly:
> - Drop "0001-meson-change-std-to-gnu99.patch" since change is available
>    in this version.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-meson-change-std-to-gnu99.patch      | 30 -------------------
>  package/glib-networking/glib-networking.hash  |  4 +--
>  package/glib-networking/glib-networking.mk    |  4 +--
>  3 files changed, 4 insertions(+), 34 deletions(-)
>  delete mode 100644 package/glib-networking/0001-meson-change-std-to-gnu99.patch
> 
> diff --git a/package/glib-networking/0001-meson-change-std-to-gnu99.patch b/package/glib-networking/0001-meson-change-std-to-gnu99.patch
> deleted file mode 100644
> index 9f266bc2c8d2bda6a08a23c5b198589965fc8633..0000000000000000000000000000000000000000
> --- a/package/glib-networking/0001-meson-change-std-to-gnu99.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From cdfa726bae1d82b7bd3735475fc2b2c6a31c1d2f Mon Sep 17 00:00:00 2001
> -From: Ignacio Casal Quinteiro <qignacio@amazon.com>
> -Date: Fri, 12 Nov 2021 11:51:33 +0100
> -Subject: [PATCH] meson: change std to gnu99
> -
> -This is the same as glib and should fix issues with old
> -compilers
> -
> -(cherry picked from commit b192086b9936602a40a14d00a6883b339b9d7955)
> -Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index b018ca7b..130a2bf0 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -3,7 +3,7 @@ project(
> -   version: '2.70.0',
> -   license: 'LGPL2.1+',
> -   meson_version: '>= 0.50.0',
> --  default_options: ['c_std=c99']
> -+  default_options: ['c_std=gnu99']
> - )
> - 
> - prefix = get_option('prefix')
> --- 
> -2.17.1
> -
> diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
> index 766efd0ced4e786798364a1e14d2a75e86e481ad..72e70ff0edadafb53931a33b6c95e1ce23756d4c 100644
> --- a/package/glib-networking/glib-networking.hash
> +++ b/package/glib-networking/glib-networking.hash
> @@ -1,3 +1,3 @@
> -# From https://download.gnome.org/sources/glib-networking/2.70/glib-networking-2.70.1.sha256sum
> -sha256  2a16bfc2d271ccd3266e3fb462bc8a4103c02e81bbb339aa92d6fb060592d7bc  glib-networking-2.70.1.tar.xz
> +# From https://download.gnome.org/sources/glib-networking/2.76/glib-networking-2.76.0.sha256sum
> +sha256  149a05a179e629a538be25662aa324b499d7c4549c5151db5373e780a1bf1b9a  glib-networking-2.76.0.tar.xz
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
> index b6d29110ed53fa8976d154f04a2b705f8e7697bb..24811716582c54df6f00192b67caab4dd947964e 100644
> --- a/package/glib-networking/glib-networking.mk
> +++ b/package/glib-networking/glib-networking.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -GLIB_NETWORKING_VERSION_MAJOR = 2.70
> -GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
> +GLIB_NETWORKING_VERSION_MAJOR = 2.76
> +GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
>  GLIB_NETWORKING_SITE = https://download.gnome.org/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
>  GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
>  GLIB_NETWORKING_INSTALL_STAGING = YES
> -- 
> 2.39.1.windows.1
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
