Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A381C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 09:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3C0542273;
	Sat, 18 Dec 2021 09:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XIXJkeLZ14Py; Sat, 18 Dec 2021 09:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1F0E42265;
	Sat, 18 Dec 2021 09:38:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C26591BF954
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 09:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFBBC42214
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 09:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tq9eP1HlHJse for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 09:38:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7F594220C
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 09:38:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A4EBE8182C; Sat, 18 Dec 2021 09:33:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 10:37:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3965f09cb427af411055a783cd14b501b2b28285
X-Git-Newrev: 1e4050b2d0372e1b47b57cc4210e3da5cb8ec3de
X-Patchwork-Hint: ignore
Message-Id: <20211218093311.A4EBE8182C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenaptx: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e4050b2d0372e1b47b57cc4210e3da5cb8ec3de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds support for libopenaptx, an aptX encoder and decoder.

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
[Thomas:
- drop patches that added a CMakeLists.txt and instead use the
Makefile provided by upstream.
- add !BR2_STATIC_LIBS dependency
- add entry in DEVELOPERS file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/libopenaptx/Config.in        | 14 ++++++++++++++
 package/libopenaptx/libopenaptx.hash |  3 +++
 package/libopenaptx/libopenaptx.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d7639ae812..61e3ea4381 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2966,6 +2966,9 @@ F:	support/testing/tests/package/test_libftdi1.py
 F:	support/testing/tests/package/test_python_can.py
 F:	utils/scanpypi
 
+N:	Yunhao Tian <t123yh.xyz@gmail.com>
+F:	package/libopenaptx/
+
 N:	Zoltan Gyarmati <zgyarmati@zgyarmati.de>
 F:	package/crudini/
 F:	package/grantlee/
diff --git a/package/Config.in b/package/Config.in
index c61ef472e3..bcb23132c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1744,6 +1744,7 @@ menu "Multimedia"
 	source "package/libmms/Config.in"
 	source "package/libmpeg2/Config.in"
 	source "package/libogg/Config.in"
+	source "package/libopenaptx/Config.in"
 	source "package/libopenh264/Config.in"
 	source "package/libopusenc/Config.in"
 	source "package/libtheora/Config.in"
diff --git a/package/libopenaptx/Config.in b/package/libopenaptx/Config.in
new file mode 100644
index 0000000000..46ff08a2d1
--- /dev/null
+++ b/package/libopenaptx/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBOPENAPTX
+	bool "libopenaptx"
+	# unconditionallly builds a shared lib
+	depends on !BR2_STATIC_LIBS
+	help
+	  This is Open Source implementation of Audio Processing
+	  Technology codec (aptX) originally derived from ffmpeg 4.0
+	  project and licensed under GPLv3+. This codec is mainly used
+	  in Bluetooth A2DP profile.
+
+	  https://github.com/pali/libopenaptx
+
+comment "libopenaptx needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libopenaptx/libopenaptx.hash b/package/libopenaptx/libopenaptx.hash
new file mode 100644
index 0000000000..76b4e66c9b
--- /dev/null
+++ b/package/libopenaptx/libopenaptx.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
+sha256 a19b3b642def6f86441b73dd4efda6e6f13d49e7e2d6e5e91cc7eb464ebb505a libopenaptx-0.2.1.tar.gz
diff --git a/package/libopenaptx/libopenaptx.mk b/package/libopenaptx/libopenaptx.mk
new file mode 100644
index 0000000000..a4f58050b7
--- /dev/null
+++ b/package/libopenaptx/libopenaptx.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# libogg
+#
+################################################################################
+
+LIBOPENAPTX_VERSION = 0.2.1
+LIBOPENAPTX_SITE = $(call github,pali,libopenaptx,$(LIBOPENAPTX_VERSION))
+LIBOPENAPTX_LICENSE = GPL-3.0
+LIBOPENAPTX_LICENSE_FILES = COPYING
+LIBOPENAPTX_INSTALL_STAGING = YES
+
+define LIBOPENAPTX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define LIBOPENAPTX_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr install
+endef
+
+define LIBOPENAPTX_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(STAGING_DIR) \
+		PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
