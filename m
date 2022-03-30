Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18701C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 20:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1D8B405AF;
	Wed, 30 Mar 2022 20:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T79zk-obr2Cx; Wed, 30 Mar 2022 20:10:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60C024049E;
	Wed, 30 Mar 2022 20:10:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 372B61BF42D
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 20:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24B0860BFC
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 20:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xur5DEBnX3jp for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 20:10:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEC8C60AEF
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 20:10:18 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout02.t-online.de (Postfix) with SMTP id 0925A337C
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 22:10:16 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.188.174]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nZedu-1XrT5F0; Wed, 30 Mar 2022 22:10:10 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:55610)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nZedt-0005Si-Pp
 for buildroot@buildroot.org; Wed, 30 Mar 2022 22:10:09 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 22:10:09 +0200
Message-Id: <20220330201009.1459182-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1648671010-0000BD0E-AEC30E0D/0/0 CLEAN NORMAL
X-TOI-MSGID: 134d1ea8-c477-457a-82d5-84b112fc0dac
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 0.22.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
http://stellarium.org/release/2022/03/27/stellarium-0.22.0.html

Added upstream patch to fix build error.

Added dependency to qt5charts following upstream commit:
https://github.com/Stellarium/stellarium/commit/5b8fece8d03c64f27f37469f0604efd88d54393d#diff-1e7de1ae2d059d21e1dd75d5812d5a34b0222cef273b7c3a2af62eb747f9d20aR487

Added configure option to disable qt5webengine support, the package is
broken: https://bugs.busybox.net/show_bug.cgi?id=14681

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...uilding-Stellarium-without-scripting.patch | 49 +++++++++++++++++++
 package/stellarium/Config.in                  |  1 +
 package/stellarium/stellarium.hash            |  4 +-
 package/stellarium/stellarium.mk              |  4 +-
 4 files changed, 55 insertions(+), 3 deletions(-)
 create mode 100644 package/stellarium/0001-Fixed-building-Stellarium-without-scripting.patch

diff --git a/package/stellarium/0001-Fixed-building-Stellarium-without-scripting.patch b/package/stellarium/0001-Fixed-building-Stellarium-without-scripting.patch
new file mode 100644
index 0000000000..57f15a8eff
--- /dev/null
+++ b/package/stellarium/0001-Fixed-building-Stellarium-without-scripting.patch
@@ -0,0 +1,49 @@
+From 710d1c5acd9e962260ce395474819ded2eb6ce12 Mon Sep 17 00:00:00 2001
+From: "Alexander V. Wolf" <alex.v.wolf@gmail.com>
+Date: Tue, 29 Mar 2022 18:57:06 +0700
+Subject: [PATCH] Fixed building Stellarium without scripting
+
+Downloaded from upstream commit:
+https://github.com/Stellarium/stellarium/commit/710d1c5acd9e962260ce395474819ded2eb6ce12
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ plugins/Calendars/src/Calendars.cpp | 2 ++
+ plugins/Calendars/src/Calendars.hpp | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/plugins/Calendars/src/Calendars.cpp b/plugins/Calendars/src/Calendars.cpp
+index e5d89a4c063..4df6caee42e 100644
+--- a/plugins/Calendars/src/Calendars.cpp
++++ b/plugins/Calendars/src/Calendars.cpp
+@@ -251,6 +251,7 @@ void Calendars::init()
+ 	}
+ }
+ 
++#ifdef ENABLE_SCRIPTING
+ // Add calendar as scriptable object! Some scripting functions won't work though, as they use object types unknown to the scripting engine.
+ void Calendars::makeCalendarsScriptable(StelScriptMgr *ssm)
+ {
+@@ -260,6 +261,7 @@ void Calendars::makeCalendarsScriptable(StelScriptMgr *ssm)
+ 		ssm->addObject(cal);
+ 	}
+ }
++#endif
+ 
+ void Calendars::loadSettings()
+ {
+diff --git a/plugins/Calendars/src/Calendars.hpp b/plugins/Calendars/src/Calendars.hpp
+index 461ae1bd9ba..4696183d9d2 100644
+--- a/plugins/Calendars/src/Calendars.hpp
++++ b/plugins/Calendars/src/Calendars.hpp
+@@ -145,8 +145,10 @@ class Calendars : public StelModule
+ 	//! TODO: ADD HERE: Chinese, NewHinduSolar, NewHinduLunar, ...
+ 	Calendar* getCal(QString name);
+ 
++	#ifdef ENABLE_SCRIPTING
+ 	//! to be called after program startup, when StelScriptMgr has been set up.
+ 	void makeCalendarsScriptable(StelScriptMgr *ssm);
++	#endif
+ 
+ signals:
+ 	//void jdChanged(double jd);
diff --git a/package/stellarium/Config.in b/package/stellarium/Config.in
index 5922162d44..566f8edc83 100644
--- a/package/stellarium/Config.in
+++ b/package/stellarium/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_STELLARIUM
 	select BR2_PACKAGE_QT5BASE_OPENGL
 	select BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5CHARTS
 	select BR2_PACKAGE_QT5LOCATION
 	select BR2_PACKAGE_QT5MULTIMEDIA
 	select BR2_PACKAGE_ZLIB
diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index c3f2e0e8d4..f8185869be 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,5 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha1  a3396c403050e073c592da695faeb048c1d5e19b  stellarium-0.21.3.tar.gz
-sha256  8ac6c054d12f136fe0d5c0deaaa8d7b69dd2a462be1711a187364574aef97e7f  stellarium-0.21.3.tar.gz
+sha1  c4a00fd756c66fb7df633f496dd3be4300bf1d2b   stellarium-0.22.0.tar.gz
+sha256  0b4dc23cf9054b5e76cd9bc5ad68e172eb221999e90af37e93667d04fe78c885  stellarium-0.22.0.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index ca5c07b2a7..1226b1190d 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,18 +4,20 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.21.3
+STELLARIUM_VERSION = 0.22.0
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
 STELLARIUM_DEPENDENCIES = \
 	qt5base \
+	qt5charts \
 	qt5location \
 	qt5multimedia \
 	zlib
 STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
 	-DENABLE_NLS=OFF \
+	-DENABLE_QTWEBENGINE=OFF \
 	-DUSE_SYSTEM_ZLIB=ON
 
 ifeq ($(BR2_PACKAGE_QT5SCRIPT),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
