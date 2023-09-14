Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFCAEEAA71
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 235BE612C7;
	Thu, 14 Sep 2023 21:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 235BE612C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oc3tEdliXmjh; Thu, 14 Sep 2023 21:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76065612C8;
	Thu, 14 Sep 2023 21:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76065612C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3DBD1BF368
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CF674206E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CF674206E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DLB0JeN61Kx0 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59DF94206A
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59DF94206A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4036486FF7; Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 22:57:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd94f49566fc420913a3cabda9a87b44a822ea53
X-Git-Newrev: 0055c9c63457627159f2aff1b9b596748c20fb8f
X-Patchwork-Hint: ignore
Message-Id: <20230914210236.4036486FF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5: fix upstream git trees
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

commit: https://git.buildroot.net/buildroot/commit/?id=0055c9c63457627159f2aff1b9b596748c20fb8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commits 4e8b5f9bee9c [0], 6cfbd51d98d1 [1], and d838a416c4ed [2],
the repository we clone from is the cgit browser, and it does not serve
the git tree, only the browser:

    $ git clone https://code.qt.io/cgit/qt/qtcoap.git
    Cloning into 'qtcoap'...
    fatal: repository 'https://code.qt.io/cgit/qt/qtcoap.git/' not found

Browsing there displays the cgit UI, which gives a proper URI to clone
from; switch to using that. Things happened to "work" so far thanks to
sources.buildroot.net.

[0] 4e8b5f9bee9c package/qt5/qt5mqtt: bump version to 5.15.2 (and fix download)
[1] 6cfbd51d98d1 package/qt5/qt5coap: bump version to 5.15.2 (and fix download)
[2] d838a416c4ed package/qt5/qt5knx: bump version to 5.15.2 (and fix download)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
CC: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5coap/qt5coap.mk | 2 +-
 package/qt5/qt5knx/qt5knx.mk   | 2 +-
 package/qt5/qt5mqtt/qt5mqtt.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5coap/qt5coap.mk b/package/qt5/qt5coap/qt5coap.mk
index a50f19d7f2..5feb1e5bc2 100644
--- a/package/qt5/qt5coap/qt5coap.mk
+++ b/package/qt5/qt5coap/qt5coap.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5COAP_VERSION = 5.15.2
-QT5COAP_SITE = https://code.qt.io/cgit/qt/qtcoap.git
+QT5COAP_SITE = https://code.qt.io/qt/qtcoap.git
 QT5COAP_SITE_METHOD = git
 QT5COAP_INSTALL_STAGING = YES
 QT5COAP_LICENSE = GPL-3.0, GFDL-1.3
diff --git a/package/qt5/qt5knx/qt5knx.mk b/package/qt5/qt5knx/qt5knx.mk
index 412e31c652..91b99aaa87 100644
--- a/package/qt5/qt5knx/qt5knx.mk
+++ b/package/qt5/qt5knx/qt5knx.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5KNX_VERSION = 5.15.2
-QT5KNX_SITE = https://code.qt.io/cgit/qt/qtknx.git
+QT5KNX_SITE = https://code.qt.io/qt/qtknx.git
 QT5KNX_SITE_METHOD = git
 QT5KNX_INSTALL_STAGING = YES
 QT5KNX_LICENSE = GPL-3.0 with exception
diff --git a/package/qt5/qt5mqtt/qt5mqtt.mk b/package/qt5/qt5mqtt/qt5mqtt.mk
index 0b62cf1bed..824d58d1d1 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.mk
+++ b/package/qt5/qt5mqtt/qt5mqtt.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5MQTT_VERSION = 5.15.2
-QT5MQTT_SITE = https://code.qt.io/cgit/qt/qtmqtt.git
+QT5MQTT_SITE = https://code.qt.io/qt/qtmqtt.git
 QT5MQTT_SITE_METHOD = git
 QT5MQTT_INSTALL_STAGING = YES
 QT5MQTT_LICENSE = GPL-3.0 with exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
