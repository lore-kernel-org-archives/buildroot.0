Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3197F46C56
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 15:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B26F60906;
	Mon,  6 Apr 2026 15:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQPsvYoceViv; Mon,  6 Apr 2026 15:57:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B2D460A3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775491037;
	bh=veC28zzjr65Th0S377tF1VzXgnjufgmqeS3sNusvppU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XLefqHXwhvFx3r07d2AvH9N4Pdr6JC4VniFOWuwCko6lWT0a9PsD9D0FdlUa80u0r
	 9bVR8rQFJBQcdVdOiJFWD74R0mffjrrt2RN5MrdsXR2tdowEh9VF3LNg5wEISRis/X
	 lWpwGj6sbeyquHQbMRgTNbl9mrZ0apoWkyt8inAfK/qBQNZWwEnwzdnRJuenVm6pBx
	 NlHdACjGeZHP2CzAlokOqS56Wd7qRpQj0/0D62jSfaCxQAyggidMfHaj21TlKmWx1E
	 hrSqetsPsNqKdVIdC6oUQptYXkZxduGJahtwc7ULFxZhpYbFf4YogXG9bpSlS/T+eh
	 /HpeB0d5BAvtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B2D460A3F;
	Mon,  6 Apr 2026 15:57:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F9DD2EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0611940879
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcRD0w5xXLrt for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 15:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BF8D40856
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BF8D40856
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:57:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5056804E9; Mon,  6 Apr 2026 15:57:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 17:42:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d28579e957a900acfdb09933d011df5083917e7d
X-Git-Newrev: 5ce17bc7d6fb37a2b1c91895808636f53fc0f18d
X-Patchwork-Hint: ignore
Message-Id: <20260406155712.B5056804E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zix: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ce17bc7d6fb37a2b1c91895808636f53fc0f18d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Needed for the upcoming bump of sord from 0.16.12 to 0.16.22:
https://gitlab.com/drobilla/sord/-/commit/ec186c111b2079aa2bb52f44b01b874e46ba4577

Build-tested using this defconfig:

BR2_PACKAGE_ZIX=y

                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: OK
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: OK
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: OK
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: OK
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: OK
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: OK
                    br-arm-full-nothread [31/32]: OK
                      br-arm-full-static [32/32]: OK

32 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/zix/Config.in |  6 ++++++
 package/zix/zix.hash  |  4 ++++
 package/zix/zix.mk    | 22 ++++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 15de0a3cb6..2316940028 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -537,6 +537,7 @@ F:	package/x264/
 F:	package/x265/
 F:	package/xmrig/
 F:	package/ytree/
+F:	package/zix/
 F:	package/znc/
 F:	support/testing/tests/package/test_perl_html_parser.py
 
diff --git a/package/Config.in b/package/Config.in
index a2b0d885a7..484229539f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1916,6 +1916,7 @@ menu "JSON/XML"
 	source "package/xml-security-c/Config.in"
 	source "package/yajl/Config.in"
 	source "package/yaml-cpp/Config.in"
+	source "package/zix/Config.in"
 endmenu
 
 menu "Logging"
diff --git a/package/zix/Config.in b/package/zix/Config.in
new file mode 100644
index 0000000000..35e3a398fb
--- /dev/null
+++ b/package/zix/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ZIX
+	bool "zix"
+	help
+	  A lightweight C library for reading and writing RDF
+
+	  https://gitlab.com/drobilla/zix
diff --git a/package/zix/zix.hash b/package/zix/zix.hash
new file mode 100644
index 0000000000..3472f5de71
--- /dev/null
+++ b/package/zix/zix.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://download.drobilla.net/zix-0.8.0.tar.xz.sig
+sha256  e9b6fe3ede984fa53f2edcebdabb35fb99ace807722772156aea49c079cad191  zix-0.8.0.tar.xz
+sha256  1314cc14fb947491491c517c533ac7de4f6798585f922a472358082c25ac1881  COPYING
diff --git a/package/zix/zix.mk b/package/zix/zix.mk
new file mode 100644
index 0000000000..e4d89b5104
--- /dev/null
+++ b/package/zix/zix.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# zix
+#
+################################################################################
+
+ZIX_VERSION = 0.8.0
+ZIX_SITE = https://download.drobilla.net
+ZIX_SOURCE = zix-$(ZIX_VERSION).tar.xz
+ZIX_LICENSE = ISC
+ZIX_LICENSE_FILES = COPYING
+ZIX_INSTALL_STAGING = YES
+
+ZIX_CONF_OPTS += -Dbenchmarks=disabled -Ddocs=disabled -Dtests=disabled
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ZIX_CONF_OPTS += -Dthreads=enabled
+else
+ZIX_CONF_OPTS += -Dthreads=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
