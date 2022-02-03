Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEE7C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFC4F8271D;
	Thu,  3 Feb 2022 20:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Qj5d5SdgKOH; Thu,  3 Feb 2022 20:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73705825C6;
	Thu,  3 Feb 2022 20:44:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C79961BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2A9A400F1
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQSDrKMI2D65 for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:44:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D43D40133
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:44:04 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a8so12385438ejc.8
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 12:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kqE7wuV1JLWwGelf4PxlDb8vE3bwi3hogsn3k6RVOz8=;
 b=J0eqOP0BcCA+DYZDtcKpi2uQAwWIAfmBwo0BuDonTU7nr5KdTu1hkIaiTLkC+evWj7
 /MD4TzzMKAjNtb734e3Uf6CZNTKrxtu0sT/1uMjIab9hb+ENEu/THAYoKhoRAKmjnodM
 s4DihlxvNN5VcxpmV6VPGv5B2EL9XQhhIq1GKf28H1xn75KxYmXgNBfEkA6y3zCLMGhV
 REx3BVE/KSOpSI6mMhZrflUkSyDomYTIp1TxG0vmKx87TfHbehWvDHQtHGbVMhDOe9Rk
 pOAbF7+q51Donh3o4eDTvj3eOsL3umAcBTPTf/01j6btNuZMa84vUC1owXG1WIrrUnPh
 DJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kqE7wuV1JLWwGelf4PxlDb8vE3bwi3hogsn3k6RVOz8=;
 b=Zb34GgQ138U8nRXhkbwCcQLL4xge6Nokms7llsdmzvxZd/tJld5BGL+jKhLqiReDr3
 TGv70sxSZljkjClEV0UfQ5WwuOxEJVQNyqak/AubFwhRsFVAtw2t7AiJGXvxiP2EUoBF
 X6LI9piXQ5GmObD1IenSJNIaHOe7FH2S48u4RWV+hluhyGj0I72WBw8gHem/BSMkgexv
 egjxwxj6tDiV+/dVP/+ZO2J81eX7mPlwdmyY3fpPaTZntZ0b0vek5sxKWXC1K+hY2xor
 YLGmKd9L3AWkSTuu/FLI1iUHerciR//cql7KeNbg8J6Blaoa8w9N69FQogrNhl5gn//D
 Ttzg==
X-Gm-Message-State: AOAM531a5nA+/NCZ7PQZQOrxWMN8aISLOI5w20dxNOb1cMU1H/gDodSH
 8XoOTofBSTtZwq91SoyXptCFLA==
X-Google-Smtp-Source: ABdhPJwPhhp3HJJexFsvuxhwzwFcOaBS4on/4hcMUa87NrGQyegvfrnnXkCgPZ4+EjpjoU2AEWoL4Q==
X-Received: by 2002:a17:907:7f91:: with SMTP id
 qk17mr25096474ejc.686.1643921042598; 
 Thu, 03 Feb 2022 12:44:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l11sm17162796ejr.224.2022.02.03.12.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 12:44:02 -0800 (PST)
