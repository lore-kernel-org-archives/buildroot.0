Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53DDC4320A
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:15:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 764E060F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 764E060F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40DBE608C1;
	Wed,  4 Aug 2021 20:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWz1jEIUYRQm; Wed,  4 Aug 2021 20:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8395360744;
	Wed,  4 Aug 2021 20:15:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8A251BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8C0C60744
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jzk-s3S2lhrS for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:15:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15B19606C9
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:15:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 189388B71A; Wed,  4 Aug 2021 20:15:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:11:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4185f6dae92c36f6c6bb783f632a7bed2285986c
X-Git-Newrev: 250f33d0ff4b7f687cd7c00d0b66c02c410ae59b
X-Patchwork-Hint: ignore
Message-Id: <20210804201544.189388B71A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/paho-mqtt-cpp: bump
 version to 1.2.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=250f33d0ff4b7f687cd7c00d0b66c02c410ae59b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

"This release brings in some missing MQTT v5 features, support for
websocket headers and proxies, ALPN protocol lists, adds the builder
pattern for options, and fixes a number of bugs in both the C++ library
and the underlying C lib."

https://github.com/eclipse/paho.mqtt.cpp/releases/tag/v1.2.0

This also makes the patch obsolete, since these changes have been merged upstream.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 ++
 ...make-FindMahoMqttC.cmake-fix-static-build.patch | 35 ----------------------
 package/paho-mqtt-cpp/paho-mqtt-cpp.hash           |  2 +-
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk             |  2 +-
 4 files changed, 5 insertions(+), 37 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1547ff123b..5c663628b6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -606,6 +606,9 @@ F:	package/odroidc2-firmware/
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
 
+N:	Daniel Lang <d.lang@abatec.at>
+F:	package/paho-mqtt-cpp/
+
 N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
 F:	package/log4cpp/
diff --git a/package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch b/package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch
deleted file mode 100644
index 934dca219e..0000000000
--- a/package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8aeafa1c2ec90b0e95ba5944266eda115457e10d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 15 Jun 2020 13:40:22 +0200
-Subject: [PATCH] cmake/FindMahoMqttC.cmake: fix static build
-
-Static libraries of paho-mqtt-c are not suffixed with -static since
-version 1.3.2 and
-https://github.com/eclipse/paho.mqtt.c/commit/8cc51c78b76a1eabd1df3124b0887ce8b01070ff
-
-See: https://github.com/eclipse/paho.mqtt.c/pull/704
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/eclipse/paho.mqtt.cpp/pull/275]
----
- cmake/FindPahoMqttC.cmake | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/cmake/FindPahoMqttC.cmake b/cmake/FindPahoMqttC.cmake
-index 53f15a3..0ec95bd 100644
---- a/cmake/FindPahoMqttC.cmake
-+++ b/cmake/FindPahoMqttC.cmake
-@@ -5,10 +5,6 @@ if(PAHO_WITH_SSL)
- else()
-     set(_PAHO_MQTT_C_LIB_NAME paho-mqtt3a)
- endif()
--# add suffix when using static Paho MQTT C library variant
--if(PAHO_BUILD_STATIC)
--    set(_PAHO_MQTT_C_LIB_NAME ${_PAHO_MQTT_C_LIB_NAME}-static)
--endif()
- 
- find_library(PAHO_MQTT_C_LIBRARIES NAMES ${_PAHO_MQTT_C_LIB_NAME})
- unset(_PAHO_MQTT_C_LIB_NAME)
--- 
-2.26.2
-
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
index e5406e0b81..d9b86ce207 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  cb0343349ed91ef51d0e76ae860d19435a730d3d355e57886bb090014cb70bbe  paho-mqtt-cpp-1.1.tar.gz
+sha256  435e97e4d5b1da13daa26cadd3e83fe9d154930abaa78b8ff1b8c854b5345d8b  paho-mqtt-cpp-1.2.0.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
index 161e53d484..827946605a 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_CPP_VERSION = 1.1
+PAHO_MQTT_CPP_VERSION = 1.2.0
 PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,v$(PAHO_MQTT_CPP_VERSION))
 PAHO_MQTT_CPP_LICENSE = EPL-1.0 or BSD-3-Clause
 PAHO_MQTT_CPP_LICENSE_FILES = epl-v10 edl-v10
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
