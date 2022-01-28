Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EDBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 19:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41574405CA;
	Fri, 28 Jan 2022 19:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PB1ikXik5ewb; Fri, 28 Jan 2022 19:34:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1184E405C0;
	Fri, 28 Jan 2022 19:34:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19E741BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 19:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 157CA415F3
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 19:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5dnrfyLU3V7u for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 19:34:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50D7F415DF
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 19:34:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A3FBC829F4; Fri, 28 Jan 2022 19:27:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 20:27:21 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 5c5064a8b489070a46e7075be4db17f17b1e1fcf
X-Git-Newrev: 0eb0c1bba0876cfa19e83a0d7284aa7431157f05
X-Patchwork-Hint: ignore
Message-Id: <20220128192734.A3FBC829F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libjpeg: security
 bump to version 9e
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

commit: https://git.buildroot.net/buildroot/commit/?id=0eb0c1bba0876cfa19e83a0d7284aa7431157f05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

rdgif.c, cderror.h: add sanity check for GIF image dimensions.
Thank to Casper Sun for cjpeg potential vulnerability report.

- Update hash of README (changes not related to license)
- Update indentation in hash file (two spaces)

https://jpegclub.org/reference/reference-sources/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b5e36f80a6629ef5701d4751d7fc6f7dd6a98476)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjpeg/libjpeg.hash | 4 ++--
 package/libjpeg/libjpeg.mk   | 8 ++------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/libjpeg/libjpeg.hash b/package/libjpeg/libjpeg.hash
index 4f0a677d04..1a2e82caef 100644
--- a/package/libjpeg/libjpeg.hash
+++ b/package/libjpeg/libjpeg.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256	99cb50e48a4556bc571dadd27931955ff458aae32f68c4d9c39d624693f69c32	jpegsrc.v9d.tar.gz
-sha256	3dc4e4a145c907a96bd6a0e40be3f722fecf061951909143cdff5365cba9c78c	README
+sha256  4077d6a6a75aeb01884f708919d25934c93305e49f7e3f36db9129320e6f4f3d  jpegsrc.v9e.tar.gz
+sha256  50c1c5978d490c7f13062d91c4b89affc83774f87bc4568a714f748b62a5b216  README
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index 6b55aba7e5..caf7f05f44 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -4,12 +4,8 @@
 #
 ################################################################################
 
-LIBJPEG_VERSION = 9d
-# 9d was released 2020-01-12, but the tarball was replaced upstream circa
-# 2021-03, causing hash mismatch. Until there is a new version released,
-# use our cached copy from s.b.o.
-#LIBJPEG_SITE = http://www.ijg.org/files
-LIBJPEG_SITE = http://sources.buildroot.org/libjpeg
+LIBJPEG_VERSION = 9e
+LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = IJG
 LIBJPEG_LICENSE_FILES = README
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
