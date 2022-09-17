Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7D7C6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09A4D83F8A;
	Sat, 17 Sep 2022 08:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09A4D83F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TbNXyGGNTQxJ; Sat, 17 Sep 2022 08:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F301483F85;
	Sat, 17 Sep 2022 08:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F301483F85
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 854AC1BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6090A401D8
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6090A401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bli1FNYU4JQz for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:51:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52E5940121
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52E5940121
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3CDE8840A5; Sat, 17 Sep 2022 08:51:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 10:16:43 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: d250f3aa002d0cd4dcebc7849155ce77a3c0fdb6
X-Git-Newrev: bddf53b7ab05072db580fae99a3ce5673993d6ee
X-Patchwork-Hint: ignore
Message-Id: <20220917085117.3CDE8840A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/tesseract-ocr:
 fix aarch64_be build
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

commit: https://git.buildroot.net/buildroot/commit/?id=bddf53b7ab05072db580fae99a3ce5673993d6ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following aarch64_be build failure probably raised since the
addition of the package:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-none-linux-gnu/10.3.1/../../../../aarch64_be-none-linux-gnu/bin/ld: ./.libs/libtesseract.so: undefined reference to `tesseract::IntSimdMatrix::intSimdMatrixNEON'

Fixes:
 - http://autobuild.buildroot.org/results/b9246a37fcf6be4fabfc491daddadfb09e0a320a

Update the comment about _AUTORECONF=YES, list the two patches since
both touch configure.ac

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: upsdate comment about _AUTORECONF=YES]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f0a96f73643fa2f2aff24deaaef17011f4d3e0e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0002-configure.ac-fix-build-on-aarch64_be.patch | 32 ++++++++++++++++++++++
 package/tesseract-ocr/tesseract-ocr.mk             |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch b/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch
new file mode 100644
index 0000000000..20b8d5ce76
--- /dev/null
+++ b/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch
@@ -0,0 +1,32 @@
+From cffb8a36a987cd0d013d73501dd20c553ff69c77 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Aug 2022 10:21:43 +0200
+Subject: [PATCH] configure.ac: fix build on aarch64_be
+
+Fix the following build failure on aarch64_be:
+
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-none-linux-gnu/10.3.1/../../../../aarch64_be-none-linux-gnu/bin/ld: ./.libs/libtesseract.so: undefined reference to `tesseract::IntSimdMatrix::intSimdMatrixNEON'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b9246a37fcf6be4fabfc491daddadfb09e0a320a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and backported) from:
+https://github.com/tesseract-ocr/tesseract/commit/cffb8a36a987cd0d013d73501dd20c553ff69c77]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 63579c954f..2b05052395 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -170,7 +170,7 @@ case "${host_cpu}" in
+ 
+     ;;
+ 
+-  aarch64)
++  aarch64*)
+ 
+     # ARMv8 always has NEON and does not need special compiler flags.
+     AM_CONDITIONAL([HAVE_NEON], true)
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 5e9da0c648..abe3d39ab6 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -11,6 +11,8 @@ TESSERACT_OCR_LICENSE = Apache-2.0
 TESSERACT_OCR_LICENSE_FILES = LICENSE
 
 # Source from github, no configure script provided
+# 0001-Check-if-platform-supports-feenableexcept.patch
+# 0002-configure.ac-fix-build-on-aarch64_be.patch
 TESSERACT_OCR_AUTORECONF = YES
 
 # cairo, pango and icu are optional dependencies, but only needed for
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
