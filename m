Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F08D0E3F7
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 19:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D80E60ADB;
	Thu, 24 Oct 2024 19:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zqz_ODsXwNG2; Thu, 24 Oct 2024 19:32:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A329360A89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A329360A89;
	Thu, 24 Oct 2024 19:32:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD1205A5A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB8BD40898
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyGIRd9eNDLP for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 19:32:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF1F140892
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF1F140892
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:32:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A778082D9C; Thu, 24 Oct 2024 19:32:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 21:29:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ed6aa0fe30319e250fbe700895cfcd603c495ff
X-Git-Newrev: 9b4959ace45a8fadee5bf33cd949ea12ed4fe384
X-Patchwork-Hint: ignore
Message-Id: <20241024193219.A778082D9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xfsprogs: update to 6.11.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b4959ace45a8fadee5bf33cd949ea12ed4fe384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0002 no longer required, upstream fixed the situation.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ibxfs-do-not-try-to-run-the-crc32selftest.patch | 47 ----------------------
 package/xfsprogs/xfsprogs.hash                     |  2 +-
 package/xfsprogs/xfsprogs.mk                       |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch b/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
deleted file mode 100644
index 77bdc19127..0000000000
--- a/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 94ae5db7d017480e103aa6f07cc86648b613d114 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 18 Dec 2016 15:37:27 +0100
-Subject: [PATCH] libxfs: do not try to run the crc32selftest
-
-Even though the crc32selftest is natively compiled (because it is to be
-executed), it fails in cross-compilation as the host may lack the
-required headers, like uuid/uuid.h (e.g. in a minimal environment).
-
-Moreover, running the crc32selftest natively is completely wrong,
-because it passing on the host does not mean it would still pass n the
-target (because endianness or bitness or alignment differences).
-
-So, just disable running the crc32selftest altogether.
-
-Note that there's a remaining bug-in-hiding, because the crc32 table
-generator is natively built, but with the target CFLAGS.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Signed-off-by: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
-[Update for 4.18.0: crc32 has been moved from libxfs to libfrog]
-[Julien: rebased on v6.4.0]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
-Upstream: patch to be superseded by https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=e51b89e657af7843d8c7aea3df49fe1f0f1d4ac2
----
- libfrog/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libfrog/Makefile b/libfrog/Makefile
-index f292afe3..1d0d2083 100644
---- a/libfrog/Makefile
-+++ b/libfrog/Makefile
-@@ -57,9 +57,9 @@ ifeq ($(HAVE_GETMNTENT),yes)
- LCFLAGS += -DHAVE_GETMNTENT
- endif
- 
--LDIRT = gen_crc32table crc32table.h crc32selftest
-+LDIRT = gen_crc32table crc32table.h
- 
--default: crc32selftest ltdepend $(LTLIBRARY)
-+default: ltdepend $(LTLIBRARY)
- 
- crc32table.h: gen_crc32table.c crc32defs.h
- 	@echo "    [CC]     gen_crc32table"
--- 
-2.45.2
-
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index 8c73e14905..a86693419d 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256  c31868418bfbf49a3a9c47fc70cdffde9d96f4ff0051bd04a0881e6654648104  xfsprogs-6.4.0.tar.xz
+sha256  dae3bb432196f7b183b2e6bd5dc44bf33edbd7d0e85bd37d25c235df81b8100a  xfsprogs-6.11.0.tar.xz
 
 # Hash for license files
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index e657c8086d..0234b91d09 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 6.4.0
+XFSPROGS_VERSION = 6.11.0
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
