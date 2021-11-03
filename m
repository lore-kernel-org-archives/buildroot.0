Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E498C433FE
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:46:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5E760F58
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD5E760F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92D79403EE;
	Wed,  3 Nov 2021 17:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kt_iIj_bEWox; Wed,  3 Nov 2021 17:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E90E2404BD;
	Wed,  3 Nov 2021 17:46:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69B861BF85D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 669D7403ED
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3m7Xj2z-LAM for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:46:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A088740282
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:46:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 53A5A8A2D5; Wed,  3 Nov 2021 17:42:36 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 18:46:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e3c73bcaf407804aacdf7f9c422559c80447186
X-Git-Newrev: f032973fc56ba4a73d95927384d2a5d185f2ddce
X-Patchwork-Hint: ignore
Message-Id: <20211103174236.53A5A8A2D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdbi-drivers: bump to commit
 b0c7ac0ef2e7
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

commit: https://git.buildroot.net/buildroot/commit/?id=f032973fc56ba4a73d95927384d2a5d185f2ddce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package has a buildroot local patch
0001-build-Use-MYSQL_CONFIG-variable-instead-of-mysql_con.patch

This patch was submitted and applied upstream.
https://sourceforge.net/p/libdbi-drivers/mailman/message/37370618/

Bumping to this commit allows to discard the no more needed
buildroot local patch.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...YSQL_CONFIG-variable-instead-of-mysql_con.patch | 47 ----------------------
 package/libdbi-drivers/libdbi-drivers.hash         |  2 +-
 package/libdbi-drivers/libdbi-drivers.mk           |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/package/libdbi-drivers/0001-build-Use-MYSQL_CONFIG-variable-instead-of-mysql_con.patch b/package/libdbi-drivers/0001-build-Use-MYSQL_CONFIG-variable-instead-of-mysql_con.patch
deleted file mode 100644
index 66e99c430f..0000000000
--- a/package/libdbi-drivers/0001-build-Use-MYSQL_CONFIG-variable-instead-of-mysql_con.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From bc966656d8598a6d87c901a67ecdb91c436f4939 Mon Sep 17 00:00:00 2001
-From: Herve Codina <herve.codina@bootlin.com>
-Date: Wed, 29 Sep 2021 15:08:33 +0200
-Subject: [PATCH] build: Use MYSQL_CONFIG variable instead of
- 'mysql_config'
-
-The MYSQL_CONFIG variable is used to check 'mysql_config' prog.
-This variable can be override by the user but was not used for
-retrieving MYSQL_INCLUDE, MYSQL_LIBS, ...
-
-This commit replaces the hardcoded usage of 'mysql_config' by
-the use of MYSQL_CONFIG variable.
-
-This lead to 'MYSQL_CONFIG=/some/where/mysql_config ./configure'
-command to work properly.
-
-Signed-off-by: Herve Codina <herve.codina@bootlin.com>
----
- acinclude.m4 | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index e99318f..9dd2b0f 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -116,15 +116,15 @@ if test "$ac_mysql" = "yes"; then
- 	fi
- 
- 	if test "$ac_mysql_incdir" = "no"; then
--		MYSQL_INCLUDE=`mysql_config --include`
-+		MYSQL_INCLUDE=`$MYSQL_CONFIG --include`
- 	else
- 		MYSQL_INCLUDE=-I$ac_mysql_incdir
- 	fi
- 	if test "$ac_mysql_libdir" = "no"; then
- 	   	if test "$ac_mysql_threadsafe" = "YES"; then
--			MYSQL_LIBS=`mysql_config --libs_r`
-+			MYSQL_LIBS=`$MYSQL_CONFIG --libs_r`
- 		else
--			MYSQL_LIBS=`mysql_config --libs`
-+			MYSQL_LIBS=`$MYSQL_CONFIG --libs`
- 		fi
- 	else
- 	   	if test "$ac_mysql_threadsafe" = "YES"; then
--- 
-2.31.1
-
diff --git a/package/libdbi-drivers/libdbi-drivers.hash b/package/libdbi-drivers/libdbi-drivers.hash
index f6110c2a11..38d66f90d1 100644
--- a/package/libdbi-drivers/libdbi-drivers.hash
+++ b/package/libdbi-drivers/libdbi-drivers.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0237c8006cefd6873f0b43d9676b14d5674270adf5e7501cd0e3423ff5b41549  libdbi-drivers-7a8e24ec1cf763226f4be31ba1018d888d4989f3-br1.tar.gz
+sha256  564438dda6af59af8c66cda9fa378ce86b1393fd31a7b0f1ba98af641a34a428  libdbi-drivers-b0c7ac0ef2e733e858c9870139944eeaf7b66984-br1.tar.gz
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libdbi-drivers/libdbi-drivers.mk b/package/libdbi-drivers/libdbi-drivers.mk
index 78d1c61515..d86f32dafc 100644
--- a/package/libdbi-drivers/libdbi-drivers.mk
+++ b/package/libdbi-drivers/libdbi-drivers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDBI_DRIVERS_VERSION = 7a8e24ec1cf763226f4be31ba1018d888d4989f3
+LIBDBI_DRIVERS_VERSION = b0c7ac0ef2e733e858c9870139944eeaf7b66984
 LIBDBI_DRIVERS_SITE = https://git.code.sf.net/p/libdbi-drivers/libdbi-drivers
 LIBDBI_DRIVERS_SITE_METHOD = git
 LIBDBI_DRIVERS_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
