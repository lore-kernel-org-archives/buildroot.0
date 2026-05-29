Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826E5CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 550E083BB6;
	Fri, 29 May 2026 08:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vk3Zbf-_VQT1; Fri, 29 May 2026 08:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BEFB83CAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043803;
	bh=MAk3TfDo5gxYbXhbJ63ACuKVerWPcTIisyVrUdP4KJk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k03GpnhkjrSSywOKay0NQvfHVbbhwEBEmOh4Er4OaGwdYDquJnOvdRvhzj0fGyYS0
	 YB47bHB64ozIE++Tx05Jp5W02/XP6uALIZQTdWz9FI39UjNxOoeAEyrb2F0Mg1gkrq
	 ktwpVD5V6K77VCPisz7nhOB1xSnRIKODaRKKcKJO7Cmzp5RGsyX6N7P34eg6BSaMov
	 h4AoD4SIVSOxajSyVOpqQhA+lTOEmIthQzDUU5wd0A1tbCEsBjH8VrvuAnjpyFVKQL
	 /Yt7KWYAG+8aAPUINW7EXsuMJYIJ2Ri1V//ETVRauq93+8g6l4zVQ30+HsY7Jot5DL
	 gRXVu5rCR1nNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BEFB83CAB;
	Fri, 29 May 2026 08:36:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D63F288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E58E42064
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vduaGB7OxvzE for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DE1741FEB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DE1741FEB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27EC0873A0; Fri, 29 May 2026 08:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:32:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e61a94e31ac6072d3dc4eced8cc8ccffe5143a8b
X-Git-Newrev: fd4b24b8d9a825d4415e0d564b4597a0b718d642
X-Patchwork-Hint: ignore
Message-Id: <20260529083629.27EC0873A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/phidgetwebservice: remove package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fd4b24b8d9a825d4415e0d564b4597a0b718d642
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

As discussed on the mailinglist:
https://lists.buildroot.org/pipermail/buildroot/2026-April/799929.html

Fixes:
https://autobuild.buildroot.net/results/ca7/ca7b93d6b2f74f7ef6b697d9289f8a49771eb4be/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy                                 |  8 ++++++++
 DEVELOPERS                                       |  1 -
 package/Config.in                                |  1 -
 package/phidgetwebservice/Config.in              | 23 -----------------------
 package/phidgetwebservice/phidgetwebservice.hash |  3 ---
 package/phidgetwebservice/phidgetwebservice.mk   | 14 --------------
 6 files changed, 8 insertions(+), 42 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 37c17edd49..f3b4c57a7d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_PHIDGETWEBSERVICE
+	bool "phidgetwebservice"
+	select BR2_LEGACY
+	help
+	  phidgetwebservice was removed from Buildroot as it was
+	  insufficiently maintained. It can be re-added if someone
+	  volunteers to maintain it.
+
 config BR2_PACKAGE_DAQ
 	bool "daq removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 8da99a7e8f..321b9dfe80 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1727,7 +1727,6 @@ F:	arch/Config.in.xtensa
 F:	package/autofs/
 F:	package/dawgdic/
 F:	package/libphidget/
-F:	package/phidgetwebservice/
 F:	package/rapidxml/
 
 N:	Joris Offouga <offougajoris@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index d6a6490c6c..daab795124 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2580,7 +2580,6 @@ endif
 	source "package/p910nd/Config.in"
 	source "package/parprouted/Config.in"
 	source "package/passt/Config.in"
-	source "package/phidgetwebservice/Config.in"
 	source "package/phytool/Config.in"
 	source "package/pimd/Config.in"
 	source "package/pixiewps/Config.in"
diff --git a/package/phidgetwebservice/Config.in b/package/phidgetwebservice/Config.in
deleted file mode 100644
index b052f180f0..0000000000
--- a/package/phidgetwebservice/Config.in
+++ /dev/null
@@ -1,23 +0,0 @@
-config BR2_PACKAGE_PHIDGETWEBSERVICE
-	bool "phidgetwebservice"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb, libphidget
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libphidget -> libusb
-	depends on !BR2_STATIC_LIBS # libphidget
-	select BR2_PACKAGE_LIBPHIDGET
-	help
-	  phidgetwebservice (the Phidget WebService) provides an HTTP
-	  front-end to the libphidget device control API. This
-	  provides an alternative to the libphidget C linkage
-	  interface for controlling locally attached Phidgets USB
-	  devices and it also allows you to control Phidget USB
-	  devices remotely when the host running the phidgetwebservice
-	  has an exposed network interface.
-
-	  The phidgetwebservice client program uses the libphidget
-	  HTTP functions to send commands to the phidgetwebservice.
-
-	  http://phidgets.com/
-
-comment "phidgetwebservice needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/phidgetwebservice/phidgetwebservice.hash b/package/phidgetwebservice/phidgetwebservice.hash
deleted file mode 100644
index 49017f2994..0000000000
--- a/package/phidgetwebservice/phidgetwebservice.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  aa63cbd2ab87182d6e0c05d553ee4c8cc73d268516d8e0a1e881baed391c081d  phidgetwebservice_2.1.9.20190409.tar.gz
-sha256  ea8af5e789cb2d4e9b10bce3874982ade163b749b6bfbdb32e2df21c4d106de1  COPYING
diff --git a/package/phidgetwebservice/phidgetwebservice.mk b/package/phidgetwebservice/phidgetwebservice.mk
deleted file mode 100644
index b5f335c4ec..0000000000
--- a/package/phidgetwebservice/phidgetwebservice.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# phidgetwebservice
-#
-################################################################################
-
-PHIDGETWEBSERVICE_VERSION = 2.1.9.20190409
-PHIDGETWEBSERVICE_SOURCE = phidgetwebservice_$(PHIDGETWEBSERVICE_VERSION).tar.gz
-PHIDGETWEBSERVICE_SITE = https://www.phidgets.com/downloads/phidget21/servers/linux/phidgetwebservice
-PHIDGETWEBSERVICE_DEPENDENCIES = libphidget
-PHIDGETWEBSERVICE_LICENSE = LGPL-3.0
-PHIDGETWEBSERVICE_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
