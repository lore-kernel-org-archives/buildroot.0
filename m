Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08D4EC8739
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99E4082FEA;
	Thu,  7 Sep 2023 15:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99E4082FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vN3D7NbINuw7; Thu,  7 Sep 2023 15:21:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5FE883BAC;
	Thu,  7 Sep 2023 15:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5FE883BAC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 085F41BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 974A541DC3
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 974A541DC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VORBWFrSsRsx for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBC0D41D80
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBC0D41D80
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDAC486A1F; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 22:15:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7da59a69b1a747671e46ae8a995f323849206c3e
X-Git-Newrev: 527e538a82754ad5ca412c1612328ec5e6d78b78
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.CDAC486A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgit2: bump to 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=527e538a82754ad5ca412c1612328ec5e6d78b78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version makes it explicit that it uses libxdiff, a library which is
not maintained upstream since 2008.  It now have numerous forks, none of
them sticking out.  For now, use the one which is bundled in the libgit2
sources.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 4dd6519ca3..1997c3ba8e 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d25866a4ee275a64f65be2d9a663680a5cf1ed87b7ee4c534997562c828e500d  libgit2-1.6.4.tar.gz
+sha256  d9d0f84a86bf98b73e68997f5c1543cc5067d0ca9c7a5acaba3e8d117ecefef3  libgit2-1.7.0.tar.gz
 sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 9ddf2374bb..93505f7d85 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.6.4
+LIBGIT2_VERSION = 1.7.0
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
@@ -12,7 +12,8 @@ LIBGIT2_LICENSE = \
 	BSD-3-Clause (sha256), \
 	wildmatch license (wildmatch), \
 	CC0-1.0 (xoroshiro256), \
-	BSD-2-Clause (basename_r)
+	BSD-2-Clause (basename_r), \
+	LGPL-2.1+ (libxdiff)
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_CPE_ID_VENDOR = libgit2_project
 LIBGIT2_INSTALL_STAGING = YES
@@ -23,6 +24,7 @@ LIBGIT2_CONF_OPTS = \
 	-DREGEX_BACKEND=regcomp \
 	-DUSE_HTTP_PARSER=system \
 	-DUSE_NTLMCLIENT=OFF \
+	-DUSE_XDIFF=builtin \
 	-DUSE_THREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
 
 LIBGIT2_SUPPORTS_IN_SOURCE_BUILD = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
