Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45464C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B30141BEE;
	Thu, 28 Apr 2022 21:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMmu0QCXaUH6; Thu, 28 Apr 2022 21:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC84541BEA;
	Thu, 28 Apr 2022 21:14:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 856EF1BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7401E82ED2
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8i4oGVm6cHy for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:14:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C2EE82CD4
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:14:01 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout07.t-online.de (Postfix) with SMTP id 79E8CAE06
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 23:13:58 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.204.173]) by fwd87.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nkBSW-12T8uv0; Thu, 28 Apr 2022 23:13:56 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:55368)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nkBSV-0000gk-Uq
 for buildroot@buildroot.org; Thu, 28 Apr 2022 23:13:56 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 23:13:55 +0200
Message-Id: <20220428211355.3933644-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1651180436-00000271-7DC6971C/0/0 CLEAN NORMAL
X-TOI-MSGID: d2ba9b9e-5f15-4b30-abd2-bf42bc43f5de
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 0.22.1
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
http://stellarium.org/release/2022/04/16/stellarium-0.22.1.html

Removed backported patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...uilding-Stellarium-without-scripting.patch | 49 -------------------
 package/stellarium/stellarium.hash            |  4 +-
 package/stellarium/stellarium.mk              |  2 +-
 3 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 package/stellarium/0001-Fixed-building-Stellarium-without-scripting.patch

diff --git a/package/stellarium/0001-Fixed-building-Stellarium-without-scripting.patch b/package/stellarium/0001-Fixed-building-Stellarium-without-scripting.patch
deleted file mode 100644
index 57f15a8eff..0000000000
--- a/package/stellarium/0001-Fixed-building-Stellarium-without-scripting.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 710d1c5acd9e962260ce395474819ded2eb6ce12 Mon Sep 17 00:00:00 2001
-From: "Alexander V. Wolf" <alex.v.wolf@gmail.com>
-Date: Tue, 29 Mar 2022 18:57:06 +0700
-Subject: [PATCH] Fixed building Stellarium without scripting
-
-Downloaded from upstream commit:
-https://github.com/Stellarium/stellarium/commit/710d1c5acd9e962260ce395474819ded2eb6ce12
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- plugins/Calendars/src/Calendars.cpp | 2 ++
- plugins/Calendars/src/Calendars.hpp | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/plugins/Calendars/src/Calendars.cpp b/plugins/Calendars/src/Calendars.cpp
-index e5d89a4c063..4df6caee42e 100644
---- a/plugins/Calendars/src/Calendars.cpp
-+++ b/plugins/Calendars/src/Calendars.cpp
-@@ -251,6 +251,7 @@ void Calendars::init()
- 	}
- }
- 
-+#ifdef ENABLE_SCRIPTING
- // Add calendar as scriptable object! Some scripting functions won't work though, as they use object types unknown to the scripting engine.
- void Calendars::makeCalendarsScriptable(StelScriptMgr *ssm)
- {
-@@ -260,6 +261,7 @@ void Calendars::makeCalendarsScriptable(StelScriptMgr *ssm)
- 		ssm->addObject(cal);
- 	}
- }
-+#endif
- 
- void Calendars::loadSettings()
- {
-diff --git a/plugins/Calendars/src/Calendars.hpp b/plugins/Calendars/src/Calendars.hpp
-index 461ae1bd9ba..4696183d9d2 100644
---- a/plugins/Calendars/src/Calendars.hpp
-+++ b/plugins/Calendars/src/Calendars.hpp
-@@ -145,8 +145,10 @@ class Calendars : public StelModule
- 	//! TODO: ADD HERE: Chinese, NewHinduSolar, NewHinduLunar, ...
- 	Calendar* getCal(QString name);
- 
-+	#ifdef ENABLE_SCRIPTING
- 	//! to be called after program startup, when StelScriptMgr has been set up.
- 	void makeCalendarsScriptable(StelScriptMgr *ssm);
-+	#endif
- 
- signals:
- 	//void jdChanged(double jd);
diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 2c2427bf0e..12cc3c5375 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,5 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha1  c4a00fd756c66fb7df633f496dd3be4300bf1d2b  stellarium-0.22.0.tar.gz
-sha256  0b4dc23cf9054b5e76cd9bc5ad68e172eb221999e90af37e93667d04fe78c885  stellarium-0.22.0.tar.gz
+sha1  55b5915dfb616b9748e1c2d2de6150f7159cf36c   stellarium-0.22.1.tar.gz
+sha256  61a595ecc345dcc7517359573d0dc772e67ecaf6d52fefab142a77c92cf3fa24  stellarium-0.22.0.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 1226b1190d..9c24263a43 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.22.0
+STELLARIUM_VERSION = 0.22.1
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
