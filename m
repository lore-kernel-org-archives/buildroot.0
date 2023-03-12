Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD85C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 19:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEEB460C11;
	Sun, 12 Mar 2023 19:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEEB460C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAA8Ios-McKL; Sun, 12 Mar 2023 19:09:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16BB160C2F;
	Sun, 12 Mar 2023 19:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16BB160C2F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14FF31BF41A
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 19:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0011415E3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 19:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0011415E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zxdDt7jiJft for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 19:09:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE222410C5
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 19:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE222410C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A838D86F8B; Sun, 12 Mar 2023 19:09:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 19:47:30 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: eccd359f9c475778489b1df5f02ddcc9d12bde04
X-Git-Newrev: 6f4a6c053a65f8afe88b1bb58e6c50792962a774
X-Patchwork-Hint: ignore
Message-Id: <20230312190900.A838D86F8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/intel-gmmlib:
 needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f4a6c053a65f8afe88b1bb58e6c50792962a774
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

threads are mandatory since version 19.1.1 and
https://github.com/intel/gmmlib/commit/9e4aa143fb7e7e87332fcb7c9871040ff4a1a1da
resulting in the following build failure since commit
cd206d9b808a322a00294b4caad203a892ed4c92:

CMake Error at /home/thomas/autobuild/instance-2/output-1/host/share/cmake-3.22/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
  Could NOT find Threads (missing: Threads_FOUND)

Fixes:
 - http://autobuild.buildroot.org/results/c1120932e8c212820b239ee8cd4a057623a73376

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b5d310772d71f547146684673c7113f208a31b5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-gmmlib/Config.in      | 6 ++++--
 package/intel-mediadriver/Config.in | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/intel-gmmlib/Config.in b/package/intel-gmmlib/Config.in
index b6f93f7416..a3d0d2610b 100644
--- a/package/intel-gmmlib/Config.in
+++ b/package/intel-gmmlib/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_INTEL_GMMLIB
 	depends on BR2_x86_64
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The Intel(R) Graphics Memory Management Library provides
 	  device specific and buffer management for the Intel(R)
@@ -11,5 +12,6 @@ config BR2_PACKAGE_INTEL_GMMLIB
 
 	  https://github.com/intel/gmmlib
 
-comment "intel-gmmlib needs a toolchain w/ dynamic library, C++"
-	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+comment "intel-gmmlib needs a toolchain w/ dynamic library, C++, threads"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
index ad56590008..537e4abd2f 100644
--- a/package/intel-mediadriver/Config.in
+++ b/package/intel-mediadriver/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
 	depends on !BR2_STATIC_LIBS # mesa3d, libva
 	depends on BR2_INSTALL_LIBSTDCPP # intel-gmmlib, mesa3d
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
+	depends on BR2_TOOLCHAIN_HAS_THREADS # intel-gmmlib, libva
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
 	select BR2_PACKAGE_INTEL_GMMLIB
 	select BR2_PACKAGE_LIBPCIACCESS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
