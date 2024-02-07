Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298B5C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6F2C812FA;
	Wed,  7 Feb 2024 16:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pR26ZGlFzLCb; Wed,  7 Feb 2024 16:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 566B5812B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 566B5812B8;
	Wed,  7 Feb 2024 16:25:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D323F1BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFBAD81185
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpj4KNYpZLdT for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C567680FB8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C567680FB8
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:24:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD12D87624; Wed,  7 Feb 2024 16:24:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:24:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13f8df8ed6e69f102d71d2040176b9374ff81706
X-Git-Newrev: e591475b4d0c2e2661d3710abd0964b5b42275e5
X-Patchwork-Hint: ignore
Message-Id: <20240207162449.BD12D87624@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bayer2rgb-neon: bump to latest
 commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=e591475b4d0c2e2661d3710abd0964b5b42275e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...0001-add-some-_always_inline_-annotations.patch | 75 ----------------------
 package/bayer2rgb-neon/bayer2rgb-neon.hash         |  2 +-
 package/bayer2rgb-neon/bayer2rgb-neon.mk           |  2 +-
 4 files changed, 2 insertions(+), 78 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 93489b5e0a..d099fd3761 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -178,7 +178,6 @@ package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch Upstream
 package/bash/0001-input.h-add-missing-include-on-stdio.h.patch Upstream
 package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch Upstream
 package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch Upstream
-package/bayer2rgb-neon/0001-add-some-_always_inline_-annotations.patch Upstream
 package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch Upstream
 package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch Upstream
 package/bc/0003-dc-fix-exit-code-of-q-command.patch Upstream
diff --git a/package/bayer2rgb-neon/0001-add-some-_always_inline_-annotations.patch b/package/bayer2rgb-neon/0001-add-some-_always_inline_-annotations.patch
deleted file mode 100644
index 281f90c875..0000000000
--- a/package/bayer2rgb-neon/0001-add-some-_always_inline_-annotations.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 4e5d8be1b0d18453b76fca2c5139222a071dd207 Mon Sep 17 00:00:00 2001
-From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
-Date: Mon, 4 Jul 2022 12:05:30 +0200
-Subject: [PATCH] add some _always_inline_ annotations
-
-enforce inlining to fix build errors with '-Og'
-
-fixes #1
-
-Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
-[Retrieved from:
-https://gitlab-ext.sigma-chemnitz.de/ensc/bayer2rgb/-/commit/4e5d8be1b0d18453b76fca2c5139222a071dd207]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/convert.c | 5 +++--
- src/main.c    | 5 +++--
- 2 files changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/src/convert.c b/src/convert.c
-index c852a14..ec77040 100644
---- a/src/convert.c
-+++ b/src/convert.c
-@@ -17,8 +17,9 @@
- #include <stdbool.h>
- #include <assert.h>
- #include "bayer2rgb.h"
-+#include "compiler.h"
- 
--static bool have_neon()
-+inline static  _always_inline_ bool have_neon()
- {
- #ifdef HAVE_NEON
- 	return true;
-@@ -27,7 +28,7 @@ static bool have_neon()
- #endif
- }
- 
--static bool have_cplusplus()
-+inline static  _always_inline_ bool have_cplusplus()
- {
- #ifdef HAVE_CPLUSPLUS
- 	return true;
-diff --git a/src/main.c b/src/main.c
-index 841a142..087e8e5 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -33,6 +33,7 @@
- 
- #include "src/bayer2rgb.h"
- #include "src/bayer2rgb-cmdline.h"
-+#include "src/compiler.h"
- 
- #define BPP_TO_BYTE(_bpp)	(((_bpp) + 7) / 8)
- 
-@@ -68,7 +69,7 @@ struct x_image_out {
- 	size_t			total_size;
- };
- 
--inline static bool have_neon(void)
-+inline static  _always_inline_ bool have_neon(void)
- {
- #ifdef HAVE_NEON
- 	return true;
-@@ -77,7 +78,7 @@ inline static bool have_neon(void)
- #endif
- }
- 
--static bool have_cplusplus()
-+inline static  _always_inline_ bool have_cplusplus()
- {
- #ifdef HAVE_CPLUSPLUS
- 	return true;
--- 
-GitLab
-
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.hash b/package/bayer2rgb-neon/bayer2rgb-neon.hash
index 26a14fcb51..7b26073de0 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.hash
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  edf451dbb52ad67eb35f9043390bd75ea7228d493c99184aae80b3bd27beab62  bayer2rgb-neon-15feb1115b4828488cc36d09f625e23e8b6a0ec5-br1.tar.gz
+sha256  35b38a40e98e9fa7fb8042c718f460fb806e916d2bf3e9721c07bbe4b42faad5  bayer2rgb-neon-bc950b3398ba034fe5cc39f625796a6111cdb87f-br1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.mk b/package/bayer2rgb-neon/bayer2rgb-neon.mk
index 5147a985e8..61d6334979 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.mk
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BAYER2RGB_NEON_VERSION = 15feb1115b4828488cc36d09f625e23e8b6a0ec5
+BAYER2RGB_NEON_VERSION = bc950b3398ba034fe5cc39f625796a6111cdb87f
 BAYER2RGB_NEON_SITE = https://gitlab-ext.sigma-chemnitz.de/ensc/bayer2rgb.git
 BAYER2RGB_NEON_SITE_METHOD = git
 BAYER2RGB_NEON_LICENSE = GPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
