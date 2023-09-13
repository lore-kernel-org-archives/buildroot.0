Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DC8EE020C
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 20:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E35080BCC;
	Wed, 13 Sep 2023 20:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E35080BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUl4rwqyBMP7; Wed, 13 Sep 2023 20:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 468FF83126;
	Wed, 13 Sep 2023 20:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 468FF83126
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93B8B1BF980
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 603D860B46
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 603D860B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyDF--BowFVW for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 20:14:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54F6460E65
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 20:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F6460E65
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4460186E9D; Wed, 13 Sep 2023 20:14:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 22:05:03 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 74ebf46e43dc9d3f2c23fcbc082c2897561bc51f
X-Git-Newrev: f77fa78b1bea52ae516a92531e490cf9568b5380
X-Patchwork-Hint: ignore
Message-Id: <20230913201426.4460186E9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/openjdk{-bin}:
 security bump versions to 11.0.20+8 and 17.0.8+7
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

commit: https://git.buildroot.net/buildroot/commit/?id=f77fa78b1bea52ae516a92531e490cf9568b5380
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixed the following security issues:

* CVEs
  - CVE-2023-22006
  - CVE-2023-22036
  - CVE-2023-22041
  - CVE-2023-22044
  - CVE-2023-22045
  - CVE-2023-22049
  - CVE-2023-25193
* Security fixes
  - JDK-8298676: Enhanced Look and Feel
  - JDK-8300285: Enhance TLS data handling
  - JDK-8300596: Enhance Jar Signature validation
  - JDK-8301998, JDK-8302084: Update HarfBuzz to 7.0.1
  - JDK-8302475: Enhance HTTP client file downloading
  - JDK-8302483: Enhance ZIP performance
  - JDK-8303376: Better launching of JDI
  - JDK-8304468: Better array usages
  - JDK-8305312: Enhanced path handling
  - JDK-8308682: Enhance AES performance

For details, see the announcements:
https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-July/024064.html
https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-July/024063.html

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit c1038fe47c705fd7bf4bbc6e8b8557d5417adaad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk-bin/openjdk-bin.hash                              | 8 ++++----
 package/openjdk-bin/openjdk-bin.mk                                | 4 ++--
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch           | 0
 package/openjdk/openjdk.hash                                      | 4 ++--
 package/openjdk/openjdk.mk                                        | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index eb9d7396e3..401e83e75e 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,10 +1,10 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  e9458b38e97358850902c2936a1bb5f35f6cffc59da9fcd28c63eab8dbbfbc3b  OpenJDK17U-jdk_x64_linux_hotspot_17.0.7_7.tar.gz
-sha256  0084272404b89442871e0a1f112779844090532978ad4d4191b8d03fc6adfade  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.7_7.tar.gz
+sha256  aa5fc7d388fe544e5d85902e68399d5299e931f9b280d358a3cbee218d6017b0  OpenJDK17U-jdk_x64_linux_hotspot_17.0.8_7.tar.gz
+sha256  c43688163cfdcb1a6e6fe202cc06a51891df746b954c55dbd01430e7d7326d00  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.8_7.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
-sha256  5f19fb28aea3e28fcc402b73ce72f62b602992d48769502effe81c52ca39a581  OpenJDK11U-jdk_x64_linux_hotspot_11.0.19_7.tar.gz
-sha256  0c7763a19b4af4ef5fbae831781b5184e988d6f131d264482399eeaf51b6e254  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.19_7.tar.gz
+sha256  7a99258af2e3ee9047e90f1c0c1775fd6285085759501295358d934d662e01f9  OpenJDK11U-jdk_x64_linux_hotspot_11.0.20_8.tar.gz
+sha256  eb821c049c2d2f7c3fbf8ddcce2d608d3aa7d488700e76bfbbebabba93021748  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.20_8.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index dad846534b..616c8d917d 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.7_7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.8_7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.19_7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.20_8
 endif
 
 ifeq ($(HOSTARCH),x86_64)
diff --git a/package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 3b36289628..ba398b84be 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  43b80a5aec5fce908e80858e9b34efdf1b49255a12ce303650325af65141d3e8  openjdk-17.0.7+7.tar.gz
-sha256  25fd9ab3042a284aa4e6348969403016404bc2706a4a02c149a0054fbe477337  openjdk-11.0.19+7.tar.gz
+sha256  643ff42dcdf8751e0fee716c1a1914ddc7348b174e871a5eb2636578a181f20d  openjdk-17.0.8+7.tar.gz
+sha256  b2a37ef209ae7eaf8f34182b7c9aa3252af20a214d02970f96ce62242c805479  openjdk-11.0.20+8.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 39d461a87c..d1a2fa23ee 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.7+7
+OPENJDK_VERSION_MINOR = 0.8+7
 else
 OPENJDK_VERSION_MAJOR = 11
-OPENJDK_VERSION_MINOR = 0.19+7
+OPENJDK_VERSION_MINOR = 0.20+8
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
