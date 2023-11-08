Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54BCC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 12:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59ED0417DC;
	Wed,  8 Nov 2023 12:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59ED0417DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHr88TWUoZSW; Wed,  8 Nov 2023 12:28:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6046B41805;
	Wed,  8 Nov 2023 12:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6046B41805
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AE3C1BF97F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 12:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5B8481EFD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 12:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B8481EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V1jVkMxSeubM for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 12:28:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEE5881F18
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 12:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEE5881F18
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D334386CB9; Wed,  8 Nov 2023 12:28:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 13:27:31 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 6b2e2e737bdabc6fe9c8d6b51198ee785eef64af
X-Git-Newrev: d41ff469b5a9bdf136ba72dc631ee7a4ffab0b9a
X-Patchwork-Hint: ignore
Message-Id: <20231108122825.D334386CB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libgeos: needs
 gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=d41ff469b5a9bdf136ba72dc631ee7a4ffab0b9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

libgeos needs gcc >= 4.9 since bump to version 3.12.0 in commit
16727d4595dd1972a46e92bbd2260a896cc19b60 and
https://github.com/libgeos/geos/commit/289ed4efb26a9944f4385381e1574184b1e7448e:

In file included from /home/thomas/autobuild/instance-0/output-1/build/libgeos-3.12.0/src/algorithm/ConvexHull.cpp:30:0:
/home/thomas/autobuild/instance-0/output-1/build/libgeos-3.12.0/include/geos/util.h:38:12: error: 'std::make_unique' has not been declared
 using std::make_unique;
            ^

This dependency is propagated to libgeos only reverse dependency,
postgis.

Fixes:
 - http://autobuild.buildroot.org/results/56bb572fb1d56d45dbb950a73b9b888239fa6968

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f0d4bf1df5838c3aba678ca21d6ce2214f0466e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgeos/Config.in | 4 +++-
 package/postgis/Config.in | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 8411627d43..2a27c6f2a4 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBGEOS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
@@ -13,7 +14,8 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, threads not binutils bug 27597"
+comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 4.9, threads not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
+		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 405c5c723a..7d42390677 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_POSTGIS
 	bool "postgis"
 	depends on BR2_PACKAGE_POSTGRESQL_FULL
 	depends on BR2_INSTALL_LIBSTDCPP # libgeos, proj
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgeos
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgeos, proj
 	depends on BR2_USE_WCHAR # libgeos, proj
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
@@ -18,7 +18,7 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 27597"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.9, not binutils bug 27597"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
