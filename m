Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F5AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 16:13:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3938C61206
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 16:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3938C61206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0636A82451;
	Tue, 28 Sep 2021 16:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Nb0Lguaydn2; Tue, 28 Sep 2021 16:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F5FF80E1B;
	Tue, 28 Sep 2021 16:13:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9C7B1BF386
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 16:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A82B880C3C
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 16:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdk0oG08_06M for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 16:13:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A694A80EA2
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 16:13:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 028D18D41A; Tue, 28 Sep 2021 16:10:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 17:48:14 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d6156fc8a55e63deb2d621bd78e632d909757e89
X-Git-Newrev: 6726e6b7cfdc4a2540557054d1905741e1a822c0
X-Patchwork-Hint: ignore
Message-Id: <20210928161049.028D18D41A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/openjdk{-bin}:
 security bump versions to 11.0.12+7 and 16.0.2+7
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

commit: https://git.buildroot.net/buildroot/commit/?id=6726e6b7cfdc4a2540557054d1905741e1a822c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

As the github repository has changed from github.com/AdoptOpenJDK/ to
github.com/adoptium, both versions are updated in the same patch.

Security fixes

    JD K-8256157: Improve bytecode assembly
    JDK-8256491: Better HTTP transport
    JDK-8258432, CVE-2021-2341: Improve file transfers
    JDK-8260453: Improve Font Bounding
    JDK-8260960: Signs of jarsigner signing
    JDK-8260967, CVE-2021-2369: Better jar file validation
    JDK-8262380: Enhance XML processing passes
    JDK-8262403: Enhanced data transfer
    JDK-8262410: Enhanced rules for zones
    JDK-8262477: Enhance String Conclusions
    JDK-8262967: Improve Zip file support
    JDK-8264066, CVE-2021-2388: Enhance compiler validation
    JDK-8264079: Improve abstractions
    JDK-8264460: Improve NTLM support

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit baaf71b9bb13c3c42ed99ae4488e80dcefe28513)
[Peter: mention security fixes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk-bin/openjdk-bin.hash | 6 +++---
 package/openjdk-bin/openjdk-bin.mk   | 6 +++---
 package/openjdk/openjdk.hash         | 4 ++--
 package/openjdk/openjdk.mk           | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 04b3c42d25..696371eb51 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,8 +1,8 @@
 # From https://github.com/AdoptOpenJDK/openjdk16-binaries/releases
-sha256  7fdda042207efcedd30cd76d6295ed56b9c2e248cb3682c50898a560d4aa1c6f  OpenJDK16U-jdk_x64_linux_hotspot_16.0.1_9.tar.gz
+sha256  323d6d7474a359a28eff7ddd0df8e65bd61554a8ed12ef42fd9365349e573c2c  OpenJDK16U-jdk_x64_linux_hotspot_16.0.2_7.tar.gz
 
-# From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
-sha256  e99b98f851541202ab64401594901e583b764e368814320eba442095251e78cb  OpenJDK11U-jdk_x64_linux_hotspot_11.0.11_9.tar.gz
+# From https://github.com/adoptium/temurin11-binaries/releases
+sha256  8770f600fc3b89bf331213c7aa21f8eedd9ca5d96036d1cd48cb2748a3dbefd2  OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index b48155dc28..a34ba355bd 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,14 +6,14 @@
 
 ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 16
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_9
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.2_7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.11_9
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.12_7
 endif
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
-HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
+HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index ba6c4385e7..2b4a2c7a62 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3b3aca61fe2834322e51636d99bcd09c4abba7d8a2cde231dbcbcbdedf829baf  openjdk-16.0.1+9.tar.gz
-sha256  55841c01dbe6606e0d5f88045fb2da02632ce3a2d9d9b25d030a06eadeee0f62  openjdk-11.0.11+9.tar.gz
+sha256  b4a0e71e41a11175e8a7c1dba86ed5b0aa878413158c8d48813db1b64ac9536c  openjdk-16.0.2+7.tar.gz
+sha256  9a37c9641b45f5c51fe19c1ccae141daeb5dcdbd59fa2f56e7dea7bf09484bec  openjdk-11.0.12+7.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index cbb975ca25..aac5c87e73 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
 OPENJDK_VERSION_MAJOR = 16
-OPENJDK_VERSION_MINOR = 0.1+9
+OPENJDK_VERSION_MINOR = 0.2+7
 else
 OPENJDK_VERSION_MAJOR = 11
-OPENJDK_VERSION_MINOR = 0.11+9
+OPENJDK_VERSION_MINOR = 0.12+7
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
