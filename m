Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D106C77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8099B614B8;
	Sat, 13 May 2023 20:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8099B614B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9bNEdeFAe1q; Sat, 13 May 2023 20:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F8161492;
	Sat, 13 May 2023 20:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8F8161492
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 570811BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D90384013
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D90384013
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ty9YOZsLlFdt for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:11:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 696F883F9C
 for <buildroot@buildroot.org>; Sat, 13 May 2023 20:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 696F883F9C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55060865CE; Sat, 13 May 2023 20:11:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 22:11:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe547366ef9c92da537e762b8a22e17c9badcaae
X-Git-Newrev: eeff8d24e3fbfa85dabeee31a7623838093fa30b
X-Patchwork-Hint: ignore
Message-Id: <20230513201135.55060865CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnftnl: bump to version 1.2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=eeff8d24e3fbfa85dabeee31a7623838093fa30b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also: Switch to tar.xz as the package is not distributed as a .bz2 any longer.
Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnftnl/libnftnl.hash | 2 +-
 package/libnftnl/libnftnl.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 113110fc1b..0cb3917f2d 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256  e916ea9b79f9518560b9a187251a7c042442a9ecbce7f36be7908888605d0255  libnftnl-1.2.3.tar.bz2
+sha256  966de0a8120c8a53db859889749368bfb2cba0c4f0b4c1a30d264eccc45f1226  libnftnl-1.2.5.tar.xz
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index fd87f70091..a7045337d0 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.2.3
+LIBNFTNL_VERSION = 1.2.5
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
-LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
+LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.xz
 LIBNFTNL_LICENSE = GPL-2.0+
 LIBNFTNL_LICENSE_FILES = COPYING
 LIBNFTNL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
