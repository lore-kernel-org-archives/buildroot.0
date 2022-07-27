Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85021C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 19:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0562440272;
	Wed, 27 Jul 2022 19:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0562440272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uwul8nrG9LDD; Wed, 27 Jul 2022 19:05:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50AC740202;
	Wed, 27 Jul 2022 19:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50AC740202
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1091BF3C6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2851982531
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2851982531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bRWgfYDGl1-i for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 19:05:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42E868176C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42E868176C
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 19:05:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id A41BA1BF203;
 Wed, 27 Jul 2022 19:05:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 21:05:10 +0200
Message-Id: <20220727190511.2859278-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658948715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VNwuaBi4ecpAEBqjOb3rWkbeH+AhOyn9Du3t9A4HFkY=;
 b=m4ovwPHd9Qe5LAnfiLe0fspDzqsf6dJMTaxqROR5KmptbdwOQjjGS4Y7TJF1JRwcCt9T1h
 btrUr3zSG0/9sstlwnV6OaNYO3TNKV2CQrOEcQkmxmoL5jEns84DjNyi6VZLxuWD37aUXq
 KKefxqmTDoN7CXNdhprFnxKfFmcOAQEvn8CJTZxEshB3CW4lM7OLw87WS/eIB7vZwiBlDM
 Ql4UgKoWGkT+5GWmm5Fmp3wiCY71TVYxLNsxvwZrIxJ/dua0bB3BNa2VpPJ5+e/PQUx9Mg
 EyNCfBofiOi7hrjkfm6F826bDAHkyAH2M8gcIqyAQJf0HnP8ou2NrfRc0EO3Cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m4ovwPHd
Subject: [Buildroot] [PATCH] Makefile, docs/manual, support,
 toolchain: remove Eclipse integration
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Back many years ago, we developed an Eclipse plugin that simplified
the usage of Buildroot toolchains. Enabling the BR2_ECLIPSE_REGISTER=y
was registering the Buildroot toolchain into a special file in your
HOME folder that the Eclipse plugin would recognize to allow to
directly use the Buildroot cross-compiler.

This Eclipse plugin has not been maintained for years. The last commit
in the repository dates back from September 2017. Since then Eclipse
has moved on, and the plugin is no longer compatible with current
versions of Eclipse.

Also, Eclipse is probably no longer that widely used in the embedded
Linux space, as other more modern IDEs have become more popular.

All in all, it's time to say good bye to this Eclipse integration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                           |  9 +++
 Makefile                                   |  8 ---
 docs/manual/common-usage.txt               |  2 -
 docs/manual/eclipse-integration.txt        | 30 ---------
 support/scripts/eclipse-register-toolchain | 76 ----------------------
 toolchain/Config.in                        |  7 --
 6 files changed, 9 insertions(+), 123 deletions(-)
 delete mode 100644 docs/manual/eclipse-integration.txt
 delete mode 100755 support/scripts/eclipse-register-toolchain

diff --git a/Config.in.legacy b/Config.in.legacy
index 24b4236ade..80c443d9fb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2022.08"
 
+config BR2_ECLIPSE_REGISTER
+	bool "Eclipse integration removed"
+	select BR2_LEGACY
+	help
+	  The Buildroot integration with the Eclipse IDE has been
+	  removed, as the corresponding Eclipse plugin is no longer
+	  maintained, and is no longer usable with current versions of
+	  Eclipse.
+
 config BR2_csky
 	bool "csky architecture removed"
 	select BR2_LEGACY
diff --git a/Makefile b/Makefile
index 7d2081b98e..0993417ae0 100644
--- a/Makefile
+++ b/Makefile
@@ -646,14 +646,6 @@ STRIP_FIND_SPECIAL_LIBS_CMD = \
 	\( -name 'ld-*.so*' -o -name 'libpthread*.so*' \) \
 	-print0
 
