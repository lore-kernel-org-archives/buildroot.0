Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD90C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 19:02:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE9C60EB4
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 19:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AE9C60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C3C60708;
	Sat, 30 Oct 2021 19:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHQQYxoR-_kI; Sat, 30 Oct 2021 19:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D318560643;
	Sat, 30 Oct 2021 19:02:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2D91BF3CB
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 19:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D0A180D0C
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 19:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FfRtYknHy_yj for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 19:02:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D610680D0A
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 19:02:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 574F0240004;
 Sat, 30 Oct 2021 19:02:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mgtcO-0003zv-JX; Sat, 30 Oct 2021 21:02:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 21:02:05 +0200
Message-Id: <20211030190206.15318-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/openjdk{-bin}: security bump LTS to
 version 11.0.13+8
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
Cc: Tudor Holton <buildroot@tudorholton.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

  - JDK-8163326, CVE-2021-35550: Update the default enabled cipher suites preference
  - JDK-8254967, CVE-2021-35565: com.sun.net.HttpsServer spins on TLS session close
  - JDK-8263314: Enhance XML Dsig modes
  - JDK-8265167, CVE-2021-35556: Richer Text Editors
  - JDK-8265574: Improve handling of sheets
  - JDK-8265580, CVE-2021-35559: Enhanced style for RTF kit
  - JDK-8265776: Improve Stream handling for SSL
  - JDK-8266097, CVE-2021-35561: Better hashing support
  - JDK-8266103: Better specified spec values
  - JDK-8266109: More Resilient Classloading
  - JDK-8266115: More Manifest Jar Loading
  - JDK-8266137, CVE-2021-35564: Improve Keystore integrity
  - JDK-8266689, CVE-2021-35567: More Constrained Delegation
  - JDK-8267086: ArrayIndexOutOfBoundsException in java.security.KeyFactory.generatePublic
  - JDK-8267712: Better LDAP reference processing
  - JDK-8267729, CVE-2021-35578: Improve TLS client handshaking
  - JDK-8267735, CVE-2021-35586: Better BMP support
  - JDK-8268193: Improve requests of certificates
  - JDK-8268199: Correct certificate requests
  - JDK-8268205: Enhance DTLS client handshake
  - JDK-8268506: More Manifest Digests
  - JDK-8269618, CVE-2021-35603: Better session identification
  - JDK-8269624: Enhance method selection support
  - JDK-8270398: Enhance canonicalization
  - JDK-8270404: Better canonicalization

For more details, see the announcement:
https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2021-October/009368.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
OpenJDK-16 seems to be EOL, we should probably migrate to 17.x?

 package/openjdk-bin/openjdk-bin.hash | 2 +-
 package/openjdk-bin/openjdk-bin.mk   | 2 +-
 package/openjdk/openjdk.hash         | 2 +-
 package/openjdk/openjdk.mk           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 696371eb51..de17aa71fc 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -2,7 +2,7 @@
 sha256  323d6d7474a359a28eff7ddd0df8e65bd61554a8ed12ef42fd9365349e573c2c  OpenJDK16U-jdk_x64_linux_hotspot_16.0.2_7.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
-sha256  8770f600fc3b89bf331213c7aa21f8eedd9ca5d96036d1cd48cb2748a3dbefd2  OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz
+sha256  3b1c0c34be4c894e64135a454f2d5aaa4bd10aea04ec2fa0c0efe6bb26528e30  OpenJDK11U-jdk_x64_linux_hotspot_11.0.13_8.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index a34ba355bd..01d3a3b88f 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -9,7 +9,7 @@ HOST_OPENJDK_BIN_VERSION_MAJOR = 16
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.2_7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.12_7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.13_8
 endif
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 2b4a2c7a62..8788d02be0 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
 sha256  b4a0e71e41a11175e8a7c1dba86ed5b0aa878413158c8d48813db1b64ac9536c  openjdk-16.0.2+7.tar.gz
-sha256  9a37c9641b45f5c51fe19c1ccae141daeb5dcdbd59fa2f56e7dea7bf09484bec  openjdk-11.0.12+7.tar.gz
+sha256  119c6233fe7ff5670c590e2f9d6686ac4d80c97b17065506998b75c547b54f2c  openjdk-11.0.13+8.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index aac5c87e73..27809ba282 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -9,7 +9,7 @@ OPENJDK_VERSION_MAJOR = 16
 OPENJDK_VERSION_MINOR = 0.2+7
 else
 OPENJDK_VERSION_MAJOR = 11
-OPENJDK_VERSION_MINOR = 0.12+7
+OPENJDK_VERSION_MINOR = 0.13+8
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
