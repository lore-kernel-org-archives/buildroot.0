Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0CFC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 20:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CDC260736;
	Sun, 31 Dec 2023 20:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CDC260736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VM6KzUrb5dHt; Sun, 31 Dec 2023 20:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 039AC60737;
	Sun, 31 Dec 2023 20:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 039AC60737
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 319241BF3FC
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 20:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04EED4085E
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 20:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04EED4085E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWL0DwKk20OS for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 20:24:59 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C13840739
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 20:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C13840739
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 58A365FF3F;
 Sun, 31 Dec 2023 21:24:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 31 Dec 2023 21:24:51 +0100
Date: Sun, 31 Dec 2023 21:24:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZZHOEzdON7f__91a@landeda>
References: <20231231172538.1279608-1-wbx@openadk.org>
 <20231231172538.1279608-4-wbx@openadk.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231231172538.1279608-4-wbx@openadk.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704054297;
 bh=0Uc9cN26IwUsX6sS1h1Z5cDkmTfkUelYWS/tpeDYzM0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vd625NCdsbyiarf/R7TSG3Og4D2onCVzU4ClCmcliWxBZfdKvP+Lvc9mTdGesYgYT
 bClaRmhrotulh+XY3f0MuhKGH4b2Ug+gMVjXDL8rnXrxbVZBDoRMl3WW503gmpss+K
 VQEVY9mBVXW+v5eJcuesayjM3ADGTF70Y7M91h01P0CqfbZC6323gqwPrmN6pzAob2
 E5l32dwRr45rpdTS7yUBbnzl5QN6eHcbjqTHqAtnA2Kdej57G1l4xWq0+o2VAwlOEc
 MebXFFOT2qISnHcsCj87y7aqPwb7a+oe6KNcT4gQ2cpKNLy9GnOG9hjDfPsK8ifxbq
 tlF427jQ1cd6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vd625NCd
Subject: Re: [Buildroot] [PATCH 3/6] package/gdb: remove special arc version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar, All,

On 2023-12-31 18:25 +0100, Waldemar Brodkorb spake thusly:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

This commit really needs some more information, as to why it is correct
to drop the arch specific version.

Indeed, until now, for gcc and binutils, it was possible to select
generic version of gcc or binutils, so dropping the arc version is not
too impactoing.

However, for gdb, the situation is different: until now, it was not
possible to select a generic version for arc. So this patch is doing
more than dropping the arc version: it makes the generic version
available, and only the generic versions, while they were not available
at all until then.

I believe this is a bigger tchange than we want to do all at once, at
should at the very least be done in two different patches: first make
the generic versions available for arc, then drop the arc version.

And both commit should have a proper commit log that explains why that
is an OK change.

Plus, see below...

> ---
>  package/gdb/Config.in.host                    |   3 -
>  ...t-define-basic_string_view-to_string.patch | 114 ------------------
>  package/gdb/gdb.hash                          |   3 -
>  package/gdb/gdb.mk                            |  23 +---
>  4 files changed, 2 insertions(+), 141 deletions(-)
>  delete mode 100644 package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index da35fd94f7..69b13e9eb0 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -35,14 +35,12 @@ config BR2_PACKAGE_HOST_GDB_PYTHON3
>  
>  config BR2_PACKAGE_HOST_GDB_SIM
>  	bool "Simulator support"
> -	depends on !BR2_arc

So the simulator was not available on arc until now, and this chjange
also makes it available.

This should be in a separate patch, most probably after the generic
versions are made available for arc, and even after the generic version
is dropped.

And in any case, the commit log should explain why it is now possible to
enable the simulator for arc.

Regards,
Yann E. MORIN.

