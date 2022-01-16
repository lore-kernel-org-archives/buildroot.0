Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A09C433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 10:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9200E40422;
	Sun, 16 Jan 2022 10:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wklhKT-i11Zq; Sun, 16 Jan 2022 10:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B64B440356;
	Sun, 16 Jan 2022 10:43:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2D7B1BF426
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFDF840356
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nSZCq74-9fLy for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 10:43:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CAE6402D3
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 10:43:39 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id v1so17845966ioj.10
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 02:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T4X1ni0yQTn4fqhpF2HEao4xqiDLiMTXRC8ceXGAjok=;
 b=c82Q0SaTlISQz+yczQZU49T0Hy8tfmXZBmql9EFPyosKIFBIBUpVdJNBnUWIABvLsA
 5nxcabKmW0jo5zSrPi90FiOl+aXu6RD9jrnHjxn7S0lVDqlG0SoMNGFGW48KyGZNW1Vp
 KrhOl5Ca2Y7+TVFyhQU6Fdy7T+lNeAcDGjoCTWCY35nVKUzCDOGYtMxBlg+UcklJw0Gr
 bzt4nemXJwBtIUmuB57zQmWicCIRiCcVKsrPSUA+GATZGtPzutinkaoc9tKeoAUDs640
 XtDqaT6d2PzWQOS9frFtLN2UF/fiuyOZpnvGdGIYf50gPtV17a6hFL8KYTVIfUd+tXDs
 xNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T4X1ni0yQTn4fqhpF2HEao4xqiDLiMTXRC8ceXGAjok=;
 b=JlVf136B3em0g/MB2UQOtcvnnfTgl5ir9ZXdGMC2t/xL79r/n+wBwDHAsGwWqEqV4d
 OUGwDbBgHvoTp8YaDa/kUvJaLYHDRz8Q/b7M3e5OUEv0Sr7p2Tw0l2lTWrxX1B9K08EW
 DUIlwkHgk3ybQixa2eGkSrwkbggld4sBRhDYXGADHLaEAGqiTjfQcY6sL3OueVMrKmrm
 MbifgGtDNxPEXGdvAKamSZD2Kj1j6N6N39alhGUpjX3gUD31BkqSaplfQbl60t+I0bP4
 XKqFOBK9iU1lBFyCtDQYJXWnH+lOBa0vVWVAVOZXBMCJBYZ6lrfuzH+2XPG4nbAjpeNV
 vFtA==
X-Gm-Message-State: AOAM5337mxwR6Eot9Q34Z19HcFImPFzuEtPRcq2W9dAFlA/XZplfqfKo
 1iaRW46DE/BnVEnVH2p7htpJp4uOcf8=
X-Google-Smtp-Source: ABdhPJwZbZLHhyTSJcAULb2kmUAzRipu4fSs35oDcEPMVObacGgb6UKShbtLCr4QuL3rXMllBE9eSw==
X-Received: by 2002:a02:84cb:: with SMTP id f69mr4363768jai.254.1642329818096; 
 Sun, 16 Jan 2022 02:43:38 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id g5sm7787504ioo.21.2022.01.16.02.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 02:43:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 03:43:21 -0700
Message-Id: <20220116104321.2696659-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/1] package/qt5/qt5base: disable broken
 qmake sysrootify
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently the qmake gcc sysrootify path logic causes issues with
per-package directories, disable automatic gcc sysroot for qt5base
install and override all qt.conf paths manually to point to their
correct locations.

Redirect HostData to STAGING_DIR as mkspecs need to be available there
instead of the HOST_DIR for cross compilation to work.

Also set qmake target pkg-config path for qt5webengine.

Set PKG_CONFIG_SYSROOT_DIR="/" in qt5webengine to prevent
target pkg-config path mangling.

This fixes some build errors with per-package directories such as:
/home/buildroot/buildroot/output/per-package/qt5base/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
cannot find /lib64/libc.so.6
/home/buildroot/buildroot/output/per-package/qt5base/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
cannot find /usr/lib64/libc_nonshared.a
/home/buildroot/buildroot/output/per-package/qt5base/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
cannot find /lib/ld-linux-aarch64.so.1
collect2: error: ld returned 1 exit status
make[4]: *** [Makefile:122: ../../lib/libQt5Svg.so.5.15.2] Error 1
make[3]: *** [Makefile:48: sub-svg-make_first-ordered] Error 2
make[2]: *** [Makefile:49: sub-src-make_first] Error 2
make[1]: *** [package/pkg-generic.mk:295:
/home/buildroot/buildroot/output/build/qt5svg-5.15.2/.stamp_built]
Error 2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v3 -> v4:
  - fix target pkg-config path mangling
