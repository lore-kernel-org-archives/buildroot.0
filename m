Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF6FC77B73
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 21:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3BC041FC0;
	Sat, 15 Apr 2023 21:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3BC041FC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9XGi8i92Ambc; Sat, 15 Apr 2023 21:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F01C42043;
	Sat, 15 Apr 2023 21:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F01C42043
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFE801BF3C3
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 21:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A33A48416E
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 21:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A33A48416E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cyT7ge2kW3Of for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 21:29:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46FB98416D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46FB98416D
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 21:29:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B83035FFA7;
 Sat, 15 Apr 2023 23:29:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 23:29:33 +0200
Date: Sat, 15 Apr 2023 23:29:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Message-ID: <20230415212933.GU2819@scaer>
References: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681594178;
 bh=GxnesccG6VGVM2jJw07PGTWSoWTfVSPunTGcEQNTgnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XP7nYe+5Kz1g1KlA+cYnXm2Jii8yn3ogWhQGeVVgPpAX0N1OoWCJiVW6yAumXh6bv
 S2fV+mDM3AdUnxqnMzwaMrS3I9VTstmnsP408POf0W4JNlUJLingbrgFc8nXiDawEG
 oSV4MPzer/7pS4W91+etydpYLbyx90lH0lZ6eZKMBegXbYsnuiJibBCaBXY3dU40OG
 EdtaxXLddBc2IekJRup9EtgW+W/56GUzhly+LTlv+yrw4g5Xs7UW1VKJnDhM6e7ljo
 cERrqukqZ0XvjBZmHHiGBOdGwxdYAA44adh9NcJu8nLWMSdivWDYXE5Sbs29zG6rck
 jUahkGSbU4orA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XP7nYe+5
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

+Adam for your insight in GOI

On 2022-08-12 12:17 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since commit
> 9d1d4818c39d97ad7a1cdf6e075b9acae6dfff71:
> 
> [ 98%] Generating Poppler-0.18.typelib
> Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> error parsing file /home/giuliobenetti/autobuild/run/instance-1/output-1/build/poppler-21.12.0/glib/Poppler-0.18.gir: Failed to parse included gir GObject-2.0
> If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
> Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d2f50aa56410c2fff8a0538c57038104906e747e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Sorry for the long delay, I had a look tonight...

I could not find the underlying reason why g-ir-compiler (through our
wrapper) could not find the directory with all the gir files.

Given that poppler is so far the only affect package, and since your
patch was accepted upstream, I think it is only reasonable that we do
indeed use this change. So..

Applied to master, thanks.

However, I would really like to understand why we don't have more
packages that are broken. Is it because poppler is the only one with
include directives in his gir file, which means it needs access to the
installed gir files from other packages (those from goi)?

Or is it because it is the only one that already passes an explicit
--includedir option to g-ir-compiler, and that disables searching the
standard directory?

As Thomas also suggested, should we be doing that systematically in our
g-ir-compiler wrapper?

I know Adam said your change was "the simplest solution to the problem".
Still, this is not very satisfying...

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Rebase on top of master
>  - Use upstream commit
> 
>  ...txt-allow-the-user-to-configure-INTR.patch | 43 +++++++++++++++++++
>  package/poppler/poppler.mk                    |  3 +-
>  2 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch
> 
> diff --git a/package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch b/package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch
> new file mode 100644
> index 0000000000..079cf7234d
> --- /dev/null
> +++ b/package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch
> @@ -0,0 +1,43 @@
> +From e9d5731ba254f35e2d94b628c51e48c50a945271 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 24 Jan 2022 09:28:20 +0100
> +Subject: [PATCH] glib/CMakeLists.txt: allow the user to configure
> + INTROSPECTION_COMPILER_ARGS
> +
> +Allow the user to add its own parameters such as
> +--includedir=$(STAGING_DIR)/usr/share/gir-1.0 to
> +INTROSPECTION_COMPILER_ARGS to avoid the following build failure when
> +cross-compiling with buildroot:
> +
> +[ 98%] Generating Poppler-0.18.typelib
> +Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> +error parsing file /home/giuliobenetti/autobuild/run/instance-1/output-1/build/poppler-21.12.0/glib/Poppler-0.18.gir: Failed to parse included gir GObject-2.0
> +If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
> +Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/d2f50aa56410c2fff8a0538c57038104906e747e
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://gitlab.freedesktop.org/poppler/poppler/-/commit/e9d5731ba254f35e2d94b628c51e48c50a945271]
> +---
> + glib/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/glib/CMakeLists.txt b/glib/CMakeLists.txt
> +index 7510e69ee..f5130e3c9 100644
> +--- a/glib/CMakeLists.txt
> ++++ b/glib/CMakeLists.txt
> +@@ -119,7 +119,7 @@ if (HAVE_INTROSPECTION AND BUILD_SHARED_LIBS)
> +   # General gir: Reset object-list for introspection & load tool args
> +   set(INTROSPECTION_GIRS)
> +   set(INTROSPECTION_SCANNER_ARGS "--add-include-path=${CMAKE_CURRENT_SOURCE_DIR}" "--warn-all")
> +-  set(INTROSPECTION_COMPILER_ARGS "--includedir=${CMAKE_CURRENT_SOURCE_DIR}")
> ++  set(INTROSPECTION_COMPILER_ARGS ${INTROSPECTION_COMPILER_ARGS} "--includedir=${CMAKE_CURRENT_SOURCE_DIR}")
> + 
> +   # Poppler: Assign package to gir & export keys
> +   set(Poppler_0_18_gir "poppler-glib")
> +-- 
> +GitLab
> +
> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
> index b54262e7c4..db6da25d39 100644
> --- a/package/poppler/poppler.mk
> +++ b/package/poppler/poppler.mk
> @@ -47,7 +47,8 @@ POPPLER_DEPENDENCIES += gobject-introspection
>  POPPLER_CONF_OPTS += \
>  	-DENABLE_GOBJECT_INTROSPECTION=ON \
>  	-DINTROSPECTION_SCANNER=$(STAGING_DIR)/usr/bin/g-ir-scanner \
> -	-DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler
> +	-DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler \
> +	-DINTROSPECTION_COMPILER_ARGS="--includedir=$(STAGING_DIR)/usr/share/gir-1.0"
>  else
>  POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=OFF
>  endif
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
