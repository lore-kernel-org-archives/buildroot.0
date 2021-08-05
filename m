Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C254C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:09:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D48BB610CC
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D48BB610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE06F60ADA;
	Thu,  5 Aug 2021 11:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCPGYrsnKCg0; Thu,  5 Aug 2021 11:09:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D14A960ACC;
	Thu,  5 Aug 2021 11:08:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9FD01BF844
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0432160609
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oey4XCHXF6bb for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2392F60A59
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B07408B75E; Thu,  5 Aug 2021 11:07:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 13:05:51 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 30e038f22e4ad18102ed779af103a72c5734286d
X-Git-Newrev: bbc8e3578436a7d8e75fa5ed774ae03458311941
X-Patchwork-Hint: ignore
Message-Id: <20210805110700.B07408B75E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/mariadb: bump
 version to 10.3.30
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=bbc8e3578436a7d8e75fa5ed774ae03458311941
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

- rebase 001-add-extra-check-for-librt.patch
- for changelog see [1], [2]

Fixes:

  CMake Error at libmariadb/cmake/ConnectorName.cmake:30 (ENDMACRO):
    Flow control statements are not properly nested.
  Call Stack (most recent call first):
    libmariadb/CMakeLists.txt:423 (INCLUDE)

[1] https://mariadb.com/kb/en/mariadb-10329-changelog/
[2] https://mariadb.com/kb/en/mariadb-10330-changelog/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3dae174e7eb98191610df7a5a7e5a9bd6ca03d66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/0001-add-extra-check-for-librt.patch | 12 +++++++-----
 package/mariadb/mariadb.hash                         |  6 +++---
 package/mariadb/mariadb.mk                           |  2 +-
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/mariadb/0001-add-extra-check-for-librt.patch b/package/mariadb/0001-add-extra-check-for-librt.patch
index 90aa626a0b..0dd4c546fb 100644
--- a/package/mariadb/0001-add-extra-check-for-librt.patch
+++ b/package/mariadb/0001-add-extra-check-for-librt.patch
@@ -1,4 +1,4 @@
-From e6244400dfd3547531a3a3289fadbbe19873f096 Mon Sep 17 00:00:00 2001
+From 960c74ec60962f707bd41724edaa2640c0324400 Mon Sep 17 00:00:00 2001
 From: Ryan Coe <bluemrp9@gmail.com>
 Date: Thu, 27 Oct 2016 20:33:21 -0700
 Subject: [PATCH] add extra check for librt
@@ -6,24 +6,26 @@ Subject: [PATCH] add extra check for librt
 https://jira.mariadb.org/browse/MDEV-10841
 
 Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
+[Rebased on mariadb-10.3.30]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  configure.cmake | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/configure.cmake b/configure.cmake
-index 896226de954f4642a238ca6a72e0930590dc1681..77ca485fb05e6b63bb69f9561b4eabfaa208a419 100644
+index 1b85c31b..4a1cd847 100644
 --- a/configure.cmake
 +++ b/configure.cmake
-@@ -126,6 +126,9 @@ IF(UNIX)
+@@ -134,6 +134,9 @@ IF(UNIX)
    IF(NOT LIBRT)
      MY_SEARCH_LIBS(clock_gettime rt LIBRT)
    ENDIF()
 +  IF(NOT LIBRT)
 +    MY_SEARCH_LIBS(posix_spawn_file_actions_addclose rt LIBRT)
 +  ENDIF()
+   set(THREADS_PREFER_PTHREAD_FLAG ON)
    FIND_PACKAGE(Threads)
  
-   SET(CMAKE_REQUIRED_LIBRARIES 
 -- 
-2.9.3
+2.32.0
 
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 26faf529c2..4025be317f 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,6 +1,6 @@
-# From https://downloads.mariadb.org/mariadb/10.3.28
-sha256  e8c912cae2e5800d0da364cc23437907ed4be767f2cbdf198cf3afc03db6a6a3  mariadb-10.3.28.tar.gz
-sha512  f6941bcc818f9b3640e4b5fdbdd3a32b45c62c04087e583f1f0e1c0258b09a21c7639abd1c902e183c057838308ad5eedc00ffee76d44a02043e8e349015fb20  mariadb-10.3.28.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.30
+sha256  bd8735c65bdb7ebcd5d779fb9d3de3f2fcd319ad6482278d73dfe7301ad4ae1b  mariadb-10.3.30.tar.gz
+sha512  742c30b3ebc0b6d36b98d4e7a7fb511098142e72d8f42cbfa73a0bdea2059be17e790fbda4732329bbd99e4b50b13cf18e8122964a473e0b62170ab869eca8fc  mariadb-10.3.30.tar.gz
 
 # Hash for license files
 sha256  a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 56d6afab17..ade73ccfe0 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.28
+MARIADB_VERSION = 10.3.30
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
