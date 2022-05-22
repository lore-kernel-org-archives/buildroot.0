Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71C8C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 20:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 898BD416F9;
	Sun, 22 May 2022 20:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V6DWCeLaO6c5; Sun, 22 May 2022 20:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23D0141700;
	Sun, 22 May 2022 20:24:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D56D1BF963
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B7EA60B8C
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nvBVUjH3ECWs for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 20:24:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F47560B12
 for <buildroot@buildroot.org>; Sun, 22 May 2022 20:24:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C9F5A8633D; Sun, 22 May 2022 20:13:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 22:21:49 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 17b2be9ba5b2f408c387f8f84370a0f7423b8c01
X-Git-Newrev: 3d58ff0ca8653e672bd762e78e7e80cfb5f3b889
X-Patchwork-Hint: ignore
Message-Id: <20220522201330.C9F5A8633D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/openjdk{-bin}:
 security bump 11.x to version 11.0.14.1+1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d58ff0ca8653e672bd762e78e7e80cfb5f3b889
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

  - JDK-8217375: jarsigner breaks old signature with long lines in manifest
  - JDK-8251329: (zipfs) Files.walkFileTree walks infinitely if zip has dir named "." inside
  - JDK-8264934, CVE-2022-21248: Enhance cross VM serialization
  - JDK-8268488: More valuable DerValues
  - JDK-8268494: Better inlining of inlined interfaces
  - JDK-8268512: More content for ContentInfo
  - JDK-8268795: Enhance digests of Jar files
  - JDK-8268801: Improve PKCS attribute handling
  - JDK-8268813, CVE-2022-21283: Better String matching
  - JDK-8269151: Better construction of EncryptedPrivateKeyInfo
  - JDK-8269944: Better HTTP transport redux
  - JDK-8270386, CVE-2022-21291: Better verification of scan methods
  - JDK-8270392, CVE-2022-21293: Improve String constructions
  - JDK-8270416, CVE-2022-21294: Enhance construction of Identity maps
  - JDK-8270492, CVE-2022-21282: Better resolution of URIs
  - JDK-8270498, CVE-2022-21296: Improve SAX Parser configuration management
  - JDK-8270646, CVE-2022-21299: Improved scanning of XML entities
  - JDK-8270952, CVE-2022-21277: Improve TIFF file handling
  - JDK-8271962: Better TrueType font loading
  - JDK-8271968: Better canonical naming
  - JDK-8271987: Manifest improved manifest entries
  - JDK-8272014, CVE-2022-21305: Better array indexing
  - JDK-8272026, CVE-2022-21340: Verify Jar Verification
  - JDK-8272236, CVE-2022-21341: Improve serial forms for transport
  - JDK-8272272: Enhance jcmd communication
  - JDK-8272462: Enhance image handling
  - JDK-8273290: Enhance sound handling
  - JDK-8273756, CVE-2022-21360: Enhance BMP image support
  - JDK-8273838, CVE-2022-21365: Enhanced BMP processing
  - JDK-8274096, CVE-2022-21366: Improve decoding of image files
  - JDK-8279541: Improve HarfBuzz

For more details, see the announcement:

https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2022-January/011643.html
https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2022-February/012348.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 30be0473162ff801a38b0ccbe6d8f6c30a282c0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk-bin/openjdk-bin.hash | 2 +-
 package/openjdk-bin/openjdk-bin.mk   | 2 +-
 package/openjdk/openjdk.hash         | 2 +-
 package/openjdk/openjdk.mk           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index bbc939d4e8..082da7bf87 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -2,7 +2,7 @@
 sha256  6ea18c276dcbb8522feeebcfc3a4b5cb7c7e7368ba8590d3326c6c3efc5448b6  OpenJDK17U-jdk_x64_linux_hotspot_17.0.1_12.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
-sha256  3b1c0c34be4c894e64135a454f2d5aaa4bd10aea04ec2fa0c0efe6bb26528e30  OpenJDK11U-jdk_x64_linux_hotspot_11.0.13_8.tar.gz
+sha256  43fb84f8063ad9bf6b6d694a67b8f64c8827552b920ec5ce794dfe5602edffe7  OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 266c93d363..c9ddc9f69f 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -9,7 +9,7 @@ HOST_OPENJDK_BIN_VERSION_MAJOR = 17
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_12
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.13_8
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.14.1_1
 endif
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 2f46b044ad..f8a4f15260 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
 sha256  8c076203a6f85ab916b3e54de1992bcbcc5ffe580c52b1ac8d52ca7afb9f02d1  openjdk-17.0.1+12.tar.gz
-sha256  119c6233fe7ff5670c590e2f9d6686ac4d80c97b17065506998b75c547b54f2c  openjdk-11.0.13+8.tar.gz
+sha256  0e859cc03378439023e17ee82aecee5a52265fb38906a8bebf16027aa2b2bcf5  openjdk-11.0.14.1+1.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 5fccdaa7ac..94b8cba577 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -9,7 +9,7 @@ OPENJDK_VERSION_MAJOR = 17
 OPENJDK_VERSION_MINOR = 0.1+12
 else
 OPENJDK_VERSION_MAJOR = 11
-OPENJDK_VERSION_MINOR = 0.13+8
+OPENJDK_VERSION_MINOR = 0.14.1+1
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
