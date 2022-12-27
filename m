Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD483C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 662894D15B;
	Mon, 20 Feb 2023 22:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 662894D15B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VNkdUPmfMNa1; Mon, 20 Feb 2023 22:46:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC244F2DF;
	Mon, 20 Feb 2023 22:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DC244F2DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBAA81BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E562411A3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E562411A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9c6gtmYYWe3 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4306E416F8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4306E416F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F4C086496; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 21:37:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 02cc05e757970a23da3c0818f275d465a4c1f280
X-Git-Newrev: 319c56dfe3309dbf24be01fed3afff6259a2c5dd
X-Patchwork-Hint: ignore
Message-Id: <20230220205216.2F4C086496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/stellarium: bump
 version to 1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=319c56dfe3309dbf24be01fed3afff6259a2c5dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add patch to fix build error.

Removed sha1 hash.

Add configure option to disable searching for qt6 as of now due to
incomplete implementation of qt6 modules, like gui, in buildroot.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stellarium/0001-add-missing-include.patch | 32 +++++++++++++++++++++++
 package/stellarium/stellarium.hash                |  3 +--
 package/stellarium/stellarium.mk                  |  4 ++-
 3 files changed, 36 insertions(+), 3 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
