Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D122CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 19:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 780C183F24;
	Fri, 28 Jan 2022 19:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVYHW8fDX94Z; Fri, 28 Jan 2022 19:35:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE18083F22;
	Fri, 28 Jan 2022 19:35:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FE131BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 19:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F15861089
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 19:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Th4QR9I6qXNQ for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 19:34:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71D7A60C24
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 19:34:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C9618829F4; Fri, 28 Jan 2022 19:27:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 20:27:26 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b0cbf7935acc8b18ee047381ec657db418e22147
X-Git-Newrev: 2aa5e89e153045e0a54c43b0fa4dc3dbc8ab510a
X-Patchwork-Hint: ignore
Message-Id: <20220128192741.C9618829F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libjpeg: security
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

commit: https://git.buildroot.net/buildroot/commit/?id=2aa5e89e153045e0a54c43b0fa4dc3dbc8ab510a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
