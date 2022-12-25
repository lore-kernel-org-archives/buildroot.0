Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F247AC3DA7A
	for <buildroot@archiver.kernel.org>; Sun, 25 Dec 2022 20:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D12E40761;
	Sun, 25 Dec 2022 20:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D12E40761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FTh9qvKslus; Sun, 25 Dec 2022 20:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 119D24071B;
	Sun, 25 Dec 2022 20:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 119D24071B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B367C1BF30D
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 20:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A7FF606EB
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 20:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A7FF606EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bAqVKd0f6BE3 for <buildroot@lists.busybox.net>;
 Sun, 25 Dec 2022 20:07:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 045F3605E9
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 045F3605E9
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 20:07:57 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout03.t-online.de (Postfix) with SMTP id 0CE7DE700
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 21:07:55 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p9XHi-4NCtdZ0; Sun, 25 Dec 2022 21:07:50 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:48056)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p9XHi-0005Kg-1O
 for buildroot@buildroot.org; Sun, 25 Dec 2022 21:07:50 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 25 Dec 2022 21:07:50 +0100
Message-Id: <20221225200750.263480-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671998870-73FF081F-BC6A50D0/0/0 CLEAN NORMAL
X-TOI-MSGID: f5d3cf08-561b-4443-beeb-76f0e8717356
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 1.2
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

Switch to xz tarball.

Add configure option to disable searching for qt6 as of now due to
incomplete implementation of qt6 modules, like gui, in buildroot.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../stellarium/0001-add-missing-include.patch | 32 +++++++++++++++++++
 package/stellarium/stellarium.hash            |  3 +-
 package/stellarium/stellarium.mk              |  4 ++-
 3 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 package/stellarium/0001-add-missing-include.patch

diff --git a/package/stellarium/0001-add-missing-include.patch b/package/stellarium/0001-add-missing-include.patch
new file mode 100644
index 0000000000..cd817ee3dc
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
++#include <QDate>
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
