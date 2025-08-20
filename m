Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0444ACA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 17:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B034641109;
	Wed, 20 Aug 2025 17:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXG2m8iyWyqp; Wed, 20 Aug 2025 17:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8EDD4116E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8EDD4116E;
	Wed, 20 Aug 2025 17:02:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 083E07AD
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDBA240621
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6CJMen6-mQA for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 17:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E69E340857
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E69E340857
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D65128778B; Wed, 20 Aug 2025 17:02:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Aug 2025 18:41:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed03bdb360cfc4ec9bd5c21ae9cd4b17cad37adb
X-Git-Newrev: ce5d1735710d11b135fc6cb235e976b306833e7d
X-Patchwork-Hint: ignore
Message-Id: <20250820170234.D65128778B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vorbis-tools: security bump to
 version 1.4.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ce5d1735710d11b135fc6cb235e976b306833e7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a bugfix release that among other things includes the GCC 14
build fix and resolves CVE-2023-43361.

Changelog: https://github.com/xiph/vorbis-tools/blob/v1.4.3/CHANGES

Fixes:
https://www.cve.org/CVERecord?id=CVE-2023-43361

Signed-off-by: Florian Larysch <fl@n621.de>
[Julien:
 - reword commit log title to add "security"
 - add link to CVE in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../vorbis-tools/0001-fix-build-with-gcc-14.patch  | 51 ----------------------
 package/vorbis-tools/vorbis-tools.hash             |  2 +-
 package/vorbis-tools/vorbis-tools.mk               |  2 +-
 3 files changed, 2 insertions(+), 53 deletions(-)

diff --git a/package/vorbis-tools/0001-fix-build-with-gcc-14.patch b/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
deleted file mode 100644
index a05ce8a584..0000000000
--- a/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From f4a31fe975ea37537f39ace4420aee893b7e0b1a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Jul 2024 21:57:38 +0200
-Subject: [PATCH] fix build with gcc >= 14
-
-Add missing includes to avoid the following build failure with gcc >=
-14:
-
-codec_skeleton.c: In function 'skeleton_process_fisbone_message_header':
-codec_skeleton.c:119:9: error: implicit declaration of function 'utf8_decode' [-Wimplicit-function-declaration]
-  119 |     if (utf8_decode(header, &decoded) < 0) {
-      |         ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/bb5d56d836e7d0f2a62daa9954878ad6e0b190ed
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/xiph/vorbis-tools/pull/48
----
- ogginfo/codec_skeleton.c | 2 ++
- share/utf8.c             | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/ogginfo/codec_skeleton.c b/ogginfo/codec_skeleton.c
-index a27f8da..f906f8c 100644
---- a/ogginfo/codec_skeleton.c
-+++ b/ogginfo/codec_skeleton.c
-@@ -28,6 +28,8 @@
- 
- #include "private.h"
- 
-+#include "utf8.h"
-+
- typedef struct {
-     bool supported;
-     uint16_t version_major;
-diff --git a/share/utf8.c b/share/utf8.c
-index be378d1..e819b67 100644
---- a/share/utf8.c
-+++ b/share/utf8.c
-@@ -28,6 +28,7 @@
- #include <stdlib.h>
- #include <string.h>
- 
-+#include "charset.h"
- #include "utf8.h"
- 
- 
--- 
-2.43.0
-
diff --git a/package/vorbis-tools/vorbis-tools.hash b/package/vorbis-tools/vorbis-tools.hash
index a4f463e466..e31daf96ac 100644
--- a/package/vorbis-tools/vorbis-tools.hash
+++ b/package/vorbis-tools/vorbis-tools.hash
@@ -1,4 +1,4 @@
 # From http://downloads.xiph.org/releases/vorbis/SHA256SUMS
-sha256  db7774ec2bf2c939b139452183669be84fda5774d6400fc57fde37f77624f0b0  vorbis-tools-1.4.2.tar.gz
+sha256  a1fe3ddc6777bdcebf6b797e7edfe0437954b24756ffcc8c6b816b63e0460dde  vorbis-tools-1.4.3.tar.gz
 # Locally computed
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/vorbis-tools/vorbis-tools.mk b/package/vorbis-tools/vorbis-tools.mk
index 936d2d816c..d64fe0b1ee 100644
--- a/package/vorbis-tools/vorbis-tools.mk
+++ b/package/vorbis-tools/vorbis-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VORBIS_TOOLS_VERSION = 1.4.2
+VORBIS_TOOLS_VERSION = 1.4.3
 VORBIS_TOOLS_SITE = http://downloads.xiph.org/releases/vorbis
 VORBIS_TOOLS_LICENSE = GPL-2.0
 VORBIS_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
