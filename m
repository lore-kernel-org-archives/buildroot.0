Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D56C87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 20:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F22F2613C5;
	Mon,  4 Aug 2025 20:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7bFv5t2uSY2; Mon,  4 Aug 2025 20:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F682613A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F682613A1;
	Mon,  4 Aug 2025 20:13:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A91341A2
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F94040C95
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BT3Nh_1DG9b for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 20:13:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D63840C9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D63840C9E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D63840C9E
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:13:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A05E644406;
 Mon,  4 Aug 2025 20:13:38 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 Aug 2025 22:13:33 +0200
Message-ID: <20250804201334.1584190-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804201334.1584190-1-thomas.petazzoni@bootlin.com>
References: <20250804201334.1584190-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudefvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedvteejffeiteekfedthfdvfffgueektddtveevhffgudfgieekleeiudefheelnecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtt
 hhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754338418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6WouRFOe2Qx9SkM3JZtNRkSvUoMTNQFTlg/XCxSTpYM=;
 b=TI4yvl87s3e+i2g5F40X8mJ3TAX7fnM4ZfZbb1J/nl/dV5WJ/E6hZkwI0uV7XgyQVrSZae
 WOeCaJQVCHGNp7hWgD1kyfmLOJqn4Il4eUBlAbBtixot+pJMfRtMuiWVf6V9MGNV687Gu7
 1DpETu6AsuhJs2JsIc+b77HoX9s5C7B6n0T1G+z53ye93vBGosXn4+T1G9tHqkkmODI8Ap
 6s1WIy7K5Q9vQ0BLtoWWu45Q+us9lV6kvok37fNRqGujOJvKKceaJvBdvjGi1CKlIy3fK4
 c0w3Y34HKsei8Hqu7v24YcskrPOCSvMynSNW4Ugtk+4ICwAlYc2XB2N6CVXIng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TI4yvl87
Subject: [Buildroot] [PATCH 2/2] package/{gcc, binutils,
 gdb}: update ARC version to 2024.12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit updates the ARC toolchain components to the 2024.12
