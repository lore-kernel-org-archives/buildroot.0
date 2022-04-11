Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A831C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 09:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D32904093B;
	Mon, 11 Apr 2022 09:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7Lqw9s-rqaq; Mon, 11 Apr 2022 09:47:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D024540915;
	Mon, 11 Apr 2022 09:46:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73C911BF44A
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 621C683F53
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vp58kaTkWo7i for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 09:46:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B36783F42
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 09:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1579883984; Mon, 11 Apr 2022 09:36:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 11:43:24 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 26564c4427e3d27cb31f751b3a1b5c7f58e5cbf0
X-Git-Newrev: 5f5d54f0cf7c0619923b853a2009d68c07fbe1cc
X-Patchwork-Hint: ignore
Message-Id: <20220411093637.1579883984@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/intel-gmmlib:
 needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f5d54f0cf7c0619923b853a2009d68c07fbe1cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

intel-gmmlib needs C++ since its addition in commit
93e4ee81a2e3e163bf74c24b6ec68f9446f96ae4 and
https://github.com/intel/gmmlib/commit/7a1ec78c0bc74939ba3ef61854f98eb4d7267cc3:

CMake Error at /nvmedata/autobuild/instance-15/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/clang++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/8cadfee0288a05676868e05d56243d866cbf051d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c0aaf9cc9e85f63ab4334db8c6deca25e6f8e878)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-gmmlib/Config.in      | 5 +++--
 package/intel-mediadriver/Config.in | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/intel-gmmlib/Config.in b/package/intel-gmmlib/Config.in
index 9d5fbd9cae..b6f93f7416 100644
--- a/package/intel-gmmlib/Config.in
+++ b/package/intel-gmmlib/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_INTEL_GMMLIB
 	bool "intel-gmmlib"
 	depends on BR2_x86_64
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  The Intel(R) Graphics Memory Management Library provides
 	  device specific and buffer management for the Intel(R)
@@ -10,5 +11,5 @@ config BR2_PACKAGE_INTEL_GMMLIB
 
 	  https://github.com/intel/gmmlib
 
-comment "intel-gmmlib needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "intel-gmmlib needs a toolchain w/ dynamic library, C++"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
index c29c2fb6ab..ad56590008 100644
--- a/package/intel-mediadriver/Config.in
+++ b/package/intel-mediadriver/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
 	bool "intel-mediadriver"
 	depends on BR2_x86_64
 	depends on !BR2_STATIC_LIBS # mesa3d, libva
-	depends on BR2_INSTALL_LIBSTDCPP # mesa3d
+	depends on BR2_INSTALL_LIBSTDCPP # intel-gmmlib, mesa3d
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
