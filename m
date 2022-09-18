Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BA6C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB536FB0E;
	Sun, 18 Sep 2022 09:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB536FB0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sENwbxKdh1hK; Sun, 18 Sep 2022 09:34:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 449AD60E1A;
	Sun, 18 Sep 2022 09:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 449AD60E1A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29D3C1BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11AB66FB12
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11AB66FB12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKMZfiU9P02c for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D5A860E1A
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D5A860E1A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17F7084A58; Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 09:48:45 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 43ce30dcb91b9150566b9fb3377a7ee248af99b1
X-Git-Newrev: 8d5e54d1ce8041bf96af919aa22075f77cf0c1a8
X-Patchwork-Hint: ignore
Message-Id: <20220918093346.17F7084A58@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/mosquitto:
 security bump to version 2.0.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d5e54d1ce8041bf96af919aa22075f77cf0c1a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

see https://mosquitto.org/blog/2022/08/version-2-0-15-released/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3056de15f2786ed7322009328b91ccb32bab1971)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/Config.in      | 2 +-
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index b4effa36be..6fa5f79c6c 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_MOSQUITTO
 	  implementing MQTT clients, and the very popular mosquitto_pub
 	  and mosquitto_sub command line MQTT clients.
 
-	  http://mosquitto.org/
+	  https://mosquitto.org/
 
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 24b8869d13..2cfd0d9422 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.13.tar.gz.asc
-sha256  d0dde8fdb12caf6e2426b4f28081919a2fce3448773bdb8af0d3cd5fe5776925  mosquitto-2.0.14.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.15.tar.gz.asc
+sha256  4735b1d32e3f91c7a8896741d88a3022e89730a1ee897946decfa0df27039ac6  mosquitto-2.0.15.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 3e7a728acb..c47e61850b 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.14
+MOSQUITTO_VERSION = 2.0.15
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
