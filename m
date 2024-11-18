Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B726E7717F
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35CFE60729;
	Sun,  8 Dec 2024 13:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chTUzlh5bPNh; Sun,  8 Dec 2024 13:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ADA560731
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ADA560731;
	Sun,  8 Dec 2024 13:07:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13BE7ED2
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B625608C5
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMUbEROKnjcd for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF446072C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BF446072C
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1904E86B73; Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Nov 2024 23:10:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9105e685464ff12f34a8b852562793edd59dfc16
X-Git-Newrev: ba65c4dd4b0745eecd5692bbeba82907cb0df5eb
X-Patchwork-Hint: ignore
Message-Id: <20241208130652.1904E86B73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libecoli: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba65c4dd4b0745eecd5692bbeba82907cb0df5eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new smart library for CLI / command line.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
[Julien:
 - reworded Config.in help string to match upstream
 - select BR2_PACKAGE_LIBEDIT (rather than depends on)
 - add libedit "depends on" dependencies
 - disable static builds
 - add Config.in comment
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libecoli/Config.in     | 17 +++++++++++++++++
 package/libecoli/libecoli.hash |  3 +++
 package/libecoli/libecoli.mk   | 17 +++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3945803d53..a44c79e66a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3285,6 +3285,7 @@ F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
 F:	package/dpdk/
+F:	package/libecoli/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/package/Config.in b/package/Config.in
index 1eb5e1e020..278c82bb05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2337,6 +2337,7 @@ menu "Text and terminal handling"
 	source "package/icu/Config.in"
 	source "package/inih/Config.in"
 	source "package/libcli/Config.in"
+	source "package/libecoli/Config.in"
 	source "package/libedit/Config.in"
 	source "package/libenca/Config.in"
 	source "package/libestr/Config.in"
diff --git a/package/libecoli/Config.in b/package/libecoli/Config.in
new file mode 100644
index 0000000000..af4784c3bf
--- /dev/null
+++ b/package/libecoli/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBECOLI
+	bool "libecoli"
+	depends on BR2_USE_MMU # libedit
+	depends on BR2_USE_WCHAR # libedit
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBEDIT
+	help
+	  libecoli stands for Extensible COmmand LIne library.
+
+	  This library provides helpers to build interactive command
+	  line interfaces.
+
+	  https://github.com/rjarry/libecoli/
+
+comment "libecoli needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
new file mode 100644
index 0000000000..0540ef7270
--- /dev/null
+++ b/package/libecoli/libecoli.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  0da8f953e054dd2ba75a0d1dcbbc8830b76747282035e1d1de6082ec3bb6f995  libecoli-0.2.0.tar.gz
+sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
new file mode 100644
index 0000000000..c46f62b523
--- /dev/null
+++ b/package/libecoli/libecoli.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libecoli
+#
+################################################################################
+
+LIBECOLI_VERSION = 0.2.0
+LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
+LIBECOLI_INSTALL_STAGING = YES
+LIBECOLI_LICENSE = BSD-3-Clause
+LIBECOLI_LICENSE_FILES = LICENSE
+
+LIBECOLI_DEPENDENCIES = \
+	host-pkgconf \
+	libedit
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
