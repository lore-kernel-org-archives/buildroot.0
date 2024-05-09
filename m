Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE82C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F27641BFF;
	Thu,  9 May 2024 17:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A97-r9CiLVyE; Thu,  9 May 2024 17:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42C0741D78
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42C0741D78;
	Thu,  9 May 2024 17:23:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 036EE1BF997
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D32B28108D
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07nj9ZyZ-nWl for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0C8580EC9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0C8580EC9
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:23:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9B3E86CB6; Thu,  9 May 2024 17:23:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 19:02:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67f7ebbc3fa2aed49437a05463dff45360ed53af
X-Git-Newrev: 4947799a0452d9e6b23b252e9488054129fa4c44
X-Patchwork-Hint: ignore
Message-Id: <20240509172344.D9B3E86CB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-imagedecoder-*: mass version
 bump to Omega
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

commit: https://git.buildroot.net/buildroot/commit/?id=4947799a0452d9e6b23b252e9488054129fa4c44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch from kodi-imagedecoder-heif which is included in upstream
release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...include-missing-cstdint-to-support-gcc-13.patch | 31 ----------------------
 .../kodi-imagedecoder-heif.hash                    |  2 +-
 .../kodi-imagedecoder-heif.mk                      |  2 +-
 .../kodi-imagedecoder-raw.hash                     |  2 +-
 .../kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk |  2 +-
 5 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch b/package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch
deleted file mode 100644
index bd431545e1..0000000000
--- a/package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 47dcb3843e02abb69c52d6f0021bd2816b8317a5 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Thu, 27 Apr 2023 02:46:59 +1000
-Subject: [PATCH] include missing <cstdint> to support gcc-13
-
-gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
-included [1]. Explicitly include it for uint{32,64}_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-
-Upstream: https://github.com/xbmc/imagedecoder.heif/commit/47dcb3843e02abb69c52d6f0021bd2816b8317a5
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- lib/TinyEXIF/TinyEXIF.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/TinyEXIF/TinyEXIF.h b/lib/TinyEXIF/TinyEXIF.h
-index 56354aa..b03d36b 100644
---- a/lib/TinyEXIF/TinyEXIF.h
-+++ b/lib/TinyEXIF/TinyEXIF.h
-@@ -34,6 +34,7 @@
- #ifndef __TINYEXIF_H__
- #define __TINYEXIF_H__
- 
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
index 4c7dec7df1..c68a26808e 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  17f50aada11528c02db2ff3871a355c89709ab7e2a5e6b5e33957b790cf207ff  kodi-imagedecoder-heif-20.1.0-Nexus.tar.gz
+sha256  12578bc027871dce331ea82070dd8f3e59bf89e72ae43b9178b8083a36be9c23  kodi-imagedecoder-heif-bf9771060dddc753ac7cf1dbf561059cad54dfb0.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
index 40b091d8b4..600f3fa7d2 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_HEIF_VERSION = 20.1.0-Nexus
+KODI_IMAGEDECODER_HEIF_VERSION = bf9771060dddc753ac7cf1dbf561059cad54dfb0
 KODI_IMAGEDECODER_HEIF_SITE = $(call github,xbmc,imagedecoder.heif,$(KODI_IMAGEDECODER_HEIF_VERSION))
 KODI_IMAGEDECODER_HEIF_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_HEIF_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
index 8be6ed98da..8f9451048c 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6235c0be431bbb814b3e464753af9ad17febf6001f77cbf030e6c6e1cdc41a04  kodi-imagedecoder-raw-20.1.0-Nexus.tar.gz
+sha256  451ce58acf377dd4758d78baf46f3e8c35d1e76b1a073744963f7a837f336707  kodi-imagedecoder-raw-7be9cf4d985c277f3a059f64873d81b24e6edd70.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
index 171956df41..87699ffaca 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_RAW_VERSION = 20.1.0-Nexus
+KODI_IMAGEDECODER_RAW_VERSION = 7be9cf4d985c277f3a059f64873d81b24e6edd70
 KODI_IMAGEDECODER_RAW_SITE = $(call github,xbmc,imagedecoder.raw,$(KODI_IMAGEDECODER_RAW_VERSION))
 KODI_IMAGEDECODER_RAW_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_RAW_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
