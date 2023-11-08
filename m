Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A047CC4167B
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 09:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58FB961010;
	Wed,  8 Nov 2023 09:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58FB961010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4prxjDpZdiKe; Wed,  8 Nov 2023 09:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF0D61003;
	Wed,  8 Nov 2023 09:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AF0D61003
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90E081BF423
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 09:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76E5860FB2
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 09:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E5860FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lqWnDdSwfGyv for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 09:29:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7845661003
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 09:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7845661003
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63B7F86CA5; Wed,  8 Nov 2023 09:29:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 10:19:33 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 8de47d6babe3edd1a40ce650e4f5cc6a006013d8
X-Git-Newrev: dc3280178f1c14680194dd83e85958eb7357a48d
X-Patchwork-Hint: ignore
Message-Id: <20231108092926.63B7F86CA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/openjdk-bin: bump
 OpenJDK17 version to 17.0.8.1+1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc3280178f1c14680194dd83e85958eb7357a48d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 547552a9cbec769daffd3093a1c24eb0876c8fc7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk-bin/openjdk-bin.hash                                  | 4 ++--
 package/openjdk-bin/openjdk-bin.mk                                    | 2 +-
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch               | 0
 package/openjdk/openjdk.hash                                          | 2 +-
 package/openjdk/openjdk.mk                                            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 401e83e75e..98f12cb2b8 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,6 +1,6 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  aa5fc7d388fe544e5d85902e68399d5299e931f9b280d358a3cbee218d6017b0  OpenJDK17U-jdk_x64_linux_hotspot_17.0.8_7.tar.gz
-sha256  c43688163cfdcb1a6e6fe202cc06a51891df746b954c55dbd01430e7d7326d00  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.8_7.tar.gz
+sha256  c25dfbc334068a48c19c44ce39ad4b8427e309ae1cfa83f23c102e78b8a6dcc0  OpenJDK17U-jdk_x64_linux_hotspot_17.0.8.1_1.tar.gz
+sha256  eefd3cf3b3dd47ff269fa5b5c10b5e096b163f4e9c1810023abdbc00dc6cc304  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.8.1_1.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
 sha256  7a99258af2e3ee9047e90f1c0c1775fd6285085759501295358d934d662e01f9  OpenJDK11U-jdk_x64_linux_hotspot_11.0.20_8.tar.gz
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 616c8d917d..785ca87337 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.8_7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.8.1_1
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.20_8
diff --git a/package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.8.1+1/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.8.1+1/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index ba398b84be..fcb9143748 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  643ff42dcdf8751e0fee716c1a1914ddc7348b174e871a5eb2636578a181f20d  openjdk-17.0.8+7.tar.gz
+sha256  e57251d8306911282b6f0a2f721431dab5f87c99cce0930fc062e690f7c77f04  openjdk-17.0.8.1+1.tar.gz
 sha256  b2a37ef209ae7eaf8f34182b7c9aa3252af20a214d02970f96ce62242c805479  openjdk-11.0.20+8.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index d1a2fa23ee..068d16b770 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.8+7
+OPENJDK_VERSION_MINOR = 0.8.1+1
 else
 OPENJDK_VERSION_MAJOR = 11
 OPENJDK_VERSION_MINOR = 0.20+8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
