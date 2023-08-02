Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A39C001DF
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 19:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F41F41C36;
	Wed,  2 Aug 2023 19:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F41F41C36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVKjt5o1Gzdp; Wed,  2 Aug 2023 19:26:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F32C341D89;
	Wed,  2 Aug 2023 19:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F32C341D89
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CF311BF2F5
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 19:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51A3F80C00
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 19:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51A3F80C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnfZTPJkH-fu for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 19:25:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C377817AC
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 19:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C377817AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 792598412D; Wed,  2 Aug 2023 19:25:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 2 Aug 2023 21:18:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c26a44b5567a88ec471b7bcad150f5a6c33ae87b
X-Git-Newrev: 360a7cd738a85067ba60b029ca88eb7c874bfe4f
X-Patchwork-Hint: ignore
Message-Id: <20230802192543.792598412D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump linux-headers
 dependency to 4.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=360a7cd738a85067ba60b029ca88eb7c874bfe4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent update to systemd v254 requires a toolchain w/ linux headers
>= 4.14 to provide LOOP_SET_BLOCK_SIZE [1] (added in systemd v253 [2]).

Note:
Buildroot already warn the user if a toolchain w/ linux headers < 4.15
is used while enabling systemd as init system [3]. It was matter of
time before problem occurs.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=89e4fdecb51cf5535867026274bc97de9480ade5
[2] https://github.com/systemd/systemd/commit/1163ddb386ef46f63942171e6eab0ca64eb818e4
[3] 9a095643b4dd34eb7acb69662aa64fa945f4b542

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/Config.in | 7 +++----
 system/Config.in          | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 89ce62d1d2..859332d9e4 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # LOOP_SET_BLOCK_SIZE
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
@@ -237,7 +237,6 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
 	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # fscrypt_key
 	select BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
@@ -248,11 +247,11 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-homed.service.html
 
-comment "homed support needs a toolchain w/ threads, dynamic library, kernel headers >= 4.12"
+comment "homed support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	bool "enable hostname daemon"
diff --git a/system/Config.in b/system/Config.in
index 1ca7690ea3..24798dc068 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -124,19 +124,19 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and target gcc >= 5"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 4.14, host and target gcc >= 5"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
