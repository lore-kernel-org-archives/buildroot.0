Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62476C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15DEC43713;
	Fri,  5 Jan 2024 12:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15DEC43713
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A68pZGyUUNm9; Fri,  5 Jan 2024 12:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E156B435DF;
	Fri,  5 Jan 2024 12:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E156B435DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5D5F1BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95DB7614D2
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95DB7614D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JyZNBT6fbRW for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E2F2614DB
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E2F2614DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6AF6D80153; Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 13:51:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb74b6054988e51b40dcb0b4b672fd540b37345c
X-Git-Newrev: 9e2e85df90104cf897378ef4a3b0a59cb8ff9a56
X-Patchwork-Hint: ignore
Message-Id: <20240105125238.6AF6D80153@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pv: bump to version 1.8.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e2e85df90104cf897378ef4a3b0a59cb8ff9a56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to tar.gz tarball as tar.bz2 is not available anymore
- License is GPL-3.0+ since
  https://codeberg.org/a-j-wood/pv/commit/e5cc71b4d22bd018fa55b8e7c795c7bf94776b2d
- workarounds can be dropped as standard gnu automake is used since
  https://codeberg.org/a-j-wood/pv/commit/e99548ea8a2b1dd4e163036cabf4e26c40fe5170

https://codeberg.org/a-j-wood/pv/src/tag/v1.8.5/docs/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pv/pv.hash |  4 ++--
 package/pv/pv.mk   | 24 +++---------------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index b3dd71f74b..ed4cc21d89 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88d5a3188814fdc603  pv-1.6.20.tar.bz2
+sha256  d22948d06be06a5be37336318de540a2215be10ab0163f8cd23a20149647b780  pv-1.8.5.tar.gz
 
 # Hash for license file
-sha256  280e182171df3e9bb4a9b407326e88521151fcb8f4f8557255f26177d5900ccf  doc/COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 27060cf07e..f7243da8be 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,28 +4,10 @@
 #
 ################################################################################
 
-PV_VERSION = 1.6.20
-PV_SOURCE = pv-$(PV_VERSION).tar.bz2
+PV_VERSION = 1.8.5
 PV_SITE = http://www.ivarch.com/programs/sources
-PV_LICENSE = Artistic-2.0
-PV_LICENSE_FILES = doc/COPYING
+PV_LICENSE = GPL-3.0+
+PV_LICENSE_FILES = docs/COPYING
 PV_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
-# --relax linker option is enabled by default on sparc/sparc64
-# architectures, and it can't be used together with -r option, so
-# disable it.
-ifeq ($(BR2_sparc)$(BR2_sparc64),y)
-PV_LDFLAGS = "-Wl,--no-relax"
-endif
-
-# While 'pv' uses autoconf, it does not use automake for its
-# makefiles. It uses $(LD) $(LDFLAGS) to achieve partial linking, but
-# using 'ld' directly doesn't work well with some toolchain
-# configuration, as the ld default emulation may not necessarily be
-# the correct one. By passing the below values for LD and LDFLAGS, we
-# ensure that 'gcc' is used to do these partial linking steps.
-PV_MAKE_OPTS = \
-	LD="$(TARGET_CC)" \
-	LDFLAGS="-Wl,-r -nostdlib $(PV_LDFLAGS)"
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
