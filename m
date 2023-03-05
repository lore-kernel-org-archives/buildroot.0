Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9F7C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 10:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24DEE60FAF;
	Sun,  5 Mar 2023 10:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24DEE60FAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 010mKCC_Qw-q; Sun,  5 Mar 2023 10:32:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F8B60FC7;
	Sun,  5 Mar 2023 10:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46F8B60FC7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9401BF35F
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 10:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5224A605A7
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 10:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5224A605A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_CQxXtrCkta for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 10:31:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F56D60BEB
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 10:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F56D60BEB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EF64861FF; Sun,  5 Mar 2023 10:31:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 11:21:13 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4bd484ee5df9868dad0e81618fb71ad60ed61f28
X-Git-Newrev: edfb71c6d50d77e00ed915ef525915cd26b961c3
X-Patchwork-Hint: ignore
Message-Id: <20230305103136.3EF64861FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/rockchip-mali:
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

commit: https://git.buildroot.net/buildroot/commit/?id=edfb71c6d50d77e00ed915ef525915cd26b961c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

rockchip-mali pre-built libraries needs C++ since the addition of the
package in commit 97c74a73e5dee17530647f89b2c7d8692781eb14:

readelf -a output/build/rockchip-mali-721653b5b3b525a4f80d15aa7e2f9df7b7e60427/lib/aarch64-linux-gnu/libmali-bifrost-g31-rxp0-gbm.so|grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [librt.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdrm.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]

While at it, add a comment when dependencies are not met

Fixes:
 - No autobuilder failures (yet), found when debugging an issue with
   rockchip-mali and glslsandbox-player

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5f1858e859833da272fce70bf445ca1b53ebffe1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rockchip-mali/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rockchip-mali/Config.in b/package/rockchip-mali/Config.in
index d616284911..5a23954af3 100644
--- a/package/rockchip-mali/Config.in
+++ b/package/rockchip-mali/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ROCKCHIP_MALI
 	bool "rockchip-mali"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_ARM_EABIHF || BR2_aarch64
 	# lidbrm. This would normally need a Config.in comment, but
@@ -30,3 +31,8 @@ config BR2_PACKAGE_PROVIDES_LIBGBM
 	default "rockchip-mali"
 
 endif
+
+comment "rockchip-mali needs a glibc toolchain w/ C++, threads"
+	depends on BR2_ARM_EABIHF || BR2_aarch64
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
