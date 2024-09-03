Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7CAE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72D8F84720;
	Fri,  6 Sep 2024 20:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fancGNFlBv4D; Fri,  6 Sep 2024 20:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0805849AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0805849AC;
	Fri,  6 Sep 2024 20:05:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B622C1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2DA3407D6
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNmI1zO97JCH for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B553A4098E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B553A4098E
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD344869F2; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:38:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ce0861a58582fa1dfbc31277d163e023028e8d9
X-Git-Newrev: 5cc0592bfe9ce92aff5975a0bb12d8a1460ff072
X-Patchwork-Hint: ignore
Message-Id: <20240906195859.AD344869F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rgbmatrix: new package
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
Content-Type: multipart/mixed; boundary="===============4612449121499167626=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4612449121499167626==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5cc0592bfe9ce92aff5975a0bb12d8a1460ff072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "rgbmatrix" python module is the Python binding for
rpi-rgb-led-matrix, built from the same source repository.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
[yann.morin.1998@free.fr:
  - add comment for propagated dependencies
  - add comment on missing dependencies
  - drop comment at end of _VERSION line
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                |  1 +
 package/python-rgbmatrix/Config.in               | 14 ++++++++++++++
 package/python-rgbmatrix/python-rgbmatrix.hash   |  3 +++
 package/python-rgbmatrix/python-rgbmatrix.mk     | 24 ++++++++++++++++++++++++
 package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk |  1 +
 5 files changed, 43 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 07bd1499d8..b3665a7569 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1343,6 +1343,7 @@ menu "External python modules"
 	source "package/python-requests-oauthlib/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rfc3987/Config.in"
+	source "package/python-rgbmatrix/Config.in"
 	source "package/python-rpds-py/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
diff --git a/package/python-rgbmatrix/Config.in b/package/python-rgbmatrix/Config.in
new file mode 100644
index 0000000000..32fd6d191a
--- /dev/null
+++ b/package/python-rgbmatrix/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_RGBMATRIX
+	bool "python-rgbmatrix"
+	depends on BR2_aarch64 || BR2_arm  # rpi-rgb-led-matrix
+	depends on BR2_INSTALL_LIBSTDCPP  # rpi-rgb-led-matrix
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # rpi-rgb-led-matrix
+	depends on !BR2_STATIC_LIBS  # rpi-rgb-led-matrix
+	select BR2_PACKAGE_HOST_PYTHON_CYTHON
+	select BR2_PACKAGE_RPI_RGB_LED_MATRIX
+
+comment "python-rgbmatrix needs a toolchain w/ C++, threads, dynamic libraries"
+	depends on BR2_aarch64 || BR2_arm
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
diff --git a/package/python-rgbmatrix/python-rgbmatrix.hash b/package/python-rgbmatrix/python-rgbmatrix.hash
new file mode 100644
index 0000000000..175081eb5d
--- /dev/null
+++ b/package/python-rgbmatrix/python-rgbmatrix.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  9a6da5b0ad730883a5fa18afc59b1297b4b05eb581c2c14ae50a3583296a4bed  python-rgbmatrix-f55736f7595bc028451658996eedea9742688bbc.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-rgbmatrix/python-rgbmatrix.mk b/package/python-rgbmatrix/python-rgbmatrix.mk
new file mode 100644
index 0000000000..2bd5bc97b7
--- /dev/null
+++ b/package/python-rgbmatrix/python-rgbmatrix.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# python-rgbmatrix
+#
+################################################################################
+
+# When updating the version, please also update rpi-rgb-led-matrix
+PYTHON_RGBMATRIX_VERSION = f55736f7595bc028451658996eedea9742688bbc  # 2024-08-18
+PYTHON_RGBMATRIX_SITE = $(call github,hzeller,rpi-rgb-led-matrix,$(PYTHON_RGBMATRIX_VERSION))
+PYTHON_RGBMATRIX_LICENSE = GPL-2.0
+PYTHON_RGBMATRIX_LICENSE_FILES = COPYING
+PYTHON_RGBMATRIX_INSTALL_STAGING = YES
+PYTHON_RGBMATRIX_SETUP_TYPE = setuptools
+PYTHON_RGBMATRIX_SUBDIR = bindings/python
+PYTHON_RGBMATRIX_DEPENDENCIES = host-python-cython rpi-rgb-led-matrix
+
+# Generate bindings with cython
+define PYTHON_RGBMATRIX_CYTHON
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/bindings/python/rgbmatrix \
+		CYTHON=$(HOST_DIR)/bin/cython all
+endef
+PYTHON_RGBMATRIX_PRE_BUILD_HOOKS += PYTHON_RGBMATRIX_CYTHON
+
+$(eval $(python-package))
diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
index c0b2e61c79..593bc96b5d 100644
--- a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
+++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version, please also update python-rgbmatrix
 RPI_RGB_LED_MATRIX_VERSION = f55736f7595bc028451658996eedea9742688bbc
 RPI_RGB_LED_MATRIX_SITE = $(call github,hzeller,rpi-rgb-led-matrix,$(RPI_RGB_LED_MATRIX_VERSION))
 RPI_RGB_LED_MATRIX_LICENSE = GPL-2.0

--===============4612449121499167626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4612449121499167626==--
