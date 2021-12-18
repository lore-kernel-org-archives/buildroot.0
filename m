Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FCEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B1084BEC;
	Sat, 18 Dec 2021 22:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_G3RvYWOb6E; Sat, 18 Dec 2021 22:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55BD383FBF;
	Sat, 18 Dec 2021 22:27:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C539E1BF23C
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5174417C9
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5nxUaHd0Po7 for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:27:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0445E416F7
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:27:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 865A37F93B; Sat, 18 Dec 2021 22:22:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 23:27:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab0c5e305fb48204c99db87a71e461f597a00b2e
X-Git-Newrev: d5efc8a0102f7470fef3120d6cf956f3e95d870f
X-Patchwork-Hint: ignore
Message-Id: <20211218222209.865A37F93B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/guile: drop first patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5efc8a0102f7470fef3120d6cf956f3e95d870f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop first patch which is already included in guile since version 2.0.1:
https://git.savannah.gnu.org/cgit/guile.git/commit/?id=ffd3e55cfd12a3559621e3130d613d319243512d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...y.patch => 0001-calculate-csqrt_manually.patch} |  0
 package/guile/0001-fix_arm_endianness.patch        | 25 ----------------------
 ...2-Makefile.am-fix-build-without-makeinfo.patch} |  0
 ...e-system-base-target.scm-support-riscv32.patch} |  0
 4 files changed, 25 deletions(-)

diff --git a/package/guile/0002-calculate-csqrt_manually.patch b/package/guile/0001-calculate-csqrt_manually.patch
similarity index 100%
rename from package/guile/0002-calculate-csqrt_manually.patch
rename to package/guile/0001-calculate-csqrt_manually.patch
diff --git a/package/guile/0001-fix_arm_endianness.patch b/package/guile/0001-fix_arm_endianness.patch
deleted file mode 100644
index 67c0b606ee..0000000000
--- a/package/guile/0001-fix_arm_endianness.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Fix support for ARM endianness, otherwise it gives the error
-"unknown CPU endianness"
-
-Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
-
-diff -Nau guile-2.0.11.orig/module/system/base/target.scm guile-2.0.11/module/system/base/target.scm
---- guile-2.0.11.orig/module/system/base/target.scm	2013-02-28 09:42:45.000000000 +0100
-+++ guile-2.0.11/module/system/base/target.scm	2014-11-03 23:05:01.789338997 +0100
-@@ -70,7 +70,15 @@
-             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
-                            "mips" "mips64"))
-              (endianness big))
--            ((string-match "^arm.*el" cpu)
-+            ((string-match "^arm.*el" cpu)
-+             (endianness little))
-+            ((string-match "^arm.*eb" cpu)
-+             (endianness big))
-+            ((string-prefix? "arm" cpu)          ;ARMs are LE by default
-+             (endianness little))
-+            ((string-match "^aarch64.*be" cpu)
-+             (endianness big))
-+            ((string=? "aarch64" cpu)
-              (endianness little))
-             (else
-              (error "unknown CPU endianness" cpu)))))
diff --git a/package/guile/0003-Makefile.am-fix-build-without-makeinfo.patch b/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
similarity index 100%
rename from package/guile/0003-Makefile.am-fix-build-without-makeinfo.patch
rename to package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
diff --git a/package/guile/0004-module-system-base-target.scm-support-riscv32.patch b/package/guile/0003-module-system-base-target.scm-support-riscv32.patch
similarity index 100%
rename from package/guile/0004-module-system-base-target.scm-support-riscv32.patch
rename to package/guile/0003-module-system-base-target.scm-support-riscv32.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
