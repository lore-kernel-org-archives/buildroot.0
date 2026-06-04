Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BEECD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9CF64105D;
	Fri,  5 Jun 2026 12:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Weo4mGfGqw2D; Fri,  5 Jun 2026 12:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D170A41188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663175;
	bh=5cUNqB1qH+CRIoSykxLtTdZwiiuF5TnGZox2/ZWmAqw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=heV0XZ9gHPw5ydcxYonYmaUcuFxxBpZNaL2VHBdMBP1US+Xh9fL2nWv0yjNtBkXDu
	 H3D85wAmBsbOJTz26Pdz+Cv+CWlw3MqLTFvW5VuxgVceZ7KOrPnBRwz4abATBPOQ36
	 gVIDpZO5kgTsUZIKxFBVmO09ahOXNV742eo3iHCdQnAi3iILwPETu0NJmi/k9+vfcR
	 ULmJ9KGtfr4+igYha6nta6avPf/fA2/fI0PB49L6U0CbbH+rV57lRwWeotLCsxhXOS
	 x8Z8kR2FSUqAhgB9YCLpTXF3XDznGjRMGlFU1+/9jZU08A1H2XZVV6EdaDMEUJofGE
	 B+lbMbPLk8b3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D170A41188;
	Fri,  5 Jun 2026 12:39:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 027A9388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC2E84101F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBQiYAc27zwN for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B2F641012
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B2F641012
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4F3687B3B; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:37:15 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 17ab58e658caf539c47c7990a70138e1b85bb049
X-Git-Newrev: 06f68f39d1db00f7fd27f0c2fc928e07a1d2a5d6
X-Patchwork-Hint: ignore
Message-Id: <20260605123835.A4F3687B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/vorbis-tools: Fix
 build with gcc 14.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06f68f39d1db00f7fd27f0c2fc928e07a1d2a5d6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit ce5d1735710d11b135fc6cb235e976b306833e7d removed
0001-fix-build-with-gcc-14.patch which the version bump to 1.4.3.

The patch originally not only fixed share/utf8.c but also
ogginfo/codec_skeleton.c. Upstream only applied the fix for
ogginfo/codec_skeleton.c:
https://github.com/xiph/vorbis-tools/commit/68c5a33685f5b86e7f18f239ceb8861484fee552
so the build still fails:

utf8.c: In function 'convert_buffer':
utf8.c:271:9: error: implicit declaration of function 'charset_convert'
 [-Wimplicit-function-declaration]
  271 |   ret = charset_convert(fromcode, tocode, from, fromlen, to, tolen);

Added upstream commit to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/135/13520e3cbf6b6d169985f4d1378c2a1baab852e0/

The build error can be reproduced by this minimal defconfig:
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PACKAGE_VORBIS_TOOLS=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 8b79a9fec56ca450f385494879e838b301ad2a38)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...de-for-charset.h-to-find-charset_convert-.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch b/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch
new file mode 100644
index 0000000000..3e97976fd8
--- /dev/null
+++ b/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch
@@ -0,0 +1,32 @@
+From 5155bf98a5b10fdf950dfa8f6edad624c0db7030 Mon Sep 17 00:00:00 2001
+From: Petter Reinholdtsen <pere@debian.org>
+Date: Sun, 22 Feb 2026 23:33:59 +0100
+Subject: [PATCH] Added include for "charset.h" to find charset_convert()
+ prototype with gcc >= 14.
+
+Patch from Bernd Kuhls.
+
+Fixes #2334.
+
+Upstream: https://github.com/xiph/vorbis-tools/commit/5155bf98a5b10fdf950dfa8f6edad624c0db7030
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ share/utf8.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/share/utf8.c b/share/utf8.c
+index e1199bc..1e6965f 100644
+--- a/share/utf8.c
++++ b/share/utf8.c
+@@ -28,6 +28,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
++#include "charset.h"
+ #include "utf8.h"
+ 
+ 
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
