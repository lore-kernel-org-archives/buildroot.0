Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865D8C7EE2F
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 23:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DA91400A6;
	Sun, 11 Jun 2023 23:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DA91400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6S00teBJx_Ss; Sun, 11 Jun 2023 23:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 715FF402F2;
	Sun, 11 Jun 2023 23:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 715FF402F2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5E781BF2F8
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 23:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA84941621
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 23:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA84941621
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2K4uAfK1411p for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 23:36:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C35B7415F8
Received: from 13.mo584.mail-out.ovh.net (13.mo584.mail-out.ovh.net
 [178.33.251.8])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C35B7415F8
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 23:36:32 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.20.200])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 5D5F9233D5
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 23:36:30 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-pl8sk (unknown [10.109.138.36])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A9D591FD10;
 Sun, 11 Jun 2023 23:36:29 +0000 (UTC)
Received: from blach.pl ([37.59.142.107])
 by ghost-submission-6684bf9d7b-pl8sk with ESMTPSA
 id ashYIH1ahmSPFgAAc/dVnA
 (envelope-from <grzegorz@blach.pl>); Sun, 11 Jun 2023 23:36:29 +0000
X-OVh-ClientIp: 91.239.248.252
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 01:36:14 +0200
Message-Id: <20230611233619.128038-1-grzegorz@blach.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6520649311172247873
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefirhiivghgohhriicuuehlrggthhcuoehgrhiivghgohhriiessghlrggthhdrphhlqeenucggtffrrghtthgvrhhnpeeuhfeiudffleeujeeghfetvddutdetjeekjeejfeekgfefheeivddvleffffelfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdeluddrvdefledrvdegkedrvdehvddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhiivghgohhriiessghlrggthhdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0019b8adceb-b276-486e-806a-09f4414268f4,
 8D931DDE0DEECB89AEA118D672F623587F6625E2) smtp.auth=grzegorz@blach.pl
Subject: [Buildroot] [PATCH 1/6] package/f2fs-tools: bump to version 1.16.0
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
Cc: Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 ...1-configure-ac-fix-cross-compilation.patch | 88 -------------------
 ...s-tools-fix-build-error-on-lz4-1-9-4.patch | 34 -------
 package/f2fs-tools/f2fs-tools.hash            |  2 +-
 package/f2fs-tools/f2fs-tools.mk              |  2 +-
 4 files changed, 2 insertions(+), 124 deletions(-)
 delete mode 100644 package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch
 delete mode 100644 package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch

