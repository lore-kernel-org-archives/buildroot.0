Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2182ECD37B3
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 06:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE6534117D;
	Sun, 17 Sep 2023 06:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE6534117D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRkXcSGCjnNZ; Sun, 17 Sep 2023 06:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED76B40567;
	Sun, 17 Sep 2023 06:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED76B40567
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 972961BF424
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 06:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70AFD80B42
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 06:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70AFD80B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDbxDXkqityK for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 06:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 849B480B2F
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 06:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 849B480B2F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7209C86D21; Sun, 17 Sep 2023 06:49:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 08:41:16 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 4c3f927d51ac6a7a16c993e2284277197dbf0a0d
X-Git-Newrev: d214ce779b3285cd28dce89a5cc0deaf3b94ce24
X-Patchwork-Hint: ignore
Message-Id: <20230917064931.7209C86D21@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/qt5: fix upstream
 git trees
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d214ce779b3285cd28dce89a5cc0deaf3b94ce24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 0055c9c63457627159f2aff1b9b596748c20fb8f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
