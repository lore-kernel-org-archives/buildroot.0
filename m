Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512EEC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 08:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D357440904;
	Mon, 25 Jul 2022 08:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D357440904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6wb2RHmz9sk; Mon, 25 Jul 2022 08:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65C2640897;
	Mon, 25 Jul 2022 08:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65C2640897
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 476D61BF9AC
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 08:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30C28404A8
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 08:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30C28404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PhHahtLrDMRi for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 08:43:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60B1A401F1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60B1A401F1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 55E7A85D2D; Mon, 25 Jul 2022 08:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 10:38:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 257881e6e99b766f2a9466c7713e48cbcb96161c
X-Git-Newrev: 94d8764ef938936aa5432f1f13bd1b2d8b62a159
X-Patchwork-Hint: ignore
Message-Id: <20220725082948.55E7A85D2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hawktracer: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94d8764ef938936aa5432f1f13bd1b2d8b62a159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HawkTracer is a highly portable, low-overhead, configurable profiling
tool

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/hawktracer/Config.in       | 25 ++++++++++++++++++++++
 package/hawktracer/hawktracer.hash |  3 +++
 package/hawktracer/hawktracer.mk   | 44 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 74 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cd1e0e69a6..2a07ae100b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1094,6 +1094,7 @@ F:	configs/friendlyarm_nanopi_r2s_defconfig
 F:	package/cctz/
 F:	package/faad2/
 F:	package/fdk-aac/
+F:	package/hawktracer/
 F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
diff --git a/package/Config.in b/package/Config.in
index 455c69bac9..bd3d167487 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1734,6 +1734,7 @@ endmenu
 
 menu "Logging"
 	source "package/glog/Config.in"
+	source "package/hawktracer/Config.in"
 	source "package/liblog4c-localtime/Config.in"
 	source "package/liblogging/Config.in"
 	source "package/log4cplus/Config.in"
diff --git a/package/hawktracer/Config.in b/package/hawktracer/Config.in
new file mode 100644
index 0000000000..7648707404
--- /dev/null
+++ b/package/hawktracer/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_HAWKTRACER
+	bool "hawktracer"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  HawkTracer is a highly portable, low-overhead, configurable
+	  profiling tool built in Amazon Video for getting performance
+	  metrics from low-end devices.
+
+	  https://www.hawktracer.org/
+
+if BR2_PACKAGE_HAWKTRACER
+
+config BR2_PACKAGE_HAWKTRACER_TCP_LISTENER
+	bool "TCP listener"
+	default y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
+comment "TCP listener needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
+
+comment "hawktracer needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/hawktracer/hawktracer.hash b/package/hawktracer/hawktracer.hash
new file mode 100644
index 0000000000..87aa67c4b6
--- /dev/null
+++ b/package/hawktracer/hawktracer.hash
@@ -0,0 +1,3 @@
+# Computed locally
+sha256  b6c7fdfbe8178bc7ba49ef840ec18a92d1488ad73ac9f64d2a09042410ad3ef4  hawktracer-e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8.tar.gz
+sha256  2f377333e64ad08ad3afec8ed6c2c96ced2a6d7d67443eb2784a931bb7b3fd59  LICENSE
diff --git a/package/hawktracer/hawktracer.mk b/package/hawktracer/hawktracer.mk
new file mode 100644
index 0000000000..f4654b2274
--- /dev/null
+++ b/package/hawktracer/hawktracer.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# hawktracer
+#
+################################################################################
+
+HAWKTRACER_VERSION = e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8
+HAWKTRACER_SITE = $(call github,amzn,hawktracer,$(HAWKTRACER_VERSION))
+HAWKTRACER_LICENSE = MIT
+HAWKTRACER_LICENSE_FILES = LICENSE
+HAWKTRACER_INSTALL_STAGING = YES
+
+HAWKTRACER_CONF_OPTS = \
+	-DENABLE_ASAN=OFF \
+	-DENABLE_TESTS=OFF \
+	-DENABLE_CODE_COVERAGE=OFF \
+	-DENABLE_BENCHMARKS=OFF \
+	-DENABLE_DOC=OFF \
+	-DENABLE_PYTHON_BINDINGS=OFF \
+	-DENABLE_MAINTAINER_MODE=OFF \
+	-DENABLE_RELEASE_MODE=OFF \
+	-DENABLE_CLIENT=OFF \
+	-DENABLE_EXAMPLES=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+HAWKTRACER_CONF_OPTS += -DBUILD_STATIC_LIB=ON
+else
+HAWKTRACER_CONF_OPTS += -DBUILD_STATIC_LIB=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_HAWKTRACER_TCP_LISTENER),y)
+HAWKTRACER_CONF_OPTS += -DENABLE_TCP_LISTENER=ON
+else
+HAWKTRACER_CONF_OPTS += -DENABLE_TCP_LISTENER=OFF
+endif
+
+# Enable threads support if supported by toolchain
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+HAWKTRACER_CONF_OPTS += -DENABLE_THREADS=ON
+else
+HAWKTRACER_CONF_OPTS += -DENABLE_THREADS=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