release, keeping the same patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host               |  4 +-
 .../0001-poison-system-directories.patch      | 68 +++++++++----------
 package/binutils/binutils.hash                |  2 +-
 package/binutils/binutils.mk                  |  4 +-
 package/gcc/Config.in.host                    |  6 +-
 package/gcc/gcc.hash                          |  2 +-
 package/gdb/Config.in.host                    |  4 +-
 ...ne-tcap.h-Update-definitions-for-C23.patch |  2 +-
 package/gdb/gdb.hash                          |  2 +-
 9 files changed, 46 insertions(+), 48 deletions(-)
 rename package/binutils/{arc-2023.09-release => arc-2024.12-release}/0001-poison-system-directories.patch (87%)
 rename package/gdb/{arc-2023.09-release => arc-2024.12-release-gdb}/0001-readline-tcap.h-Update-definitions-for-C23.patch (96%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 8e0c21bae0..33002e0028 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -13,7 +13,7 @@ choice
 	  Select the version of binutils you wish to use.
 
 config BR2_BINUTILS_VERSION_ARC
-	bool "binutils arc (2.41)"
+	bool "binutils arc (2.43)"
 	depends on BR2_arc
 
 config BR2_BINUTILS_VERSION_2_42_X
@@ -29,7 +29,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2023.09-release"	if BR2_BINUTILS_VERSION_ARC
+	default "arc-2024.12-release"	if BR2_BINUTILS_VERSION_ARC
 	default "2.42"		if BR2_BINUTILS_VERSION_2_42_X
 	default "2.43.1"	if BR2_BINUTILS_VERSION_2_43_X
 	default "2.44"		if BR2_BINUTILS_VERSION_2_44_X
diff --git a/package/binutils/arc-2023.09-release/0001-poison-system-directories.patch b/package/binutils/arc-2024.12-release/0001-poison-system-directories.patch
similarity index 87%
rename from package/binutils/arc-2023.09-release/0001-poison-system-directories.patch
rename to package/binutils/arc-2024.12-release/0001-poison-system-directories.patch
index 4b927b630e..8da0ec31df 100644
--- a/package/binutils/arc-2023.09-release/0001-poison-system-directories.patch
+++ b/package/binutils/arc-2024.12-release/0001-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From a6d90a842e349545ceb27f022317618dd99378ce Mon Sep 17 00:00:00 2001
+From 00f6b0a7d31085831429834b2bc8f511b8fab6ce Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 25 Dec 2015 11:45:38 +0100
 Subject: [PATCH] poison-system-directories
@@ -6,6 +6,8 @@ Subject: [PATCH] poison-system-directories
 Patch adapted to binutils 2.23.2 and extended to use
 BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
 
+[Waldemar: rebase on top of 2.43]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 [Waldemar: rebase on top of 2.39]
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 [Romain: rebase on top of 2.33.1]
@@ -81,10 +83,10 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  9 files changed, 89 insertions(+)
 
 diff --git a/ld/config.in b/ld/config.in
-index ad0dc6a106c..d21edaddce7 100644
+index f7c9da3d02a..e4fdbf6db5b 100644
 --- a/ld/config.in
 +++ b/ld/config.in
-@@ -58,6 +58,9 @@
+@@ -74,6 +74,9 @@
     language is requested. */
  #undef ENABLE_NLS
  
@@ -95,10 +97,10 @@ index ad0dc6a106c..d21edaddce7 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 43b44be1dc6..28f054ea3f8 100755
+index 44d79c2445d..e28cea11977 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -839,6 +839,7 @@ with_lib_path
+@@ -844,6 +844,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -106,7 +108,7 @@ index 43b44be1dc6..28f054ea3f8 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1521,6 +1522,8 @@ Optional Features:
+@@ -1535,6 +1536,8 @@ Optional Features:
    --enable-checking       enable run-time checks
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -115,7 +117,7 @@ index 43b44be1dc6..28f054ea3f8 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -15504,7 +15507,18 @@ else
+@@ -15587,7 +15590,18 @@ else
  fi
  
  
@@ -135,10 +137,10 @@ index 43b44be1dc6..28f054ea3f8 100755
  # Check whether --enable-got was given.
  if test "${enable_got+set}" = set; then :
 diff --git a/ld/configure.ac b/ld/configure.ac
-index 77edac3258c..a74dac63038 100644
+index bdf51a062fa..3d370ff92ce 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
-@@ -103,6 +103,16 @@ AC_SUBST(use_sysroot)
+@@ -102,6 +102,16 @@ AC_SUBST(use_sysroot)
  AC_SUBST(TARGET_SYSTEM_ROOT)
  AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
  
@@ -156,10 +158,10 @@ index 77edac3258c..a74dac63038 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index 05649ff61b8..1818c227473 100644
+index 0dee944cf2a..83bd82d2a2e 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
-@@ -163,6 +163,14 @@ typedef struct
+@@ -166,6 +166,14 @@ typedef struct
       in the linker script.  */
    bool force_group_allocation;
  
@@ -175,10 +177,10 @@ index 05649ff61b8..1818c227473 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texi b/ld/ld.texi
-index db3a9f09b45..9dacc934f80 100644
+index 89e3913317a..b80cf05617f 100644
 --- a/ld/ld.texi
 +++ b/ld/ld.texi
-@@ -2949,6 +2949,18 @@ string identifying the original linked file does not change.
+@@ -3234,6 +3234,18 @@ string identifying the original linked file does not change.
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
  
@@ -198,14 +200,13 @@ index db3a9f09b45..9dacc934f80 100644
  @item --package-metadata=@var{JSON}
  Request the creation of a @code{.note.package} ELF note section.  The
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index b8fd4e5d8e0..1f1d8e23bc9 100644
+index 87be885d31a..9bc7adca4bc 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
-@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bool cmdline)
-     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
+@@ -327,6 +327,22 @@ ldfile_add_library_path (const char *name, enum search_dir_source source)
    else
      new_dirs->name = xstrdup (name);
