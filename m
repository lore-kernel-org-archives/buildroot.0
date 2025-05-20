Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0482C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86B2D6079B;
	Tue, 20 May 2025 17:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWOCe2fT8ncH; Tue, 20 May 2025 17:29:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AE50607B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AE50607B8;
	Tue, 20 May 2025 17:29:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3440DE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E022181C58
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1naD0j6VFLK for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:29:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D3F6817AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D3F6817AE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:29:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15CF787572; Tue, 20 May 2025 17:29:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 19:27:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 11818cd07d1ba2794619552788327136b24df9da
X-Git-Newrev: 10cc2fc1c611c16ed603f3c47a37b5a8f1ade90c
X-Patchwork-Hint: ignore
Message-Id: <20250520172901.15CF787572@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/alsa-lib: bump version
 to 1.2.14
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=10cc2fc1c611c16ed603f3c47a37b5a8f1ade90c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.13_v1.2.14#alsa-lib

Removed patch 0002 which is included in upstream release.

Remove Kconfig options for alisp which was removed upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
  - move the legacy option to a new 2025.08 section
  - add alsa-lib version in Congig.in.legacy comment
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                   |  8 +++++
 ...igure-Make-sequencer-dependent-on-rawmidi.patch | 35 ----------------------
 package/alsa-lib/Config.in                         |  5 ----
 package/alsa-lib/alsa-lib.hash                     |  2 +-
 package/alsa-lib/alsa-lib.mk                       |  5 +---
 5 files changed, 10 insertions(+), 45 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3289bd8385..9681617a3c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.08"
+
+config BR2_PACKAGE_ALSA_LIB_ALISP
+	bool "alsa-lib alisp support removed"
+	select BR2_LEGACY
+	help
+	  Support for alisp was removed from alsa-lib v1.12.14.
+
 comment "Legacy options removed in 2025.05"
 
 config BR2_GCC_VERSION_12_X
diff --git a/package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch b/package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch
deleted file mode 100644
index fb1d18df36..0000000000
--- a/package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From: Takashi Iwai <tiwai@suse.de>
-Date: Sun, 24 Nov 2024 08:32:29 +0000 (+0100)
-Subject: configure: Make sequencer dependent on rawmidi
-X-Git-Url: https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff_plain;h=6880219ad4ba55ae8a94a34b7a987b3369f7c96f
-
-configure: Make sequencer dependent on rawmidi
-
-The sequencer feature requires rawmidi implicitly, and it became more
-obvious with UMP support.  Add the dependency check to configure
-script.
-
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
-
-Upstream: https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=6880219ad4ba55ae8a94a34b7a987b3369f7c96f
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
-
-diff --git a/configure.ac b/configure.ac
-index 1cd22a59..69aeb978 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -483,6 +483,12 @@ fi
- AC_SUBST(PYTHON_LIBS)
- AC_SUBST(PYTHON_INCLUDES)
- 
-+if test "$build_rawmidi" != "yes"; then
-+  if test "$build_seq" = "yes"; then
-+    AC_ERROR([Cannot enable sequencer without rawmidi])
-+  fi
-+fi
-+
- AM_CONDITIONAL([BUILD_MIXER], [test x$build_mixer = xyes])
- AM_CONDITIONAL([BUILD_PCM], [test x$build_pcm = xyes])
- AM_CONDITIONAL([BUILD_RAWMIDI], [test x$build_rawmidi = xyes])
diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 360122f97f..304f947f83 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -73,11 +73,6 @@ config BR2_PACKAGE_ALSA_LIB_UCM
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 
-config BR2_PACKAGE_ALSA_LIB_ALISP
-	bool "alisp"
-	default y
-	depends on BR2_USE_MMU
-
 config BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS
 	bool "old-symbols"
 	default y
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 0533df7954..26d54b6e1b 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8c4ff37553cbe89618e187e4c779f71a9bb2a8b27b91f87ed40987cc9233d8f6  alsa-lib-1.2.13.tar.bz2
+sha256  be9c88a0b3604367dd74167a2b754a35e142f670292ae47a2fdef27a2ee97a32  alsa-lib-1.2.14.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 6272fa69df..34c1688e98 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.13
+ALSA_LIB_VERSION = 1.2.14
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
@@ -52,9 +52,6 @@ endif
 ifneq ($(BR2_PACKAGE_ALSA_LIB_UCM),y)
 ALSA_LIB_CONF_OPTS += --disable-ucm
 endif
-ifneq ($(BR2_PACKAGE_ALSA_LIB_ALISP),y)
-ALSA_LIB_CONF_OPTS += --disable-alisp
-endif
 ifneq ($(BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS),y)
 ALSA_LIB_CONF_OPTS += --disable-old-symbols
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
