Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB52EE4990
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB71D406E7;
	Tue, 30 Dec 2025 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Be0HU4qYoiwZ; Tue, 30 Dec 2025 18:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC3244043E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118356;
	bh=xOP5PhePiIMqKSito5wOzSXkQCyRnDrKVsxtO8C2nGc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C/lxQmR+uQPNH4a1H7fRSdHnkrztXAkEbCxnDuHpq4bNB/G5RtSEEmTrFQHfG+hWn
	 oNoMgruZpjPYD2VGR7nR4G0rBYOAZGiJ4RSqD7OZ1VHLeuMUqBoxLL7wu6yd2Lb0Hw
	 v1D+z9mFF9t8pS1SbRHxppplQQur4lE3qrRVklCIiZH7ftBOyczMkkpmlYA6CX1Bhj
	 J0A54WcYZ1asYzn6WiEMg5qm1EQ3todzR11j6KYPEo00hq5mg8MF1t57sSjUHNppDG
	 cVXAxtWJ/Ycit2DiAeolLs2KP4V+MUGWMjHNcCmiZwNrv0RGsjc1OwC0CEc3nqOAua
	 V2aefc9iISbyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC3244043E;
	Tue, 30 Dec 2025 18:12:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C094C177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A78C3407D0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YG6WRoOObn8w for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9595403B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9595403B0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C857C87C40; Tue, 30 Dec 2025 18:12:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebabcd6263bff13d2a809349c6a044191efc60b9
X-Git-Newrev: f3c150c78556d0cae299a28fa2b677821bc82606
X-Patchwork-Hint: ignore
Message-Id: <20251230181234.C857C87C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qjson: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f3c150c78556d0cae299a28fa2b677821bc82606
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/flavio/qjson/commit/6d188cb199a5248889689bd92b757cf0c17cfa27
"This project is archived. QJson was originally created when Qt3 and Qt4
 lacked robust JSON support.

 Since Qt5, JSON support is included in the native Qt library SDK, making
 this project obsolete."

The package is broken with cmake 4 and no other package depends on it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy         |  6 ++++++
 DEVELOPERS               |  1 -
 package/Config.in        |  1 -
 package/qjson/Config.in  |  8 --------
 package/qjson/qjson.hash |  3 ---
 package/qjson/qjson.mk   | 14 --------------
 6 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a0dad6461d..3e402e3161 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_QJSON
+	bool "qjson has been removed"
+	select BR2_LEGACY
+	help
+	  qjson was deprecated upstream and has been removed
+
 config BR2_PACKAGE_OPENTRACING_CPP
 	bool "opentracing-cpp has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 9775c85556..f71fdc7a3a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3550,7 +3550,6 @@ F:	package/libusb/
 F:	package/libusb-compat/
 F:	package/proj/
 F:	package/python-iniparse/
-F:	package/qjson/
 F:	package/qt6/qt6core5compat/
 F:	package/quazip/
 F:	package/shapelib/
diff --git a/package/Config.in b/package/Config.in
index 857266c8f8..02f9f00ecd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -383,7 +383,6 @@ comment "QT libraries and helper libraries"
 	source "package/grantlee/Config.in"
 	source "package/kf5/Config.in"
 	source "package/qextserialport/Config.in"
-	source "package/qjson/Config.in"
 	source "package/quazip/Config.in"
 	source "package/qwt/Config.in"
 	source "package/simple-mail/Config.in"
diff --git a/package/qjson/Config.in b/package/qjson/Config.in
deleted file mode 100644
index adb06cddc0..0000000000
--- a/package/qjson/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_QJSON
-	bool "qjson"
-	depends on BR2_PACKAGE_QT5
-	help
-	  QJson is a Qt-based library that maps JSON data to
-	  QVariant objects and vice versa.
-
-	  http://qjson.sourceforge.net
diff --git a/package/qjson/qjson.hash b/package/qjson/qjson.hash
deleted file mode 100644
index ab22350e61..0000000000
--- a/package/qjson/qjson.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  e812617477f3c2bb990561767a4cd8b1d3803a52018d4878da302529552610d4  qjson-0.9.0.tar.gz
-sha256  758a0cd48d2bec59cbd04ab616737b7aa0cdceac87508adbc9468715ac90722b  COPYING.lib
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
deleted file mode 100644
index 718d6622a8..0000000000
--- a/package/qjson/qjson.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# qjson
-#
-################################################################################
-
-QJSON_VERSION = 0.9.0
-QJSON_SITE = $(call github,flavio,qjson,$(QJSON_VERSION))
-QJSON_INSTALL_STAGING = YES
-QJSON_DEPENDENCIES = qt5base
-QJSON_LICENSE = LGPL-2.1
-QJSON_LICENSE_FILES = COPYING.lib
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
