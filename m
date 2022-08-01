Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0884C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 19:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3172881CE3;
	Mon,  1 Aug 2022 19:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3172881CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZQpQfNDizxl; Mon,  1 Aug 2022 19:20:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38C4781CC3;
	Mon,  1 Aug 2022 19:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38C4781CC3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31BF61BF334
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 19:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C6B3605B2
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 19:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C6B3605B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Mdbs3It9tD2 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 19:20:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDCD160A4F
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 19:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDCD160A4F
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B011E86BD6; Mon,  1 Aug 2022 19:06:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 21:19:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bef31674637249e64d378aa33c93d2ad23e4d93c
X-Git-Newrev: fdd6fe927b8f2d99dbd0a5f5c58b92430d20e1be
X-Patchwork-Hint: ignore
Message-Id: <20220801190617.B011E86BD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/domoticz: selects minizip-zlib
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdd6fe927b8f2d99dbd0a5f5c58b92430d20e1be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Selects minizip-zlib and so drop git submodules

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/domoticz/Config.in     | 1 +
 package/domoticz/domoticz.hash | 2 +-
 package/domoticz/domoticz.mk   | 8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 4324d13cee..85361eecf0 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_DOMOTICZ
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_MINIZIP_ZLIB
 	select BR2_PACKAGE_MOSQUITTO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_SQLITE
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 18bf57b7e0..9de241015c 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b7faf959c4f1dbfec3b0c17ab495f29b3d1437bc2251579c5252be82247e7ff9  domoticz-2022.1-br1.tar.gz
+sha256  8282cb71c924b6ef92503976d50f966f2c785eab8f8cffa1136ac133f0241157  domoticz-2022.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 5edc10e8d8..f21c52d432 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -5,9 +5,7 @@
 ################################################################################
 
 DOMOTICZ_VERSION = 2022.1
-DOMOTICZ_SITE = https://github.com/domoticz/domoticz
-DOMOTICZ_SITE_METHOD = git
-DOMOTICZ_GIT_SUBMODULES = YES
+DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
 DOMOTICZ_CPE_ID_VENDOR = domoticz
@@ -19,6 +17,7 @@ DOMOTICZ_DEPENDENCIES = \
 	jsoncpp \
 	libcurl \
 	lua \
+	minizip \
 	mosquitto \
 	openssl \
 	sqlite \
@@ -34,10 +33,11 @@ DOMOTICZ_CONF_OPTS += \
 	-DUSE_OPENSSL_STATIC=OFF
 
 # Do not use any built-in libraries which are enabled by default for
-# jsoncpp, fmt, sqlite and mqtt
+# jsoncpp, fmt, minizip, sqlite and mqtt
 DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_JSONCPP=OFF \
 	-DUSE_BUILTIN_LIBFMT=OFF \
+	-DUSE_BUILTIN_MINIZIP=OFF \
 	-DUSE_BUILTIN_SQLITE=OFF \
 	-DUSE_BUILTIN_MQTT=OFF
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
