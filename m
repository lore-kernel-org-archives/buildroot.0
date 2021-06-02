Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED09C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:40:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A2E560F8F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A2E560F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18BE940357;
	Tue,  3 Aug 2021 21:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7L2EMEw-TOC; Tue,  3 Aug 2021 21:40:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABF8B4036B;
	Tue,  3 Aug 2021 21:40:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82EB01BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB92B40535
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQt9nk6VTNrt for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21D8740544
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6C32A864A8; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 2 Jun 2021 19:35:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7cf8adc03999a39a9b80a4612b5f14baae73ce5c
X-Git-Newrev: cb3b89e4cdabb2046b2cb1b2cacdf3feac98b777
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.6C32A864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libraw: add
 Libs.private to libraw.pc
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=cb3b89e4cdabb2046b2cb1b2cacdf3feac98b777
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add Libs.private to libraw.pc to fix the following static build failure
with imagemagick which is raised since commit
2f47cfade4b298350d056f6d9a7525b837e2ba23:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libjasper.a(jpg_enc.c.o): in function `jpg_encode':
jpg_enc.c:(.text+0x1f4): undefined reference to `jpeg_stdio_dest'

Fixes:
 - http://autobuild.buildroot.org/results/88e43a1ea2059a684e50b0f5f2af407e8c6df2e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Add-Libs.private-to-libraw.pc.patch       | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/libraw/0001-Add-Libs.private-to-libraw.pc.patch b/package/libraw/0001-Add-Libs.private-to-libraw.pc.patch
new file mode 100644
index 0000000000..a90af23178
--- /dev/null
+++ b/package/libraw/0001-Add-Libs.private-to-libraw.pc.patch
@@ -0,0 +1,67 @@
+From ad911cbc3c16397cf9d326c30571a4d1edaaa03f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 2 Jun 2021 07:45:40 +0200
+Subject: [PATCH] Add Libs.private to libraw.pc
+
+Add Libs.private to libraw.pc to avoid the following static build
+failure when enabling libraw with jasper support in imagemagick:
+
+/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libjasper.a(jpg_enc.c.o): in function `jpg_encode':
+jpg_enc.c:(.text+0x1f4): undefined reference to `jpeg_stdio_dest'
+
+-ljpeg must be added after -ljasper because jasper depends on jpeg
+
+Fixes:
+ - http://autobuild.buildroot.org/results/88e43a1ea2059a684e50b0f5f2af407e8c6df2e1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/LibRaw/LibRaw/pull/406]
+---
+ configure.ac   | 2 ++
+ libraw.pc.in   | 1 +
+ libraw_r.pc.in | 1 +
+ 3 files changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 4ab2f313..7bf5fdfd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -57,6 +57,7 @@ if test x$jpeg = xtrue; then
+                         AC_CHECK_HEADERS([jpeglib.h], [
+                                 CPPFLAGS="$CPPFLAGS -DUSE_JPEG -DUSE_JPEG8"
+                                 LIBS="$LIBS -ljpeg"
++                                AC_SUBST([PACKAGE_LIBS_PRIVATE],"-ljpeg $PACKAGE_LIBS_PRIVATE")
+                         ], AC_MSG_WARN([no jpeg headers found]))
+                 ],
+                 AC_MSG_WARN([libjpeg not found])
+@@ -78,6 +79,7 @@ if test x$jasper = xtrue; then
+                         AC_CHECK_HEADERS([jasper/jasper.h], [
+                                 CPPFLAGS="$CPPFLAGS -DUSE_JASPER"
+                                 LIBS="$LIBS -ljasper"
++                                AC_SUBST([PACKAGE_LIBS_PRIVATE],"-ljasper $PACKAGE_LIBS_PRIVATE")
+                         ], AC_MSG_WARN([no jasper headers found]))
+                 ],
+                 AC_MSG_WARN([libjasper not found])
+diff --git a/libraw.pc.in b/libraw.pc.in
+index 1bab18b8..c95fbc48 100644
+--- a/libraw.pc.in
++++ b/libraw.pc.in
+@@ -8,4 +8,5 @@ Description: Raw image decoder library (non-thread-safe)
+ Requires: @PACKAGE_REQUIRES@
+ Version: @PACKAGE_VERSION@
+ Libs: -L${libdir} -lraw -lstdc++@PC_OPENMP@
++Libs.private: @PACKAGE_LIBS_PRIVATE@
+ Cflags: -I${includedir}/libraw -I${includedir}
+diff --git a/libraw_r.pc.in b/libraw_r.pc.in
+index e8427271..92bbbffa 100644
+--- a/libraw_r.pc.in
++++ b/libraw_r.pc.in
+@@ -8,4 +8,5 @@ Description: Raw image decoder library (thread-safe)
+ Requires: @PACKAGE_REQUIRES@
+ Version: @PACKAGE_VERSION@
+ Libs: -L${libdir} -lraw_r -lstdc++@PC_OPENMP@
++Libs.private: @PACKAGE_LIBS_PRIVATE@
+ Cflags: -I${includedir}/libraw -I${includedir}
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
