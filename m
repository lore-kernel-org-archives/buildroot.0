Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF03AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 25 Dec 2022 21:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35A18401CA;
	Sun, 25 Dec 2022 21:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35A18401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ev6f-PXVFVep; Sun, 25 Dec 2022 21:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C2EC40195;
	Sun, 25 Dec 2022 21:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C2EC40195
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA6E11BF20D
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 21:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B016D80E4F
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 21:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B016D80E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P7CkDMHv6zBo for <buildroot@lists.busybox.net>;
 Sun, 25 Dec 2022 21:55:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63E2780E17
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63E2780E17
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 21:55:14 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout03.t-online.de (Postfix) with SMTP id BB47319666
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 22:55:10 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p9YxZ-3hmptJ0; Sun, 25 Dec 2022 22:55:09 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:59060)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p9YxZ-0007l8-1h
 for buildroot@buildroot.org; Sun, 25 Dec 2022 22:55:09 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 25 Dec 2022 22:55:09 +0100
Message-Id: <20221225215509.981425-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672005310-16FEE98D-EC12567F/0/0 CLEAN NORMAL
X-TOI-MSGID: f1677d95-e9f9-41f4-9f70-49adfb626ba9
Subject: [Buildroot] [PATCH v2 1/1] package/stellarium: bump version to 1.2
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

Add patch to fix build error.

Removed sha1 hash.

Add configure option to disable searching for qt6 as of now due to
incomplete implementation of qt6 modules, like gui, in buildroot.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: updated patch after upstream comment

 .../stellarium/0001-add-missing-include.patch | 32 +++++++++++++++++++
 package/stellarium/stellarium.hash            |  3 +-
 package/stellarium/stellarium.mk              |  4 ++-
 3 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 package/stellarium/0001-add-missing-include.patch

diff --git a/package/stellarium/0001-add-missing-include.patch b/package/stellarium/0001-add-missing-include.patch
new file mode 100644
index 0000000000..822fc50367
--- /dev/null
+++ b/package/stellarium/0001-add-missing-include.patch
@@ -0,0 +1,32 @@
+From f36ce55e7a0fbba11fb7e1d4107ef61a79dc95d3 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 25 Dec 2022 20:38:17 +0100
+Subject: [PATCH] add missing include
+
+Fixes build error:
+
+stellarium-1.2/plugins/MeteorShowers/src/MeteorShowersMgr.hpp:331:12:
+ error: field 'm_lastUpdate' has incomplete type 'QDateTime'
+
+Patch sent upstream: https://github.com/Stellarium/stellarium/pull/2933
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ plugins/MeteorShowers/src/MeteorShowersMgr.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/plugins/MeteorShowers/src/MeteorShowersMgr.hpp b/plugins/MeteorShowers/src/MeteorShowersMgr.hpp
+index 8096856b6d..17716a68b0 100644
+--- a/plugins/MeteorShowers/src/MeteorShowersMgr.hpp
++++ b/plugins/MeteorShowers/src/MeteorShowersMgr.hpp
+@@ -20,6 +20,7 @@
+ #ifndef METEORSHOWERSMGR_HPP
+ #define METEORSHOWERSMGR_HPP
+ 
++#include <QDateTime>
+ #include <QNetworkReply>
+ #include <QNetworkAccessManager>
+ 
+-- 
+2.34.1
+
diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index f33dd385ca..2488b611a4 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,4 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha1  3661b4e8a94e7a520873fa22ddc79f39904eb1c4  stellarium-0.22.2.tar.gz
-sha256  31e965d32cafc0fbad212c7ef4efbeac988f909206013554e1fe35123ebb9376  stellarium-0.22.2.tar.gz
+sha256  802a0e8231cae41ec04f697f70105c291d9719aa6e7fd8cbe1f15068c3324e09  stellarium-1.2.tar.xz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 769e7049c1..a62488907f 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.22.2
+STELLARIUM_VERSION = 1.2
+STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
@@ -18,6 +19,7 @@ STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
 	-DENABLE_NLS=OFF \
 	-DENABLE_QTWEBENGINE=OFF \
+	-DENABLE_QT6=OFF \
 	-DUSE_SYSTEM_ZLIB=ON
 
 ifeq ($(BR2_PACKAGE_QT5SCRIPT),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