Changes v2 -> v3:
  - set target pkg-config path
Changes v1 -> v2:
  - add some missing overrides to qt.conf.in
---
 package/qt5/qt5base/qmake.conf.in        |  4 ++++
 package/qt5/qt5base/qt.conf.in           | 21 ++++++++++++++++++---
 package/qt5/qt5base/qt5base.mk           |  2 ++
 package/qt5/qt5webengine/qt5webengine.mk |  4 +++-
 4 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5base/qmake.conf.in b/package/qt5/qt5base/qmake.conf.in
index 024c074928..d12f884a55 100644
--- a/package/qt5/qt5base/qmake.conf.in
+++ b/package/qt5/qt5base/qmake.conf.in
@@ -8,6 +8,10 @@
 
 include(../common/linux_device_pre.conf)
 
+# set up pkg-config
+QMAKE_PKG_CONFIG        = $$[QT_HOST_PREFIX]/bin/pkg-config
+QMAKE_PKGCONFIG_PREFIX  = /usr
+
 # modifications to g++-unix.conf
 QMAKE_CC                = $${CROSS_COMPILE}gcc
 QMAKE_CXX               = $${CROSS_COMPILE}g++
diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
index 2215cbd4e1..c92f52ced0 100644
--- a/package/qt5/qt5base/qt.conf.in
+++ b/package/qt5/qt5base/qt.conf.in
@@ -2,6 +2,21 @@
 Prefix=/usr
 HostPrefix=@@HOST_DIR@@
 Sysroot=@@STAGING_DIR@@
-Headers=/usr/include/qt5
-Plugins=/usr/lib/qt/plugins
-Examples=/usr/lib/qt/examples
+SysrootifyPrefix=false
+Binaries=@@STAGING_DIR@@/usr/bin
+Libraries=@@STAGING_DIR@@/usr/lib
+Headers=@@STAGING_DIR@@/usr/include/qt5
+Plugins=@@STAGING_DIR@@/usr/lib/qt/plugins
+Examples=@@STAGING_DIR@@/usr/lib/qt/examples
+Tests=@@STAGING_DIR@@/usr/lib/qt/tests
+Data=@@STAGING_DIR@@
+Translations=@@STAGING_DIR@@/translations
+Documentation=@@STAGING_DIR@@/doc
+ArchData=@@STAGING_DIR@@/usr
+LibraryExecutables=@@STAGING_DIR@@/usr/libexec
+Imports=@@STAGING_DIR@@/usr/imports
+Qml2Imports=@@STAGING_DIR@@/usr/qml
+Settings=@@STAGING_DIR@@/etc
+HostBinaries=@@HOST_DIR@@/bin
+HostLibraries=@@HOST_DIR@@/lib
+HostData=@@STAGING_DIR@@
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bcdf036f00..6c05e710d8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -311,8 +311,10 @@ define QT5BASE_CONFIGURE_CMDS
 		-v \
 		-prefix /usr \
 		-hostprefix $(HOST_DIR) \
+		-hostdatadir $(STAGING_DIR) \
 		-headerdir /usr/include/qt5 \
 		-sysroot $(STAGING_DIR) \
+		-no-gcc-sysroot \
 		-plugindir /usr/lib/qt/plugins \
 		-examplesdir /usr/lib/qt/examples \
 		-no-rpath \
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 64c9c96cc2..06922e4eec 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -44,7 +44,9 @@ endif
 # QtWebengine's build system uses python, but only supports python2. We work
 # around this by forcing python2 early in the PATH, via a python->python2
 # symlink.
-QT5WEBENGINE_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
+QT5WEBENGINE_ENV = \
+	PATH=$(@D)/host-bin:$(BR_PATH) \
+	PKG_CONFIG_SYSROOT_DIR="/"
 define QT5WEBENGINE_PYTHON2_SYMLINK
 	mkdir -p $(@D)/host-bin
 	ln -sf $(HOST_DIR)/bin/python2 $(@D)/host-bin/python
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
