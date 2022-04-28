Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8197C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F52540C56;
	Thu, 28 Apr 2022 21:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mq-49-mfKE2Z; Thu, 28 Apr 2022 21:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CC4740A59;
	Thu, 28 Apr 2022 21:33:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A295E1BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B0C083E81
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xw7rmhVtrH1r for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:33:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4DD882C3E
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:33:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9CE1E846AF; Thu, 28 Apr 2022 21:23:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 23:24:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29bd9004b48e75c84bb83918f40b40ba6ec65ca6
X-Git-Newrev: 5de73f0b685d7c2d096e3d28a50f2e89ed68c52c
X-Patchwork-Hint: ignore
Message-Id: <20220428212330.9CE1E846AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stellarium: bump version to 0.22.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5de73f0b685d7c2d096e3d28a50f2e89ed68c52c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
http://stellarium.org/release/2022/04/16/stellarium-0.22.1.html

Removed backported patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...xed-building-Stellarium-without-scripting.patch | 49 ----------------------
 package/stellarium/stellarium.hash                 |  4 +-
 package/stellarium/stellarium.mk                   |  2 +-
 3 files changed, 3 insertions(+), 52 deletions(-)

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
index 2c2427bf0e..64238ad163 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,5 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha1  c4a00fd756c66fb7df633f496dd3be4300bf1d2b  stellarium-0.22.0.tar.gz
-sha256  0b4dc23cf9054b5e76cd9bc5ad68e172eb221999e90af37e93667d04fe78c885  stellarium-0.22.0.tar.gz
+sha1  55b5915dfb616b9748e1c2d2de6150f7159cf36c  stellarium-0.22.1.tar.gz
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