-+
+ 
 +#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
 +  if (command_line.poison_system_directories
 +  && ((!strncmp (name, "/lib", 4))
@@ -222,27 +223,27 @@ index b8fd4e5d8e0..1f1d8e23bc9 100644
 +   }
 +#endif
 +
- }
- 
- /* Try to open a BFD for a lang_input_statement.  */
+   /* Accumulate script and command line sourced
+      search paths at the end of the current list.  */
+ #if BFD_SUPPORTS_PLUGINS
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 0538f0a06a1..d1de3aec23d 100644
+index defe3fcbbb9..0ff12614926 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -166,6 +166,8 @@ enum option_values
+@@ -170,6 +170,8 @@ enum option_values
    OPTION_CTF_VARIABLES,
    OPTION_NO_CTF_VARIABLES,
    OPTION_CTF_SHARE_TYPES,
 +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
 +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
-   OPTION_WARN_EXECSTACK,
-   OPTION_NO_WARN_EXECSTACK,
-   OPTION_WARN_RWX_SEGMENTS,
+   OPTION_ERROR_EXECSTACK,
+   OPTION_NO_ERROR_EXECSTACK,
+   OPTION_WARN_EXECSTACK_OBJECTS,
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 9290a189b0d..e2e3074e872 100644
+index 037099b9d37..204feedc6e3 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -321,6 +321,8 @@ main (int argc, char **argv)
+@@ -347,6 +347,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = true;
    command_line.warn_search_mismatch = true;
    command_line.check_section_addresses = -1;
@@ -252,10 +253,10 @@ index 9290a189b0d..e2e3074e872 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index c5960385572..da0a7829914 100644
+index 4aa0124ce2f..c4d76943821 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -613,6 +613,14 @@ static const struct ld_option ld_options[] =
+@@ -648,6 +648,14 @@ static const struct ld_option ld_options[] =
  		   "                                <method> is: share-unconflicted (default),\n"
  		   "                                             share-duplicated"),
      TWO_DASHES },
@@ -270,7 +271,7 @@ index c5960385572..da0a7829914 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -625,6 +633,7 @@ parse_args (unsigned argc, char **argv)
+@@ -660,6 +668,7 @@ parse_args (unsigned argc, char **argv)
    int ingroup = 0;
    char *default_dirlist = NULL;
    char *shortopts;
@@ -278,7 +279,7 @@ index c5960385572..da0a7829914 100644
    struct option *longopts;
    struct option *really_longopts;
    int last_optind;
-@@ -1692,6 +1701,14 @@ parse_args (unsigned argc, char **argv)
+@@ -1785,6 +1794,14 @@ parse_args (unsigned argc, char **argv)
  	  }
  	  break;
  
@@ -293,7 +294,7 @@ index c5960385572..da0a7829914 100644
  	case OPTION_PUSH_STATE:
  	  input_flags.pushed = xmemdup (&input_flags,
  					sizeof (input_flags),
-@@ -1837,6 +1854,10 @@ parse_args (unsigned argc, char **argv)
+@@ -1938,6 +1955,10 @@ parse_args (unsigned argc, char **argv)
        command_line.soname = NULL;
      }
  
@@ -304,6 +305,3 @@ index c5960385572..da0a7829914 100644
    while (ingroup)
      {
        einfo (_("%P: missing --end-group; added as last command line option\n"));
--- 
-2.40.1
-
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index ec0a382501..b40463262c 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,7 +4,7 @@ sha512  20977ad17729141a2c26d358628f44a0944b84dcfefdec2ba029c2d02f40dfc41cc91c06
 sha512  b85d3bbc0e334cf67a96219d3c7c65fbf3e832b2c98a7417bf131f3645a0307057ec81cd2b29ff2563cec53e3d42f73e2c60cc5708e80d4a730efdcc6ae14ad7  binutils-2.44.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  binutils-gdb-arc-2023.09-release.tar.gz
+sha512  46c336a16bde7b73dc4ceac0986887d47d542a1452e1936ef871b5e76afdb6cad4b18ccb4d93341358e7bb92c2ef74781e1fb72935d527d15251ac9f9daa8305  binutils-gdb-arc-2024.12-release.tar.gz
 
 # locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 2b5064d739..a9f03225da 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,13 +9,13 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2023.09-release
+BINUTILS_VERSION = arc-2024.12-release
 else
 BINUTILS_VERSION = 2.43.1
 endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2023.09-release)
+ifeq ($(BINUTILS_VERSION),arc-2024.12-release)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 23fcaa9825..2149846761 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -10,10 +10,10 @@ choice
 	  Select the version of gcc you wish to use.
 
 config BR2_GCC_VERSION_ARC
