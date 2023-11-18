Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E02CC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 21:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC5D760E8D;
	Sat, 18 Nov 2023 21:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC5D760E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJWD93c6FIuh; Sat, 18 Nov 2023 21:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE6C60E78;
	Sat, 18 Nov 2023 21:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE6C60E78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 451841BF836
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 21:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19AED60E77
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 21:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19AED60E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bvkj6TCXhQ-N for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 21:46:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBBD360E6B
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 21:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBBD360E6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC98287302; Sat, 18 Nov 2023 21:46:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 22:43:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6d0f73a2eaa4904ee0842a01941b01306d97be6
X-Git-Newrev: dfe68fc8d5da75516d728d0977ce9265c2f79838
X-Patchwork-Hint: ignore
Message-Id: <20231118214650.CC98287302@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: downgrade GCC version
 requirements to 10
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfe68fc8d5da75516d728d0977ce9265c2f79838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NodeJS requires GCC 10.1. However, GCC 10.1 is the first release of the
GCC 10.x series. As such, we can safely downgrade the GCC version
requirements to 10.

Tested with: run-tests tests.package.test_nodejs using Debian 11 and
gcc 10.2.1.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nodejs/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 72770095d0..50d1360715 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -7,19 +7,19 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 11, wchar, host gcc >= 11"
+comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 10, wchar, host gcc >= 10"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_11 || !BR2_TOOLCHAIN_GCC_AT_LEAST_11 || !BR2_USE_WCHAR
+		!BR2_HOST_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_11
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	depends on BR2_HOST_GCC_AT_LEAST_10
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