diff --git a/package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch b/package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch
deleted file mode 100644
index 0e3d4da191..0000000000
--- a/package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 32e7d272344024c216f155c3463dd2d548f3fafd Mon Sep 17 00:00:00 2001
-From: Nick Hainke <vincent@systemli.org>
-Date: Mon, 4 Jul 2022 11:29:19 +0200
-Subject: configure.ac: fix cross compilation
-
-AC_CHECK_LIB seems to not work correctly with OpenWrt. Add possibility
-to disable lz4 and lzo2 manually.
-
-Fixes errors in the form of:
-  Package f2fsck is missing dependencies for the following libraries:
-  liblz4.so.1
-  liblzo2.so.2
-
-Signed-off-by: Nick Hainke <vincent@systemli.org>
-Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
-[Retrieved from:
-https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=32e7d272344024c216f155c3463dd2d548f3fafd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 44 ++++++++++++++++++++++++++++++++++----------
- 1 file changed, 34 insertions(+), 10 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ea39461..dbe9ad3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -50,6 +50,18 @@ AC_ARG_WITH([blkid],
- 	[],
- 	[with_blkid=check])
- 
-+AC_ARG_WITH([lzo2],
-+	[AS_HELP_STRING([--without-lzo2],
-+	  [Ignore presence of liblzo2 and disable lzo2 support])],
-+	[],
-+	[with_lzo2=check])
-+
-+AC_ARG_WITH([lz4],
-+	[AS_HELP_STRING([--without-lz4],
-+	  [Ignore presence of liblz4 and disable lz4 support])],
-+	[],
-+	[with_lz4=check])
-+
- # Checks for programs.
- AC_PROG_CC
- AM_PROG_AR
-@@ -71,17 +83,29 @@ AS_IF([test "x$with_blkid" != xno],
-         fi
- 	], -lblkid)])
- 
--AC_CHECK_LIB([lzo2], [main],
--	[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
--		AC_DEFINE([HAVE_LIBLZO2], [1],
--		[Define if you have liblzo2])
--	], [], [])
-+AS_IF([test "x$with_lzo2" != xno],
-+	[AC_CHECK_LIB([lzo2], [main],
-+		[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
-+			AC_DEFINE([HAVE_LIBLZO2], [1],
-+			[Define if you have liblzo2])
-+		],
-+		[if test "x$with_lzo2" != xcheck; then
-+			AC_MSG_FAILURE(
-+                [--with-lzo2 was given, but test for lzo2 failed])
-+        fi
-+	], -llzo2)])
- 
--AC_CHECK_LIB([lz4], [main],
--	[AC_SUBST([liblz4_LIBS], ["-llz4"])
--		AC_DEFINE([HAVE_LIBLZ4], [1],
--		[Define if you have liblz4])
--	], [], [])
-+AS_IF([test "x$with_lz4" != xno],
-+	[AC_CHECK_LIB([lz4], [main],
-+		[AC_SUBST([liblz4_LIBS], ["-llz4"])
-+			AC_DEFINE([HAVE_LIBLZ4], [1],
-+			[Define if you have liblz4])
-+		],
-+		[if test "x$with_lz4" != xcheck; then
-+			AC_MSG_FAILURE(
-+                [--with-lz4 was given, but test for lz4 failed])
-+        fi
-+	], -llz4)])
- 
- AS_IF([test "x$with_selinux" != xno],
- 	[AC_CHECK_LIB([selinux], [getcon],
--- 
-cgit 
-
diff --git a/package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch b/package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch
deleted file mode 100644
index b43def6bb7..0000000000
--- a/package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 19f77c6f6277a274434d6d8883f50e7955c6a8db Mon Sep 17 00:00:00 2001
-From: Jaegeuk Kim <jaegeuk@kernel.org>
-Date: Mon, 29 Aug 2022 11:03:35 -0700
-Subject: f2fs-tools: fix build error on lz4-1.9.4
-
-LZ4_STREAMSIZE_U64 is undefined in new lz4 lib.
-
-Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
-[Retrieved from:
-https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=19f77c6f6277a274434d6d8883f50e7955c6a8db]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- fsck/compress.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/fsck/compress.c b/fsck/compress.c
-index b413492..b15f0a4 100644
---- a/fsck/compress.c
-+++ b/fsck/compress.c
-@@ -32,10 +32,7 @@
- #ifdef HAVE_LIBLZ4
- #define LZ4_MEMORY_USAGE		14
- #define LZ4_MAX_INPUT_SIZE		0x7E000000 /* 2 113 929 216 bytes */
--#ifndef LZ4_STREAMSIZE
--#define LZ4_STREAMSIZE			(LZ4_STREAMSIZE_U64 * sizeof(long long))
--#endif
--#define LZ4_MEM_COMPRESS		LZ4_STREAMSIZE
-+#define LZ4_MEM_COMPRESS		sizeof(LZ4_stream_t)
- #define LZ4_ACCELERATION_DEFAULT	1
- #define LZ4_WORK_SIZE			ALIGN_UP(LZ4_MEM_COMPRESS, 8)
- #endif
--- 
-cgit 
-
diff --git a/package/f2fs-tools/f2fs-tools.hash b/package/f2fs-tools/f2fs-tools.hash
index 8d5ff31f0d..d1f183afff 100644
--- a/package/f2fs-tools/f2fs-tools.hash
+++ b/package/f2fs-tools/f2fs-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  147d471040b44900283ce2c935f1d35d13d7f40008e7cb8fab2b69f54da01a4f  f2fs-tools-1.15.0.tar.gz
+sha256  208c7a07e95383fbd7b466b5681590789dcb41f41bf197369c41a95383b57c5e  f2fs-tools-1.16.0.tar.gz
 sha256  662abb3a8a80b36ae7036c289dd1e03b361ee5dd2e6fd5211d0d8d029146449f  COPYING
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index f94244f2ad..a92ab4fe3e 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = 1.15.0
+F2FS_TOOLS_VERSION = 1.16.0
 F2FS_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
 F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
