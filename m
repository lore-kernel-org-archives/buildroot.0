Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8876C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6656849D0;
	Sun, 15 Sep 2024 21:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ddhz3I0aOD67; Sun, 15 Sep 2024 21:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03F32849D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03F32849D4;
	Sun, 15 Sep 2024 21:42:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 811681BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E0D660880
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXutRyrNZvuJ for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED51C60886
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED51C60886
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E53C17FB7E; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 11:29:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cb185d3df237341382b03c8e6f6c5358063c721
X-Git-Newrev: 475c79d1c437f0e693af65f4dc26ed064c043de1
X-Patchwork-Hint: ignore
Message-Id: <20240915213640.E53C17FB7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk{-bin}: bump versions to
 17.0.12+7 and 21.0.4+7
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=475c79d1c437f0e693af65f4dc26ed064c043de1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

./support/testing/run-tests tests.package.test_openjdk.TestOpenJdk.test_run
passed without issue.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/openjdk-bin/{17.0.9_9 => 17.0.12_7}/openjdk-bin.hash | 4 ++--
 package/openjdk-bin/{21.0.1_12 => 21.0.4_7}/openjdk-bin.hash | 4 ++--
 package/openjdk-bin/openjdk-bin.mk                           | 4 ++--
 package/openjdk/openjdk.hash                                 | 4 ++--
 package/openjdk/openjdk.mk                                   | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/openjdk-bin/17.0.9_9/openjdk-bin.hash b/package/openjdk-bin/17.0.12_7/openjdk-bin.hash
similarity index 53%
rename from package/openjdk-bin/17.0.9_9/openjdk-bin.hash
rename to package/openjdk-bin/17.0.12_7/openjdk-bin.hash
index 29f39c5d36..4a7c84eb87 100644
--- a/package/openjdk-bin/17.0.9_9/openjdk-bin.hash
+++ b/package/openjdk-bin/17.0.12_7/openjdk-bin.hash
@@ -1,6 +1,6 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  7b175dbe0d6e3c9c23b6ed96449b018308d8fc94a5ecd9c0df8b8bc376c3c18a  OpenJDK17U-jdk_x64_linux_hotspot_17.0.9_9.tar.gz
-sha256  e2c5e26f8572544b201bc22a9b28f2b1a3147ab69be111cea07c7f52af252e75  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.9_9.tar.gz
+sha256  9d4dd339bf7e6a9dcba8347661603b74c61ab2a5083ae67bf76da6285da8a778  OpenJDK17U-jdk_x64_linux_hotspot_17.0.12_7.tar.gz
+sha256  8257de06bf37f0c8f19f8d542e2ab5a4e17db3ca5f29d041bd0b02ab265db021  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.12_7.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/21.0.1_12/openjdk-bin.hash b/package/openjdk-bin/21.0.4_7/openjdk-bin.hash
similarity index 53%
rename from package/openjdk-bin/21.0.1_12/openjdk-bin.hash
rename to package/openjdk-bin/21.0.4_7/openjdk-bin.hash
index 35be28bb4f..a73bea1a77 100644
--- a/package/openjdk-bin/21.0.1_12/openjdk-bin.hash
+++ b/package/openjdk-bin/21.0.4_7/openjdk-bin.hash
@@ -1,6 +1,6 @@
 # From https://github.com/adoptium/temurin21-binaries/releases
-sha256  1a6fa8abda4c5caed915cfbeeb176e7fbd12eb6b222f26e290ee45808b529aa1  OpenJDK21U-jdk_x64_linux_hotspot_21.0.1_12.tar.gz
-sha256  e184dc29a6712c1f78754ab36fb48866583665fa345324f1a79e569c064f95e9  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.1_12.tar.gz
+sha256  51fb4d03a4429c39d397d3a03a779077159317616550e4e71624c9843083e7b9  OpenJDK21U-jdk_x64_linux_hotspot_21.0.4_7.tar.gz
+sha256  d768eecddd7a515711659e02caef8516b7b7177fa34880a56398fd9822593a79  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.4_7.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 0280151fba..17056e80b7 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_12
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.4_7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.9_9
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.12_7
 endif
 
 ifeq ($(HOSTARCH),x86_64)
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 949a62e527..209004a292 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  9943e3814d3c1a31f1449f09a8b67df54841944f855a1d372be892c5e6b19217  openjdk-21.0.1+12.tar.gz
-sha256  836adb5fec5a58ce2f49a0faeaf9e69a3cb89865f4d855c6098f0264843672ad  openjdk-17.0.9+9.tar.gz
+sha256  b8b37fa6fcc284d91e7458c703ca4c893a1dd5a6e0f6b9e198e7d13cd8efd24d  openjdk-21.0.4+7.tar.gz
+sha256  ccb7d37c24f9f5808f9d25419d93680570dc600f292e68944032338cb4b2c51e  openjdk-17.0.12+7.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index f4e1920e6c..446e4aa3c2 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
-OPENJDK_VERSION_MINOR = 0.1+12
+OPENJDK_VERSION_MINOR = 0.4+7
 else
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.9+9
+OPENJDK_VERSION_MINOR = 0.12+7
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