-ifeq ($(BR2_ECLIPSE_REGISTER),y)
-define TOOLCHAIN_ECLIPSE_REGISTER
-	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` \
-		$(notdir $(TARGET_CROSS)) $(BR2_ARCH)
-endef
-TARGET_FINALIZE_HOOKS += TOOLCHAIN_ECLIPSE_REGISTER
-endif
-
 # Generate locale data.
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 GLIBC_GENERATE_LOCALES = $(call qstrip,$(BR2_GENERATE_LOCALE))
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 9ba87a8339..9abd3799dd 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -417,6 +417,4 @@ effects:
   be empty and it's only at the very end of the build that they will
   be populated.
 
-include::eclipse-integration.txt[]
-
 include::advanced.txt[]
diff --git a/docs/manual/eclipse-integration.txt b/docs/manual/eclipse-integration.txt
deleted file mode 100644
index 1f726d8240..0000000000
--- a/docs/manual/eclipse-integration.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-=== Integration with Eclipse
-
-While a part of the embedded Linux developers like classical text
-editors like Vim or Emacs, and command-line based interfaces, a number
-of other embedded Linux developers like richer graphical interfaces to
-do their development work. Eclipse being one of the most popular
-Integrated Development Environment, Buildroot integrates with Eclipse
-in order to ease the development work of Eclipse users.
-
-Our integration with Eclipse simplifies the compilation, remote
-execution and remote debugging of applications and libraries that are
-built on top of a Buildroot system. It does not integrate the
-Buildroot configuration and build processes themselves with
-Eclipse. Therefore, the typical usage model of our Eclipse integration
-would be:
-
-* Configure your Buildroot system with +make menuconfig+, +make
-  xconfig+ or any other configuration interface provided with
-  Buildroot.
-* Build your Buildroot system by running +make+.
-* Start Eclipse to develop, execute and debug your own custom
-  applications and libraries, that will rely on the libraries built
-  and installed by Buildroot.
-
-The Buildroot Eclipse integration installation process and usage is
-described in detail at
-https://github.com/mbats/eclipse-buildroot-bundle/wiki.
diff --git a/support/scripts/eclipse-register-toolchain b/support/scripts/eclipse-register-toolchain
deleted file mode 100755
index 891d29ee6f..0000000000
--- a/support/scripts/eclipse-register-toolchain
+++ /dev/null
@@ -1,76 +0,0 @@
-#!/bin/sh
-
-# This script registers the toolchain of a Buildroot project into the
-# Eclipse plugin. To do so, it adds a new line for the Buildroot
-# toolchain into the $HOME/.buildroot-eclipse.toolchains file, which
-# the Eclipse Buildroot plugin reads to discover automatically the
-# available Buildroot toolchains on the system.
-#
-# This script should typically not be called manually. Instead, one
-# should enable the BR2_ECLIPSE_REGISTER configuration option, which
-# will lead Buildroot to automatically call this script with the
-# appropriate arguments.
-#
-# Usage:
-#  eclipse-register-toolchain project-directory toolchain-prefix architecture
-#
-#   project-directory is the absolute path to the Buildroot project
-#   output directory (which contains the host/, target/, build/,
-#   images/, etc. subdirectories). It should be an absolute and
-#   canonical path.
-#
-#   toolchain-prefix is the prefix of the cross-compilation tools, i.e
-#   'arm-linux-' if the cross-compiler executable is 'arm-linux-gcc'.
-#
-#   architecture is the lower-cased name of the architecture targetted
-#   by the Buildroot project.
-
-if test $# -ne 3; then
-    echo "Invalid number of arguments."
-    echo "Usage: $0 project-directory toolchain-prefix architecture"
-    exit 1
-fi
-
-project_directory=$1
-toolchain_prefix=$2
-architecture=$3
-
-if test ! -d ${project_directory} ; then
-    echo "Non-existing project directory ${project_directory}"
-    exit 1
-fi
-
-if test ! -d ${project_directory}/host ; then
-    echo "Your project directory does not look like a Buildroot output"
-    exit 1
-fi
-
-if test ! -e ${project_directory}/host/bin/${toolchain_prefix}gcc ; then
-    echo "Cannot find the cross-compiler in the project directory"
-    exit 1
-fi
-
-TOOLCHAIN_ECLIPSE_FILE=${HOME}/.buildroot-eclipse.toolchains
-
-# First, we remove all lines from the ${TOOLCHAIN_ECLISPE_FILE} that
-# correspond to toolchains that no longer exist.
-if test -f ${TOOLCHAIN_ECLIPSE_FILE} ; then
-    mv ${TOOLCHAIN_ECLIPSE_FILE} ${TOOLCHAIN_ECLIPSE_FILE}.tmp
-    cat ${TOOLCHAIN_ECLIPSE_FILE}.tmp | while read toolchain ; do
-	path=$(echo ${toolchain} | cut -f1 -d ':')
-        # Filter lines corresponding to still existing projects
-	echo "Testing ${path} ..."
-	if ! test -d ${path} ; then
-	    continue
-	fi
-	# .. and the current project
-	if test ${path} = ${project_directory} ; then
-	    continue
-	fi
-	echo ${toolchain} >> ${TOOLCHAIN_ECLIPSE_FILE}
-    done
-    rm ${TOOLCHAIN_ECLIPSE_FILE}.tmp
-fi
-
-# Add the toolchain
-echo "${project_directory}:${toolchain_prefix}:${architecture}" >> ${TOOLCHAIN_ECLIPSE_FILE}
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5f79c07df0..05725394ea 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -331,13 +331,6 @@ config BR2_TARGET_LDFLAGS
 	  Note that options with a '$' sign (eg.
 	  -Wl,-rpath='$ORIGIN/../lib') are not supported.
 
-config BR2_ECLIPSE_REGISTER
-	bool "Register toolchain within Eclipse Buildroot plug-in"
-	help
-	  This options tells Buildroot to generate the necessary
-	  configuration files to make your toolchain appear within
-	  Eclipse, through the Eclipse Buildroot plugin.
-
 # Options for packages to depend on, if they require at least a
 # specific version of the kernel headers.
 # Toolchains should choose the adequate option (ie. the highest
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