-	bool "gcc arc (13.1)"
+	bool "gcc arc (15.1)"
 	# Only supported architecture
 	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 
 config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
@@ -77,7 +77,7 @@ config BR2_GCC_VERSION
 	default "13.4.0"    if BR2_GCC_VERSION_13_X
 	default "14.3.0"    if BR2_GCC_VERSION_14_X
 	default "15.1.0"    if BR2_GCC_VERSION_15_X
-	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
+	default "arc-2024.12-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 692aa31281..5ccbd81122 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -8,7 +8,7 @@ sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea
 sha512  ddd35ca6c653dffa88f7c7ef9ee4cd806e156e0f3b30f4d63e75a8363361285cd566ee73127734cde6a934611de815bee3e32e24bfd2e0ab9f7ff35c929821c1  gcc-15.1.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  4dca20f517a42bb027fec605965b09fb917a535eebf3fe3e811d93476b02b1962df5ad4665f117bd44c2ec8e8015d51a44c00591761fe5f259c201ac5c7d920f  gcc-arc-2023.09-release.tar.gz
+sha512  7f08ae335d9112be65e92c3744c095d8fa265994b8282274948f99fe37409531e627e6dadfb77b138a82fa09d012c56d8c075b482a5a5186814a57f9db63c29e  gcc-arc-2024.12-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index ac50a292ff..963c46129d 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -47,7 +47,7 @@ choice
 	  Select the version of gdb you wish to use.
 
 config BR2_GDB_VERSION_ARC
-	bool "gdb arc (14.x)"
+	bool "gdb arc (15.x)"
 	depends on BR2_arc
 
 config BR2_GDB_VERSION_14
@@ -72,7 +72,7 @@ endif
 # If cross-gdb is not enabled, the latest stable version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2023.09-release" if BR2_GDB_VERSION_ARC || (!BR2_PACKAGE_HOST_GDB && BR2_arc)
+	default "arc-2024.12-release-gdb" if BR2_GDB_VERSION_ARC || (!BR2_PACKAGE_HOST_GDB && BR2_arc)
 	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "15.2"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "16.3"	   if BR2_GDB_VERSION_16
diff --git a/package/gdb/arc-2023.09-release/0001-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/arc-2024.12-release-gdb/0001-readline-tcap.h-Update-definitions-for-C23.patch
similarity index 96%
rename from package/gdb/arc-2023.09-release/0001-readline-tcap.h-Update-definitions-for-C23.patch
rename to package/gdb/arc-2024.12-release-gdb/0001-readline-tcap.h-Update-definitions-for-C23.patch
index 33c0ee95fc..64f741fe75 100644
--- a/package/gdb/arc-2023.09-release/0001-readline-tcap.h-Update-definitions-for-C23.patch
+++ b/package/gdb/arc-2024.12-release-gdb/0001-readline-tcap.h-Update-definitions-for-C23.patch
@@ -1,4 +1,4 @@
-From 93f772832b96e0c48223c452324e9736d7de051e Mon Sep 17 00:00:00 2001
+From 130750cf9607fc1c4bcbead820a27bee6ee60f04 Mon Sep 17 00:00:00 2001
 From: Chris Packham <judge.packham@gmail.com>
 Date: Wed, 30 Apr 2025 16:49:44 +1200
 Subject: [PATCH] readline/tcap.h: Update definitions for C23
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 8bef9cd374..7844b765e6 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -4,7 +4,7 @@ sha512  624007deceb5b15ba89c0725883d1a699fa46714ef30887f3d0165e17c5d65d634671740
 sha512  fffd6689c3405466a179670b04720dc825e4f210a761f63dd2b33027432f8cd5d1c059c431a5ec9e165eedd1901220b5329d73c522f9a444788888c731b29e9c  gdb-16.3.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  gdb-arc-2023.09-release.tar.gz
+sha512  a909a687abf6e9623c7ec99a8b2cbb03ab6fdeccee9ebd33ce34fffdb2bed5e4d519113aeb29ba3ca8db52e9bdbb63b59973914c74e3eebf4a4a2a6033b9e784  gdb-arc-2024.12-release-gdb.tar.gz
 
 # Locally calculated (fetched from gcc.gnu.org)
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
