Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F3CC38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 08:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8295F4023D;
	Wed, 26 Oct 2022 08:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8295F4023D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OeU66TqyXwKv; Wed, 26 Oct 2022 08:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 416CB40225;
	Wed, 26 Oct 2022 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 416CB40225
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 604BB1BF982
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 08:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C55560881
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 08:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C55560881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xjsZ9MDbURzS for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 08:54:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 592C46068D
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 08:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 592C46068D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45DB3870E7; Wed, 26 Oct 2022 08:54:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 10:53:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5b1a0b34a02759ab4ac3a28b01fe50c1b9d2ff2
X-Git-Newrev: bd35c0f363c3192d70b111baba14b40370a206d7
X-Patchwork-Hint: ignore
Message-Id: <20221026085456.45DB3870E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poppler: security bump to version
 22.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd35c0f363c3192d70b111baba14b40370a206d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2022-38784: Poppler prior to and including 22.08.0 contains an
  integer overflow in the JBIG2 decoder
  (JBIG2Stream::readTextRegionSeg() in JBIGStream.cc). Processing a
  specially crafted PDF file or JBIG2 image could lead to a crash or the
  execution of arbitrary code. This is similar to the vulnerability
  described by CVE-2022-38171 in Xpdf.
- Drop patch (already in version)

https://gitlab.freedesktop.org/poppler/poppler/-/blob/poppler-22.10.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch | 27 ----------------------
 package/poppler/poppler.hash                       |  2 +-
 package/poppler/poppler.mk                         |  2 +-
 3 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch b/package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch
deleted file mode 100644
index 40af6a2e00..0000000000
--- a/package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3ea6bca90d87d3f91556205c4e58ca425c6ac437 Mon Sep 17 00:00:00 2001
-From: Marco Genasci <fedeliallalinea@gmail.com>
-Date: Sun, 12 Dec 2021 10:23:37 +0100
-Subject: [PATCH] Include setjmp.h when WITH_JPEG=yes and WITH_PNG=no
-
-[Retrieved from:
-https://gitlab.freedesktop.org/poppler/poppler/-/commit/3ea6bca90d87d3f91556205c4e58ca425c6ac437]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- poppler/ImageEmbeddingUtils.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/poppler/ImageEmbeddingUtils.cc b/poppler/ImageEmbeddingUtils.cc
-index 5c50f1269..c26b9eb2a 100644
---- a/poppler/ImageEmbeddingUtils.cc
-+++ b/poppler/ImageEmbeddingUtils.cc
-@@ -16,6 +16,7 @@
- extern "C" {
- #    include <jpeglib.h>
- }
-+#    include <csetjmp>
- #endif
- #ifdef ENABLE_LIBPNG
- #    include <png.h>
--- 
-GitLab
-
diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index cf6c537063..93681e04af 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  acb840c2c1ec07d07e53c57c4b3a1ff3e3ee2d888d44e1e9f2f01aaf16814de7  poppler-21.12.0.tar.xz
+sha256  04e40fad924a6de62e63017a6fd4c04696c1f526dedc2ba5ef275cedf646292a  poppler-22.10.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index b54262e7c4..02ccf742ac 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 21.12.0
+POPPLER_VERSION = 22.10.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = https://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
