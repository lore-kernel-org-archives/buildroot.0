Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657C7C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1913D40273;
	Sat,  4 Nov 2023 20:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1913D40273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZQLcwf-45XB; Sat,  4 Nov 2023 20:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3FB340364;
	Sat,  4 Nov 2023 20:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3FB340364
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 073851BF20B
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2554418BA
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2554418BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8GS7hVmeeUr for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:25:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACDCA4185E
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACDCA4185E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AEE68670B; Sat,  4 Nov 2023 20:25:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 21:23:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 519374f0d28abc76b7d77964528fbdd9a04c587e
X-Git-Newrev: 61848605cd26d29f54c16de862aedba7cf334be4
X-Patchwork-Hint: ignore
Message-Id: <20231104202557.9AEE68670B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltris: bump to version 1.2.7
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
Content-Type: multipart/mixed; boundary="===============7491148177695235358=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7491148177695235358==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=61848605cd26d29f54c16de862aedba7cf334be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to the latest release, remove fix that was merged upstream.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                             |  1 -
 package/ltris/0001-fix-build-with-gcc-4.8.patch | 20 --------------------
 package/ltris/ltris.hash                        |  2 +-
 package/ltris/ltris.mk                          |  2 +-
 4 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9417bdb542..9db01a5fde 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -813,7 +813,6 @@ package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch Upstre
 package/ltrace/0001-arm-plt.patch Upstream
 package/ltrace/0002-sparc-add-missing-library.h-include.patch Upstream
 package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch Upstream
-package/ltris/0001-fix-build-with-gcc-4.8.patch Upstream
 package/lttng-babeltrace/0001-tests-lib-Makefile.am-remove-unneeded-static-flag.patch Upstream
 package/lttng-babeltrace/0002-configure.ac-fix-popt-static-build.patch Upstream
 package/lttng-libust/0001-configure.ac-add-disable-tests.patch Upstream
diff --git a/package/ltris/0001-fix-build-with-gcc-4.8.patch b/package/ltris/0001-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index d6bbf6a946..0000000000
--- a/package/ltris/0001-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix build with gcc 4.8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://sourceforge.net/p/lgames/patches/28]
-Index: ltris/src/bowl.c
-===================================================================
---- ltris/src/bowl.c	(révision 421)
-+++ ltris/src/bowl.c	(copie de travail)
-@@ -828,9 +828,10 @@
- */
- void bowl_init_block_masks() 
- {
-+	int i;
- 	int masksize = sizeof(block_masks[0].mask); // same for all
- 
--	for (int i = 0; i < 7; i++) {
-+	for (i = 0; i < 7; i++) {
- 		block_masks[i].rx = 2;
- 		block_masks[i].ry = 2;
- 		memset(block_masks[i].mask, 0, masksize );
diff --git a/package/ltris/ltris.hash b/package/ltris/ltris.hash
index f696e3af17..abe6853d9b 100644
--- a/package/ltris/ltris.hash
+++ b/package/ltris/ltris.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a7bc6c5fc6539b88505077a1b4580edc9b179ce0a6b829c58fbd9416cf456195  ltris-1.2.tar.gz
+sha256  1291c6a642d06b9ee153ac0a2e7855a2c983e839c618f1a294df04d829525cb0  ltris-1.2.7.tar.gz
 sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index 9b59613417..98902de44c 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTRIS_SITE = http://downloads.sourceforge.net/lgames/ltris
-LTRIS_VERSION = 1.2
+LTRIS_VERSION = 1.2.7
 LTRIS_LICENSE = GPL-2.0+
 LTRIS_LICENSE_FILES = COPYING
 

--===============7491148177695235358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7491148177695235358==--
