Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81ADD4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B000840E8;
	Fri, 12 Dec 2025 07:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vbtf402zqEVF; Fri, 12 Dec 2025 07:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 389DC83D87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526268;
	bh=ox/kpiQHwaCiTdbOl/kpDVWG7hsZjckAn5Txor/tE70=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FNZKiYnopEjAbtejq4EesNnhu+5DpyOKUJybu4wZjzoc/v31ihzd7CSJU2ymjXpAN
	 LPT+JTOFfC3jw4mMcQ+UsOm8izdxQ9syFfeAlrbxCrbGZ/+gqUBA4dpe1AbVigqkQ6
	 yQ7tI43n8RZ1KsGWRAwyJXh5QaCiPFTjBMgcU2TDRonqImZ2tJpe1rfu5xkgjPFKM1
	 /vvErq2LU9j0eOFwxpQMibaaVod2ScxfsKHjglEKVczgEHHdcdra2sAhONhBz2rN5l
	 xA/f0lYz2mihet+0zXh4tKrCcPQtVvKoRAxPQx1efbTj+E6F2FvN2NHevtXPcdK6wy
	 yhrau0d5EOvtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 389DC83D87;
	Fri, 12 Dec 2025 07:57:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 142822C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DA2141164
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sn3s3Tu7769r for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF9D741150
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF9D741150
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CECAA85C4C; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Dec 2025 23:31:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2222ca745a42990a28eff437d36c7a333c88730
X-Git-Newrev: 95c385e2d6b92e7afa2d1fac84ecf2dabfb81d25
X-Patchwork-Hint: ignore
Message-Id: <20251212075536.CECAA85C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: bump version to 0.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=95c385e2d6b92e7afa2d1fac84ecf2dabfb81d25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes between v0.5.2 and v0.6.0:
https://git.linuxtv.org/libcamera.git/tag/?h=v0.6.0

Changes between v0.5.1 and v0.5.2:
https://git.linuxtv.org/libcamera.git/tag/?h=v0.5.2

libcamera commit [1] (included in v0.5.2) introduced a usage of the
clone3() system call, introduced Kernel 5.3 [2].

Therefore, this commit adds the dependency on 5.3 headers.

This commit also changes the toolchain used in the runtime test to
the bootlin one, which includes 5.15 linux headers.

[1] https://git.linuxtv.org/libcamera.git/commit/?id=b37e69d4348a0c3db80597dac19e801d19780d1c
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7f192e3cd316ba58c88dfa26796cf77789dd9872

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
[Julien:
 - squashed the libcamera bump and the runtime test fix commits
 - add clone3() comment in Config.in
 - add "header >= 5.3" in Config.in comment
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcamera/Config.in                     | 6 ++++--
 package/libcamera/libcamera.hash                | 2 +-
 package/libcamera/libcamera.mk                  | 2 +-
 support/testing/tests/package/test_libcamera.py | 1 +
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 92361bbade..15812a0e2f 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -12,6 +12,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3 # clone3()
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO if !BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
@@ -110,7 +111,8 @@ comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads
 
 endif # BR2_PACKAGE_LIBCAMERA
 
-comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
+comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8, headers >= 5.3"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index bbec9c517d..4e79be844e 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  ee2c7086b3c08133bba44856fb9b2ffd1132532150d14da7daecd99ab8a566c2  libcamera-v0.5.1-git4.tar.gz
+sha256  85d85409d6e04bcf2e1ed57d9b59ebcc9fb770e5d39690d7ac233e9784835b89  libcamera-v0.6.0-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index a2ff3284d7..e86e05328c 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.5.1
+LIBCAMERA_VERSION = v0.6.0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
diff --git a/support/testing/tests/package/test_libcamera.py b/support/testing/tests/package/test_libcamera.py
index 91df427b6f..c785e340d6 100644
--- a/support/testing/tests/package/test_libcamera.py
+++ b/support/testing/tests/package/test_libcamera.py
@@ -14,6 +14,7 @@ class TestLibCamera(infra.basetest.BRTest):
         f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