>  	help
>  	  This option enables the simulator support in the cross gdb.
>  
>  choice
>  	prompt "GDB debugger Version"
>  	default BR2_GDB_VERSION_13
> -	depends on !BR2_arc
>  	help
>  	  Select the version of gdb you wish to use.
>  
> @@ -62,7 +60,6 @@ endif
>  # If cross-gdb is not enabled, the latest stable version is chosen.
>  config BR2_GDB_VERSION
>  	string
> -	default "arc-2020.09-release-gdb" if BR2_arc
>  	default "12.1"     if BR2_GDB_VERSION_12
>  	default "13.2"     if BR2_GDB_VERSION_13 || !BR2_PACKAGE_HOST_GDB
>  	# When making 14.x the default, or 14.x becomes the oldest version,
> diff --git a/package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch b/package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch
> deleted file mode 100644
> index 210ba6d609..0000000000
> --- a/package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -From 5ac588997c3c2d032d5d5145d9245eb37354c23b Mon Sep 17 00:00:00 2001
> -From: Tom Tromey <tromey@adacore.com>
> -Date: Tue, 30 Jun 2020 07:53:03 -0600
> -Subject: [PATCH] Do not define basic_string_view::to_string
> -
> -gdb's copy of basic_string_view includes a to_string method.  However,
> -according to cppreference, this is not a method on the real
> -std::basic_string_view:
> -
> -https://en.cppreference.com/w/cpp/string/basic_string_view
> -
> -This difference matters because gdb_string_view.h will use the
> -standard implementation when built with a C++17 or later.  This caused
> -PR build/26183.
> -
> -This patch fixes the problem by changing the method to be a standalone
> -helper function, and then rewriting the uses.  Tested by rebuilding
> -with a version of GCC that defaults to C++17.
> -
> -(Note that the build still is not clean; and also I noticed that the
> -libstdc++ string_view forbids the use of nullptr ... I wonder if gdb
> -violates that.)
> -
> -gdb/ChangeLog
> -2020-06-30  Tom Tromey  <tromey@adacore.com>
> -
> -	PR build/26183:
> -	* ada-lang.c (ada_lookup_name_info::ada_lookup_name_info): Use
> -	gdb::to_string.
> -
> -gdbsupport/ChangeLog
> -2020-06-30  Tom Tromey  <tromey@adacore.com>
> -
> -	PR build/26183:
> -	* gdb_string_view.h (basic_string_view::to_string): Remove.
> -	(gdb::to_string): New function.
> -
> -Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5ac588997c3c2d032d5d5145d9245eb37354c23b
> -Bug report: https://sourceware.org/bugzilla/show_bug.cgi?id=26183
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - gdb/ChangeLog                |  6 ++++++
> - gdb/ada-lang.c               |  8 ++++----
> - gdbsupport/ChangeLog         |  6 ++++++
> - gdbsupport/gdb_string_view.h | 17 ++++++++++-------
> - 4 files changed, 26 insertions(+), 11 deletions(-)
> -
> -diff --git a/gdb/ada-lang.c b/gdb/ada-lang.c
> -index 9b0c2efbfe2..98508c168bc 100644
> ---- a/gdb/ada-lang.c
> -+++ b/gdb/ada-lang.c
> -@@ -13553,10 +13553,10 @@ ada_lookup_name_info::ada_lookup_name_info (const lookup_name_info &lookup_name)
> -     {
> -       if (user_name.back () == '>')
> - 	m_encoded_name
> --	  = user_name.substr (1, user_name.size () - 2).to_string ();
> -+	  = gdb::to_string (user_name.substr (1, user_name.size () - 2));
> -       else
> - 	m_encoded_name
> --	  = user_name.substr (1, user_name.size () - 1).to_string ();
> -+	  = gdb::to_string (user_name.substr (1, user_name.size () - 1));
> -       m_encoded_p = true;
> -       m_verbatim_p = true;
> -       m_wild_match_p = false;
> -@@ -13575,10 +13575,10 @@ ada_lookup_name_info::ada_lookup_name_info (const lookup_name_info &lookup_name)
> - 	  if (encoded != NULL)
> - 	    m_encoded_name = encoded;
> - 	  else
> --	    m_encoded_name = user_name.to_string ();
> -+	    m_encoded_name = gdb::to_string (user_name);
> - 	}
> -       else
> --	m_encoded_name = user_name.to_string ();
> -+	m_encoded_name = gdb::to_string (user_name);
> - 
> -       /* Handle the 'package Standard' special case.  See description
> - 	 of m_standard_p.  */
> -diff --git a/gdbsupport/gdb_string_view.h b/gdbsupport/gdb_string_view.h
> -index c0ae7a8a2d9..65124e67e54 100644
> ---- a/gdbsupport/gdb_string_view.h
> -+++ b/gdbsupport/gdb_string_view.h
> -@@ -245,13 +245,6 @@ namespace gdb {
> - 	  return { this->_M_str, this->_M_len };
> - 	}
> - 
> --      template<typename _Allocator = std::allocator<_CharT>>
> --	std::basic_string<_CharT, _Traits, _Allocator>
> --	to_string(const _Allocator& __alloc = _Allocator()) const
> --	{
> --	  return { this->_M_str, this->_M_len, __alloc };
> --	}
> --
> -       size_type
> -       copy(_CharT* __str, size_type __n, size_type __pos = 0) const
> -       {
> -@@ -560,4 +553,14 @@ namespace gdb {
> - 
> - #endif // __cplusplus < 201703L
> - 
> -+namespace gdb {
> -+
> -+static inline std::string
> -+to_string(const gdb::string_view &view)
> -+{
> -+  return { view.data (), view.size () };
> -+}
> -+
> -+}
> -+
> - #endif /* COMMON_GDB_STRING_VIEW_H */
> --- 
> -2.39.3
> -
> diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
> index ba90bff5d6..bdc236daf3 100644
> --- a/package/gdb/gdb.hash
> +++ b/package/gdb/gdb.hash
> @@ -4,6 +4,3 @@ sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470b
>  sha512  425568d2e84672177d0fb87b1ad7daafdde097648d605e30cf0656970f66adc6a82ca2d83375ea4be583e9683a340e5bfdf5819668ddf66728200141ae50ff2d  gdb-12.1.tar.xz
>  sha512  8185d3e11ab60dafff5860a5016577bfe7dd7547ef01ebc867bc247603d82b74ff74c4f29492c7d2aee57076f52be33e289f4c6b414a4b870d4b3004909f4c34  gdb-13.2.tar.xz
>  sha512  575e198105076fc4a88f68591aa114ab9c1196e84386a3f7b9b58fe5f30cdeed33f6a5f957b68f08c47284ec922bb60c964627e238471419673fd913575ce427  gdb-14.1.tar.xz
> -
> -# Locally calculated (fetched from Github)
> -sha512  5a2acf2fd33ab2ff589e1037ca40abda54328997dcff26b2b49b874bd3be980be5a63342962254f3c3bda98e32ce7a33af704d37353352833dee193135600458  gdb-arc-2020.09-release-gdb.tar.gz
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index af40f7f986..26695b2cd4 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -8,12 +8,6 @@ GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
>  GDB_SITE = $(BR2_GNU_MIRROR)/gdb
>  GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
>  
> -ifeq ($(BR2_arc),y)
> -GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
> -GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
> -GDB_FROM_GIT = y
> -endif
> -
>  GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
>  GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
>  GDB_CPE_ID_VENDOR = gnu
> @@ -56,11 +50,8 @@ GDB_DEPENDENCIES += host-flex host-bison
>  HOST_GDB_DEPENDENCIES += host-flex host-bison
>  endif
>  
> -# All newer versions of GDB need host-gmp, so it's only for older
> -# versions that the dependency can be avoided.
> -ifeq ($(BR2_arc),)
> +# All newer versions of GDB need host-gmp
>  HOST_GDB_DEPENDENCIES += host-gmp
> -endif
>  
>  # When gdb sources are fetched from the binutils-gdb repository, they
>  # also contain the binutils sources, but binutils shouldn't be built,
> @@ -158,13 +149,10 @@ GDB_CONF_OPTS += \
>  endif
>  
>  # Starting from GDB 11.x, gmp is needed as a dependency to build full
> -# gdb. So we avoid the dependency only for the special version used on
> -# ARC.
> -ifeq ($(BR2_arc):$(BR2_PACKAGE_GDB_DEBUGGER),:y)
> +# gdb.
>  GDB_CONF_OPTS += \
>  	--with-libgmp-prefix=$(STAGING_DIR)/usr
>  GDB_DEPENDENCIES += gmp
> -endif
>  
>  # Starting from GDB 14.x, mpfr is needed as a dependency to build full
>  # gdb.
> @@ -182,13 +170,6 @@ else
>  GDB_CONF_OPTS += --disable-gdbserver
>  endif
>  
> -# When gdb is built as C++ application for ARC it segfaults at runtime
> -# So we pass --disable-build-with-cxx config option to force gdb not to
> -# be built as C++ app.
> -ifeq ($(BR2_arc),y)
> -GDB_CONF_OPTS += --disable-build-with-cxx
> -endif
> -
>  # gdb 7.12+ by default builds with a C++ compiler, which doesn't work
>  # when we don't have C++ support in the toolchain
>  ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
> -- 
> 2.30.2
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
