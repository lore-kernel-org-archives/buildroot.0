Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E53C10F04
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1B014368B;
	Thu, 30 Nov 2023 23:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B014368B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04hEu2Pn78vB; Thu, 30 Nov 2023 23:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B06B4369A;
	Thu, 30 Nov 2023 23:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B06B4369A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D0B41BF983
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC75341ED7
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC75341ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Rfwokr7Ipkl for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22B8E41E5F
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22B8E41E5F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 103EA8766E; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:40:30 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9119cd3d621bc625b403e8f41cfb2af72e5c4705
X-Git-Newrev: 178f44b18fe1ead04d32c4a5e3915e5a5ac4b8eb
X-Patchwork-Hint: ignore
Message-Id: <20231130230401.103EA8766E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/motion: fix webp
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=178f44b18fe1ead04d32c4a5e3915e5a5ac4b8eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failure raised since bump of webp to version
1.3.2 in commit c88c1d3319dd24fa833455a2e7d96bc4585bab7f:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/13.2.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: picture.o: undefined reference to symbol 'WebPMemoryWriterClear'
/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/13.2.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-9/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib64/libwebp.so.7: error adding symbols: DSO missing from command line

Fixes:
 - http://autobuild.buildroot.org/results/9b859a701debeaddf1f9909e16adc6811a620576

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1267a234fff8c5270d8ead5541167053771636b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0002-Include-libwebp-when-WEBP-is-enabled.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch b/package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch
new file mode 100644
index 0000000000..a1536a7d2f
--- /dev/null
+++ b/package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch
@@ -0,0 +1,26 @@
+From 40ecd71ff361442f1579089481619dd7cae90ffd Mon Sep 17 00:00:00 2001
+From: Piotr Mionskowski <piotr.mionskowski@gmail.com>
+Date: Sun, 9 Jul 2023 01:44:49 +0200
+Subject: [PATCH] Include libwebp when WEBP is enabled
+
+Upstream: https://github.com/Motion-Project/motion/commit/40ecd71ff361442f1579089481619dd7cae90ffd
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ce588f65..ee45ac37 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -191,8 +191,8 @@ AS_IF([test "${WEBP}" = "yes" ], [
+     AS_IF([pkg-config libwebpmux ], [
+         AC_MSG_RESULT(yes)
+         AC_DEFINE([HAVE_WEBP], [1], [Define to 1 if WEBP is around])
+-        TEMP_CFLAGS="$TEMP_CFLAGS "`pkg-config --cflags libwebpmux`
+-        TEMP_LIBS="$TEMP_LIBS "`pkg-config --libs libwebpmux`
++        TEMP_CFLAGS="$TEMP_CFLAGS "`pkg-config --cflags libwebpmux libwebp`
++        TEMP_LIBS="$TEMP_LIBS "`pkg-config --libs libwebpmux libwebp`
+       ],[
+         AC_MSG_RESULT(no)
+       ]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
