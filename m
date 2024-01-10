Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937FAC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 449344378A;
	Wed, 10 Jan 2024 20:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 449344378A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGkCGqMei0G0; Wed, 10 Jan 2024 20:20:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DE02437F4;
	Wed, 10 Jan 2024 20:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DE02437F4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AEF61BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECA9543771
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECA9543771
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKsN0J_HOtmt for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03CB7436FF
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03CB7436FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE51585CC4; Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 20:48:12 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 5455abbcc8e092958a93c673480f62130c761550
X-Git-Newrev: b7259165352cf9ff6a834dfec26646dae1ce5f15
X-Patchwork-Hint: ignore
Message-Id: <20240110201651.DE51585CC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/gnuplot: bump to
 version 5.4.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7259165352cf9ff6a834dfec26646dae1ce5f15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Drop second patch (already in version)

http://www.gnuplot.info/ReleaseNotes_5_4_10.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4908332d51fb68a3473d4fb9bbfb34eeb31e2929)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch | 51 ----------------------
 package/gnuplot/gnuplot.hash                       |  8 ++--
 package/gnuplot/gnuplot.mk                         |  2 +-
 3 files changed, 5 insertions(+), 56 deletions(-)

diff --git a/package/gnuplot/0002-term-post.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch b/package/gnuplot/0002-term-post.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch
deleted file mode 100644
index c3edb39cc6..0000000000
--- a/package/gnuplot/0002-term-post.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 84002a5bd7f4cb10e9beffab88ae55b4e982bcea Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sun, 1 Oct 2023 10:20:31 +0200
-Subject: [PATCH] term/post.trm: unbreak !HAVE_DEFLATE_ENCODER builds
-
-Commit 2f2cf617808 (post: handle RGBA images (only current use is to render
-a pixmap)) added an extra '}' outside the HAVE_DEFLATE_ENCODER (gd support)
-conditional, leading to build breakage:
-
-In file included from term.h:298,
-                 from term.c:1211:
-../term/post.trm:4016:11: error: expected declaration specifiers or '...' before string constant
- 4016 |     fputs("%%%%BeginImage\n", gppsfile);
-
-http://autobuild.buildroot.net/results/5676609b6331b645f2e557aca67afe4c3a087433/build-end.log
-
-Fix it by dropping the extra { } added by the above commit.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-Upstream: https://sourceforge.net/p/gnuplot/gnuplot-main/merge-requests/28/
----
- term/post.trm | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/term/post.trm b/term/post.trm
-index 186eb9d3c..100811b86 100644
---- a/term/post.trm
-+++ b/term/post.trm
-@@ -4000,17 +4000,16 @@ PS_image (unsigned int M, unsigned int N, coordval *image, gpiPoint *corner, t_i
- 	cscale = 1.0;
- 
- #ifdef HAVE_DEFLATE_ENCODER
--    if (ps_params->level3) {
-+    if (ps_params->level3)
- 	encoded_image = (void *)PS_encode_png_image(M, N, image, color_mode,
- 					    bits_per_component, max_colors, cscale,
- 					    &num_encoded_bytes);
--    } else {
-+    else
- #endif
- 	encoded_image = PS_encode_image(M, N, image, color_mode,
- 					bits_per_component, max_colors, cscale,
- 					(ps_params->level1 ? PS_ASCII_HEX : PS_ASCII85),
- 					&num_encoded_bytes);
--    }
- 
- 
-     fputs("%%%%BeginImage\n", gppsfile);
--- 
-2.30.2
-
diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 6ed24b6d3c..39dacd50a4 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.9/
-md5  345533e461e41c263b3293f46651f0b2  gnuplot-5.4.9.tar.gz
-sha1  1a3953660656a38178ae2b368efa895af55a5001  gnuplot-5.4.9.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.10/
+md5  334851e63450362bdb95e67fa8a23665  gnuplot-5.4.10.tar.gz
+sha1  9981e5b0111c07d376deef571ccc75ce4b4ebbd2  gnuplot-5.4.10.tar.gz
 # Locally computed
-sha256  a328a021f53dc05459be6066020e9a71e8eab6255d3381e22696120d465c6a97  gnuplot-5.4.9.tar.gz
+sha256  975d8c1cc2c41c7cedc4e323aff035d977feb9a97f0296dd2a8a66d197a5b27c  gnuplot-5.4.10.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index b98da4267a..825863d080 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.4.9
+GNUPLOT_VERSION = 5.4.10
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