Message-ID: <42d558bf-d2a9-f581-3a15-f8dc89150b47@mind.be>
Date: Thu, 3 Feb 2022 21:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220115162142.2300207-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220115162142.2300207-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mpdecimal: bump to version 2.5.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2022 17:21, Fabrice Fontaine wrote:
> Drop patch (already in version) and so autoreconf
> 
> https://www.bytereef.org/mpdecimal/changelog.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ort-for-enable-disable-shared-static.patch | 147 ------------------
>   package/mpdecimal/mpdecimal.hash              |   2 +-
>   package/mpdecimal/mpdecimal.mk                |   3 +-
>   3 files changed, 2 insertions(+), 150 deletions(-)
>   delete mode 100644 package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
> 
> diff --git a/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch b/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
> deleted file mode 100644
> index 60d6b4bb02..0000000000
> --- a/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
> +++ /dev/null
> @@ -1,147 +0,0 @@
> -From c349964887901848fb4cd5db53a5bcb6dae27aaa Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Sun, 23 Nov 2014 10:16:33 +0100
> -Subject: [PATCH] Add minimal support for --{enable,disable}-{shared,static}
> -
> -mpdecimal uses autoconf, but not automake or libtool, so this commit
> -adds some basic handling of --{enable,disable}-{shared,static}, so
> -that building the shared library can be disabled in pure static
> -library contexts.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -[Fabrice: update for 2.5.0 (add libmpdec++)]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - Makefile.in          |  6 ++++++
> - configure.ac         | 13 +++++++++++++
> - libmpdec/Makefile.in | 11 ++++++++++-
> - 3 files changed, 29 insertions(+), 1 deletion(-)
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index 2c91891..0c44f36 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -9,6 +9,8 @@ LIBSTATIC = @LIBSTATIC@
> - LIBSONAME = @LIBSONAME@
> - LIBSHARED = @LIBSHARED@
> - INSTALL = @INSTALL@
> -+BUILD_SHARED = @BUILD_SHARED@
> -+BUILD_STATIC = @BUILD_STATIC@
> -
> - prefix = @prefix@
> - exec_prefix = @exec_prefix@
> -@@ -32,9 +34,13 @@ install: FORCE
> - 	$(INSTALL) -d -m 755 $(DESTDIR)$(includedir)
> - 	$(INSTALL) -m 644 libmpdec/mpdecimal.h $(DESTDIR)$(includedir)
> - 	$(INSTALL) -d -m 755 $(DESTDIR)$(libdir)
> -+ifeq ($(BUILD_STATIC),yes)
> - 	$(INSTALL) -m 644 libmpdec/$(LIBSTATIC) $(DESTDIR)$(libdir)
> -+endif
> -+ifeq ($(BUILD_SHARED),yes)
> - 	$(INSTALL) -m 755 libmpdec/$(LIBSHARED) $(DESTDIR)$(libdir)
> - 	cd $(DESTDIR)$(libdir) && ln -sf $(LIBSHARED) $(LIBSONAME) && ln -sf $(LIBSHARED) $(LIBNAME)
> -+endif
> - 	$(INSTALL) -d -m 755 $(DESTDIR)$(docdir)
> - 	cp -R doc/* $(DESTDIR)$(docdir)
> -
> -@@ -74,9 +80,13 @@ install_libcxx: install_lib
> - 	$(INSTALL) -d -m 755 $(DESTDIR)$(includedir)
> - 	$(INSTALL) -m 644 libmpdec++/decimal.hh $(DESTDIR)$(includedir)
> - 	$(INSTALL) -d -m 755 $(DESTDIR)$(libdir)
> -+ifeq ($(BUILD_STATIC),yes)
> - 	$(INSTALL) -m 644 libmpdec++/$(LIBSTATIC_CXX) $(DESTDIR)$(libdir)
> -+endif
> -+ifeq ($(BUILD_SHARED),yes)
> - 	$(INSTALL) -m 755 libmpdec++/$(LIBSHARED_CXX) $(DESTDIR)$(libdir)
> - 	cd $(DESTDIR)$(libdir) && ln -sf $(LIBSHARED_CXX) $(LIBSONAME_CXX) && ln -sf $(LIBSHARED_CXX) $(LIBNAME_CXX)
> -+endif
> - 	cp -R doc/libmpdec++ $(DESTDIR)$(docdir)
> -
> -
> -diff --git a/configure.ac b/configure.ac
> -index 7ee8f86..2b3e505 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -88,6 +88,19 @@ CFLAGS="$saved_cflags"
> - AC_PROG_INSTALL
> - AC_SUBST(INSTALL)
> -
> -+AC_ARG_ENABLE([shared],
> -+	[AS_HELP_STRING([--enable-shared], [build shared library])],
> -+	[BUILD_SHARED=$enableval],
> -+	[BUILD_SHARED=yes])
> -+
> -+AC_ARG_ENABLE([static],
> -+	[AS_HELP_STRING([--enable-static], [build static library])],
> -+	[BUILD_STATIC=$enableval],
> -+	[BUILD_STATIC=yes])
> -+
> -+AC_SUBST(BUILD_SHARED)
> -+AC_SUBST(BUILD_STATIC)
> -+
> - # _FORTIFY_SOURCE wrappers for memmove and bcopy are incorrect:
> - # http://sourceware.org/ml/libc-alpha/2010-12/msg00009.html
> - AC_MSG_CHECKING(for glibc _FORTIFY_SOURCE/memmove bug)
> -diff --git a/libmpdec/Makefile.in b/libmpdec/Makefile.in
> -index d9619a3..985c73c 100644
> ---- a/libmpdec/Makefile.in
> -+++ b/libmpdec/Makefile.in
> -@@ -7,6 +7,8 @@
> - LIBSTATIC = @LIBSTATIC@
> - LIBSONAME = @LIBSONAME@
> - LIBSHARED = @LIBSHARED@
> -+BUILD_SHARED = @BUILD_SHARED@
> -+BUILD_STATIC = @BUILD_STATIC@
> -
> - CC = @CC@
> - LD = @LD@
> -@@ -32,8 +34,15 @@ ifeq ($(MAKECMDGOALS), profile_use)
> -   MPD_LDFLAGS += $(MPD_PUSE)
> - endif
> -
> -+ifeq ($(BUILD_SHARED),yes)
> -+TARGETS += $(LIBSHARED)
> -+endif
> -+
> -+ifeq ($(BUILD_STATIC),yes)
> -+TARGETS += $(LIBSTATIC)
> -+endif
> -
> --default: $(LIBSTATIC) $(LIBSHARED)
> -+default: $(TARGETS)
> -
> -
> - OBJS := basearith.o context.o constants.o convolute.o crt.o mpdecimal.o \
> -diff --git a/libmpdec/Makefile.in b/libmpdec/Makefile.in
> -index d9619a3..985c73c 100644
> ---- a/libmpdec++/Makefile.in
> -+++ b/libmpdec++/Makefile.in
> -@@ -13,6 +13,8 @@ LIBSTATIC_CXX = @LIBSTATIC_CXX@
> - LIBNAME_CXX = @LIBNAME_CXX@
> - LIBSONAME_CXX = @LIBSONAME_CXX@
> - LIBSHARED_CXX = @LIBSHARED_CXX@
> -+BUILD_SHARED = @BUILD_SHARED@
> -+BUILD_STATIC = @BUILD_STATIC@
> -
> - CXX = @CXX@
> - LDXX = @LDXX@
> -@@ -39,8 +41,15 @@ ifeq ($(MAKECMDGOALS), profile_use)
> -   MPD_LDXXFLAGS += $(MPD_PUSE)
> - endif
> -
> -+ifeq ($(BUILD_SHARED),yes)
> -+TARGETS += $(LIBSHARED_CXX)
> -+endif
> -+
> -+ifeq ($(BUILD_STATIC),yes)
> -+TARGETS += $(LIBSTATIC_CXX)
> -+endif
> -
> --default: $(LIBSTATIC_CXX) $(LIBSHARED_CXX)
> -+default: $(TARGETS)
> -
> -
> - OBJS := decimal.o
> ---
> -2.1.0
> -
> diff --git a/package/mpdecimal/mpdecimal.hash b/package/mpdecimal/mpdecimal.hash
> index c931ee4a6d..81150c7575 100644
> --- a/package/mpdecimal/mpdecimal.hash
> +++ b/package/mpdecimal/mpdecimal.hash
> @@ -1,4 +1,4 @@
>   # From http://www.bytereef.org/mpdecimal/download.html
> -sha256  15417edc8e12a57d1d9d75fa7e3f22b158a3b98f44db9d694cfd2acde8dfa0ca  mpdecimal-2.5.0.tar.gz
> +sha256  9f9cd4c041f99b5c49ffb7b59d9f12d95b683d88585608aa56a6307667b2b21f  mpdecimal-2.5.1.tar.gz
>   # Locally computed
>   sha256  b07528d8b1dbf1e2d2741052996f0876e23342ce2d30d0effa39c5457716c25a  LICENSE.txt
> diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
> index fa310a2274..25c12c08b1 100644
> --- a/package/mpdecimal/mpdecimal.mk
> +++ b/package/mpdecimal/mpdecimal.mk
> @@ -5,12 +5,11 @@
>   ################################################################################
>   
>   MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
> -MPDECIMAL_VERSION = 2.5.0
> +MPDECIMAL_VERSION = 2.5.1
>   MPDECIMAL_INSTALL_STAGING = YES
>   MPDECIMAL_LICENSE = BSD-2-Clause
>   MPDECIMAL_LICENSE_FILES = LICENSE.txt
>   MPDECIMAL_CONF_OPTS = LD="$(TARGET_CC)"
> -MPDECIMAL_AUTORECONF = YES
>   
>   # On i386, by default, mpdecimal tries to uses <fenv.h> which is not
>   # available in musl/uclibc. So in this case, we tell mpdecimal to use
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
