Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB46C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 13:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21D7F40B65;
	Sat, 24 Sep 2022 13:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21D7F40B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Em834c73BX6; Sat, 24 Sep 2022 13:57:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1982140B72;
	Sat, 24 Sep 2022 13:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1982140B72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87CB81BF968
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 13:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FE1083E76
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 13:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FE1083E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FqfB_Xg6yLJT for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 13:57:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DE0583337
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 13:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DE0583337
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4844C8434C; Sat, 24 Sep 2022 13:57:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 15:52:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f28cccb1468cbc3661ef8e628b3cf07c3375cd33
X-Git-Newrev: a70659328200244c1e3c491f31b9f3a81360176d
X-Patchwork-Hint: ignore
Message-Id: <20220924135717.4844C8434C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnu-efi: bump to version 3.0.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=a70659328200244c1e3c491f31b9f3a81360176d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes from 3.0.14 to 3.0.15:

8b018e67212957de176292f95718df48f49a418b Bump revision to VERSION = 3.0.15
803b49c40bb0b720b90d9c31d372911f1b946aa7 */*.S: add non-executable GNU stack marking on ELF-linux
2ed6486834634130fe7bc9b8803b0113767fc7c1 lib/Makefile: add .o file dependency on libsubdirs targets
6b28563584edd08ab9c94a746a8061434c165837 Handle __mips64

The patch
0002-inc-efi-.h-also-support-__mips64-to-recognize-mips64.patch is
dropped as it is equivalent to upstream commit
6b28563584edd08ab9c94a746a8061434c165837 ("Handle __mips64")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...also-support-__mips64-to-recognize-mips64.patch | 60 ----------------------
 package/gnu-efi/gnu-efi.hash                       |  6 +--
 package/gnu-efi/gnu-efi.mk                         |  2 +-
 3 files changed, 4 insertions(+), 64 deletions(-)

diff --git a/package/gnu-efi/0002-inc-efi-.h-also-support-__mips64-to-recognize-mips64.patch b/package/gnu-efi/0002-inc-efi-.h-also-support-__mips64-to-recognize-mips64.patch
deleted file mode 100644
index 818dd1d7f6..0000000000
--- a/package/gnu-efi/0002-inc-efi-.h-also-support-__mips64-to-recognize-mips64.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 2c0ad0d7547558be59ef10dd289e619373341704 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 21 Jul 2022 09:47:49 +0200
-Subject: [PATCH] inc/efi*.h: also support __mips64 to recognize mips64
-
-gcc built-in define for the MIPS64 architecture is __mips64, not
-__mips64__, so the current condition did not match for gcc. See
-https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/mips/mips.h;h=47aac9d3d61245c4d3df5dbd0bbcd833190de7c3;hb=2d280e7eafc086e9df85f50ed1a6526d6a3a204d#l431
-in the gcc source.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://sourceforge.net/p/gnu-efi/mailman/message/37683797/
----
- inc/efi.h      | 2 +-
- inc/efilib.h   | 2 +-
- inc/efirtlib.h | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/inc/efi.h b/inc/efi.h
-index 43c832e..b193932 100644
---- a/inc/efi.h
-+++ b/inc/efi.h
-@@ -48,7 +48,7 @@ Revision History
- #include "aarch64/efibind.h"
- #elif defined (_M_ARM) || defined(__arm__)
- #include "arm/efibind.h"
--#elif defined (_M_MIPS64) || defined(__mips64__)
-+#elif defined (_M_MIPS64) || defined(__mips64__) || defined(__mips64)
- #include "mips64el/efibind.h"
- #elif defined (__riscv) && __riscv_xlen == 64
- #include "riscv64/efibind.h"
-diff --git a/inc/efilib.h b/inc/efilib.h
-index 9f748ad..a2b39b2 100644
---- a/inc/efilib.h
-+++ b/inc/efilib.h
-@@ -31,7 +31,7 @@ Revision History
- #include "aarch64/efilibplat.h"
- #elif defined (_M_ARM) || defined(__arm__)
- #include "arm/efilibplat.h"
--#elif defined (_M_MIPS64) || defined(__mips64__)
-+#elif defined (_M_MIPS64) || defined(__mips64__) || defined(__mips64)
- #include "mips64el/efilibplat.h"
- #elif defined (__riscv) && __riscv_xlen == 64
- #include "riscv64/efilibplat.h"
-diff --git a/inc/efirtlib.h b/inc/efirtlib.h
-index 8643061..518859e 100644
---- a/inc/efirtlib.h
-+++ b/inc/efirtlib.h
-@@ -30,7 +30,7 @@ Revision History
- #include "aarch64/efilibplat.h"
- #elif defined (_M_ARM) || defined(__arm__)
- #include "arm/efilibplat.h"
--#elif defined (_M_MIPS64) || defined(__mips64__)
-+#elif defined (_M_MIPS64) || defined(__mips64__) || defined(__mips64)
- #include "mips64el/efilibplat.h"
- #elif defined (__riscv) && __riscv_xlen == 64
- #include "riscv64/efilibplat.h"
--- 
-2.36.1
-
diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 599d234436..251a99e5d7 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/gnu-efi/files
-md5  e2902ad09d53d7a94dc96a449dbb4058  gnu-efi-3.0.14.tar.bz2
-sha1  e46b3726478838e85d0a79d0a0d3508c4f2995cf  gnu-efi-3.0.14.tar.bz2
+md5  192d94e995ddd4ebdce4903adfd06039  gnu-efi-3.0.15.tar.bz2
+sha1  40c8a4715cf8c409a093c8d2ca9f5d5b24d73058  gnu-efi-3.0.15.tar.bz2
 # Locally computed
-sha256  b73b643a0d5697d1f396d7431448e886dd805668789578e3e1a28277c9528435  gnu-efi-3.0.14.tar.bz2
+sha256  931a257b9c5c1ba65ff519f18373c438a26825f2db7866b163e96d1b168f20ea  gnu-efi-3.0.15.tar.bz2
 sha256  42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 13e925302d..93b5888370 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 3.0.14
+GNU_EFI_VERSION = 3.0.15
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
