Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53A7CE8E68
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 11:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E43C80C0B;
	Thu, 24 Oct 2024 11:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpe0sxS-wuLJ; Thu, 24 Oct 2024 11:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 930B980C13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 930B980C13;
	Thu, 24 Oct 2024 11:56:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDF944960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 11:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D90F540063
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 11:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6efDr7021vh for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 11:56:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7363B40773
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7363B40773
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7363B40773
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 11:56:09 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B9490352067A; Thu, 24 Oct 2024 13:56:06 +0200 (CEST)
Date: Thu, 24 Oct 2024 13:56:06 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zxo11uCFAYwoDq4p@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1729770966; bh=IpZ5ny7ssL5wKqT2tNEiAa1Abf1SRq1neiOvE9u/EmY=;
 h=Date:From:To:Subject:From;
 b=lgijSNFyrmSGuuILGWHElkYCAT5tySCJINsgzcOBzS9rcw+9rTFivaOy8TwRuUFDU
 ZN5cIFuklr0ADcG25hKm5ha35omNkhkLIoL2el+IAJSr0Hx06+VuR7PqbtWlbS/ySv
 xmln2KO02n9SJhmeeg2Mpvfd9DuDS2zmUc08STC+0YelZB3x4dO/X01kLv+2fxsagV
 tO8MJkfQfi/JoIAMec5xhMnaFXgyMc4LsGlLzNvHU/pqMry9MjgEObg7nn4VIbfcjE
 UcWRECfPVakQ+4q9cmFl4sw9FeJ66b6T0lr2DRqeGxo4Uq8EUqpIykhdHRHwcQkVh/
 hcyxNU0wtNslA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=lgijSNFy
Subject: [Buildroot] [PATCH] package/xfsprogs: update to 6.11.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch 0002 no longer required, upstream fixed the situation.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...-do-not-try-to-run-the-crc32selftest.patch | 47 -------------------
 package/xfsprogs/xfsprogs.hash                |  2 +-
 package/xfsprogs/xfsprogs.mk                  |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
