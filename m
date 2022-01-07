Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4502C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C85582591;
	Fri,  7 Jan 2022 17:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nnkMWhsccwGg; Fri,  7 Jan 2022 17:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8418F81D4D;
	Fri,  7 Jan 2022 17:37:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B95631BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F74460AB7
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UQ7giLQV6oVV for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:37:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C29DA60A76
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5352C83488; Fri,  7 Jan 2022 17:31:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 18:37:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c28b93248a2e4ee79dc42e20d904505e7310a15f
X-Git-Newrev: 48b77b25b71fa3c47b8d6fac1da46ea122715350
X-Patchwork-Hint: ignore
Message-Id: <20220107173116.5352C83488@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-modules: bump to version
 2.13.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=48b77b25b71fa3c47b8d6fac1da46ea122715350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add a dependency on kernel >= 3.0:
  https://github.com/lttng/lttng-modules/commit/88eafb709ac811960b1163482f5d537cb18b32df
- Add CONFIG_KPROBES to Config.in for kernel >= 5.7:
  https://github.com/lttng/lttng-modules/commit/a65765406b03e4f3b7a4303e1c9ed83c86cdd358
- Update license files and their hash because SPDX v3.0 identifiers are
  used since
  https://github.com/lttng/lttng-modules/commit/b7cdc18250880cc44edeef4a4b42c8ac7a135a6d
- This bump will fix a build failure with kernel >= 5.6 thanks to at
  least:
  https://github.com/lttng/lttng-modules/commit/edfdcb685c3f56dde803244449f79ad7bed03798

https://github.com/lttng/lttng-modules/blob/v2.13.1/ChangeLog

Fixes:
 - https://bugs.busybox.net/show_bug.cgi?id=14501

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-modules/Config.in          | 12 +++++++++---
 package/lttng-modules/lttng-modules.hash | 12 ++++++------
 package/lttng-modules/lttng-modules.mk   |  5 +++--
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/package/lttng-modules/Config.in b/package/lttng-modules/Config.in
index e8ba9bad8c..cb56584155 100644
--- a/package/lttng-modules/Config.in
+++ b/package/lttng-modules/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LTTNG_MODULES
 	bool "lttng-modules"
 	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
 	  Linux kernel modules for the LTTng 2.x kernel tracing
 	  infrastructure.
@@ -8,7 +9,8 @@ config BR2_PACKAGE_LTTNG_MODULES
 	  Make sure your target kernel has the following config
 	  options enabled:
 
-	    * CONFIG_MODULES: loadable module support
+	    * CONFIG_MODULES: loadable module support (not strictly
+	      required when built into the kernel)
 	    * CONFIG_KALLSYMS: this is necessary until the few
 	      required missing symbols are exported to GPL
 	      modules from mainline
@@ -17,6 +19,8 @@ config BR2_PACKAGE_LTTNG_MODULES
 	    * CONFIG_TRACEPOINTS: kernel tracepoint instrumentation
 	      (enabled as a side-effect of any of the
 	      perf/ftrace/blktrace instrumentation features)
+	    * CONFIG_KPROBES (5.7+): use kallsyms for kernel 5.7 and
+	      newer.
 
 	  The following kernel configuration options will
 	  affect the features available from LTTng:
@@ -29,9 +33,11 @@ config BR2_PACKAGE_LTTNG_MODULES
 	    * CONFIG_KALLSYMS_ALL: state dump of mapping between block
 	      device number and name
 
-	  The packaged version is compatible with Linux 2.6.38 to 3.16.
-
 	  http://lttng.org
 
 comment "lttng-modules needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
+
+comment "lttng-modules needs a toolchain w/ headers >= 3.0"
+	depends on BR2_LINUX_KERNEL
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index f04247ab0b..fb253c9bf6 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,8 +1,8 @@
-# From https://lttng.org/files/lttng-modules/lttng-modules-2.11.0.tar.bz2.sha256
-sha256 98af92d8c2e00f4eb63bc637a6967103cf6997434493f36e7a535a491e4fad5f  lttng-modules-2.11.0.tar.bz2
+# From https://lttng.org/files/lttng-modules/lttng-modules-2.13.1.tar.bz2.sha256
+sha256  a7c86d91c9bbe66d27f025aa04b8cfc6d7785ed2fc7ef774930800ee44d7f343  lttng-modules-2.13.1.tar.bz2
 
 # Hash for license files
-sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
-sha256 2f801b7c2494850c3d91da820eb230502dc0192c9d0db024db37ec08d0be1434  mit-license.txt
-sha256 6334b377a5bd56b56a1e8a495830f2d28ed1b5cbedc7493aec9fba979efcdfe1  LICENSE
+sha256  d72921266bc8452a8789f8a04a82755373990d00b7e0b0f1a8edb8f854e94d1c  LICENSES/LGPL-2.1
+sha256  6841c85b94f9dab319356e3aaf9e969fcedad51d3aaadf665bf86f34f4186b62  LICENSES/GPL-2.0
+sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT
+sha256  0133d3c505f176845d7a8b4dcfe006ac615832c43c41e76fe3b365191bafca92  LICENSE
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index b8f9be8656..4c1c50d0a0 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.11.0
+LTTNG_MODULES_VERSION = 2.13.1
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
-LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
+LTTNG_MODULES_LICENSE_FILES = \
+	LICENSES/LGPL-2.1 LICENSES/GPL-2.0 LICENSES/MIT LICENSE
 LTTNG_MODULES_MODULE_MAKE_OPTS = CONFIG_LTTNG=m CONFIG_LTTNG_CLOCK_PLUGIN_TEST=m
 
 $(eval $(kernel-module))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
