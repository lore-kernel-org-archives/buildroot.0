Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA7EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 12:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F5714099C;
	Sun, 19 Jun 2022 12:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F5714099C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Bd5lqf9j8XY; Sun, 19 Jun 2022 12:41:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07BA3409F9;
	Sun, 19 Jun 2022 12:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07BA3409F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FCCE1BF9A4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07442408B2
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07442408B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0nKVYzrnm_nA for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 12:41:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CE17405A8
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 12:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CE17405A8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4188387131; Sun, 19 Jun 2022 12:28:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 14:25:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e36d3a42ccbcc2757dece3edeed33ebef020894
X-Git-Newrev: 4c478bb0554e8cd8faf62fe2d3a6dc2e68fa7c7b
X-Patchwork-Hint: ignore
Message-Id: <20220619122848.4188387131@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libeastl: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c478bb0554e8cd8faf62fe2d3a6dc2e68fa7c7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libeastl needs threads since its addition in commit
ed9ddaafb2c4d3ac44e46390248f5c9af08076b1 and
https://github.com/electronicarts/EASTL/commit/800bc26659f834354e38ee3de4c7300e739ed255:

In file included from /home/autobuild/autobuild/instance-7/output-1/build/libeastl-45469730d641868ce05433fff2e199510c7d45c3/source/thread_support.cpp:7:
/home/autobuild/autobuild/instance-7/output-1/build/libeastl-45469730d641868ce05433fff2e199510c7d45c3/include/EASTL/internal/thread_support.h:37:18: fatal error: pthread.h: No such file or directory
   37 |         #include <pthread.h>
      |                  ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/54ff018467d157530bde4d35602fd1820d9eb348

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libeastl/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libeastl/Config.in b/package/libeastl/Config.in
index 5abea8f810..738b293be4 100644
--- a/package/libeastl/Config.in
+++ b/package/libeastl/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LIBEASTL
 	depends on BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  EASTL stands for Electronic Arts Standard Template
 	  Library. It is a C++ template library of containers,
@@ -21,6 +22,7 @@ config BR2_PACKAGE_LIBEASTL
 
 	  https://github.com/electronicarts/EASTL
 
-comment "libeastl needs a toolchain w/ C++, gcc >= 4.9"
+comment "libeastl needs a toolchain w/ C++, threads, gcc >= 4.9"
 	depends on BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
