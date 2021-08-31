Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B12C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 07:36:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5465960240
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 07:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5465960240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=go-sys.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06CCC401BB;
	Tue, 31 Aug 2021 07:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jbZN37dG3CWA; Tue, 31 Aug 2021 07:36:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 660D040209;
	Tue, 31 Aug 2021 07:36:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D9101BF348
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 07:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4988981D73
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 07:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWfR53cqqcXg for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 07:36:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay05.ispgateway.de (smtprelay05.ispgateway.de
 [80.67.18.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90B2081D72
 for <buildroot@busybox.net>; Tue, 31 Aug 2021 07:36:03 +0000 (UTC)
Received: from [84.191.225.2] (helo=exchange.go-sys.de)
 by smtprelay05.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>)
 id 1mKyHe-00021Z-Ff; Tue, 31 Aug 2021 09:34:14 +0200
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2106.2; Tue, 31
 Aug 2021 09:35:59 +0200
Received: from go-sys.de (192.168.1.112) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2106.2 via Frontend Transport;
 Tue, 31 Aug 2021 09:35:58 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Tue, 31 Aug 2021 09:35:55 +0200
Message-ID: <20210831073555.8157-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH 1/1] package/gcc: bump version 11.x to 11.2.0
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
Cc: Michael Fischer <mf@go-sys.de>, Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

patch 0001: already applied upstream

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 ...01-Remove-cyclades-from-libsanitizer.patch | 125 ------------------
 ...mcmodel-option-to-handle-large-GOTs.patch} |   0
 ...cmodel-large-when-building-crtstuff.patch} |   0
 package/gcc/Config.in.host                    |   2 +-
 package/gcc/gcc.hash                          |   4 +-
 5 files changed, 3 insertions(+), 128 deletions(-)
 delete mode 100644 package/gcc/11.1.0/0001-Remove-cyclades-from-libsanitizer.patch
 rename package/gcc/{11.1.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch => 11.2.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch} (100%)
 rename package/gcc/{11.1.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch => 11.2.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch} (100%)

diff --git a/package/gcc/11.1.0/0001-Remove-cyclades-from-libsanitizer.patch b/package/gcc/11.1.0/0001-Remove-cyclades-from-libsanitizer.patch
deleted file mode 100644
index ee6e349a6c..0000000000
--- a/package/gcc/11.1.0/0001-Remove-cyclades-from-libsanitizer.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 745dae5923aba02982563481d75a21595df22ff8 Mon Sep 17 00:00:00 2001
-From: Tamar Christina <tamar.christina@arm.com>
-Date: Fri, 21 May 2021 10:30:59 +0100
-Subject: [PATCH] libsanitizer: Remove cyclades from libsanitizer
-
-The Linux kernel has removed the interface to cyclades from
-the latest kernel headers[1] due to them being orphaned for the
-past 13 years.
-
-libsanitizer uses this header when compiling against glibc, but
-glibcs itself doesn't seem to have any references to cyclades.
-
-Further more it seems that the driver is broken in the kernel and
-the firmware doesn't seem to be available anymore.
-
-As such since this is breaking the build of libsanitizer (and so the
-GCC bootstrap[2]) I propose to remove this.
-
-[1] https://lkml.org/lkml/2021/3/2/153
-[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100379
-
-(cherry picked from commit f7c5351552387bd43f6ca3631016d7f0dfe0f135)
-
-libsanitizer/ChangeLog:
-
-	PR sanitizer/100379
-	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
-	llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
-	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
-	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
-
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
----
- .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
- .../sanitizer_platform_limits_posix.cpp               | 11 -----------
- .../sanitizer_platform_limits_posix.h                 | 10 ----------
- 3 files changed, 30 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-index 7f181258eab..b7da6598755 100644
---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-@@ -370,15 +370,6 @@ static void ioctl_table_fill() {
- 
- #if SANITIZER_GLIBC
-   // _(SIOCDEVPLIP, WRITE, struct_ifreq_sz); // the same as EQL_ENSLAVE
--  _(CYGETDEFTHRESH, WRITE, sizeof(int));
--  _(CYGETDEFTIMEOUT, WRITE, sizeof(int));
--  _(CYGETMON, WRITE, struct_cyclades_monitor_sz);
--  _(CYGETTHRESH, WRITE, sizeof(int));
--  _(CYGETTIMEOUT, WRITE, sizeof(int));
--  _(CYSETDEFTHRESH, NONE, 0);
--  _(CYSETDEFTIMEOUT, NONE, 0);
--  _(CYSETTHRESH, NONE, 0);
--  _(CYSETTIMEOUT, NONE, 0);
-   _(EQL_EMANCIPATE, WRITE, struct_ifreq_sz);
-   _(EQL_ENSLAVE, WRITE, struct_ifreq_sz);
-   _(EQL_GETMASTRCFG, WRITE, struct_ifreq_sz);
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-index 35a690cba5c..6e5c330b98e 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-@@ -143,7 +143,6 @@ typedef struct user_fpregs elf_fpregset_t;
- # include <sys/procfs.h>
- #endif
- #include <sys/user.h>
--#include <linux/cyclades.h>
- #include <linux/if_eql.h>
- #include <linux/if_plip.h>
- #include <linux/lp.h>
-@@ -460,7 +459,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
- 
- #if SANITIZER_GLIBC
-   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
--  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
- #if EV_VERSION > (0x010000)
-   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
- #else
-@@ -824,15 +822,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
- #endif // SANITIZER_LINUX
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
--  unsigned IOCTL_CYGETDEFTHRESH = CYGETDEFTHRESH;
--  unsigned IOCTL_CYGETDEFTIMEOUT = CYGETDEFTIMEOUT;
--  unsigned IOCTL_CYGETMON = CYGETMON;
--  unsigned IOCTL_CYGETTHRESH = CYGETTHRESH;
--  unsigned IOCTL_CYGETTIMEOUT = CYGETTIMEOUT;
--  unsigned IOCTL_CYSETDEFTHRESH = CYSETDEFTHRESH;
--  unsigned IOCTL_CYSETDEFTIMEOUT = CYSETDEFTIMEOUT;
--  unsigned IOCTL_CYSETTHRESH = CYSETTHRESH;
--  unsigned IOCTL_CYSETTIMEOUT = CYSETTIMEOUT;
-   unsigned IOCTL_EQL_EMANCIPATE = EQL_EMANCIPATE;
-   unsigned IOCTL_EQL_ENSLAVE = EQL_ENSLAVE;
-   unsigned IOCTL_EQL_GETMASTRCFG = EQL_GETMASTRCFG;
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-index ad358eef8b7..cba41ba5494 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-@@ -983,7 +983,6 @@ extern unsigned struct_vt_mode_sz;
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
- extern unsigned struct_ax25_parms_struct_sz;
--extern unsigned struct_cyclades_monitor_sz;
- extern unsigned struct_input_keymap_entry_sz;
- extern unsigned struct_ipx_config_data_sz;
- extern unsigned struct_kbdiacrs_sz;
-@@ -1328,15 +1327,6 @@ extern unsigned IOCTL_VT_WAITACTIVE;
- #endif  // SANITIZER_LINUX
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
--extern unsigned IOCTL_CYGETDEFTHRESH;
--extern unsigned IOCTL_CYGETDEFTIMEOUT;
--extern unsigned IOCTL_CYGETMON;
--extern unsigned IOCTL_CYGETTHRESH;
--extern unsigned IOCTL_CYGETTIMEOUT;
--extern unsigned IOCTL_CYSETDEFTHRESH;
--extern unsigned IOCTL_CYSETDEFTIMEOUT;
--extern unsigned IOCTL_CYSETTHRESH;
--extern unsigned IOCTL_CYSETTIMEOUT;
- extern unsigned IOCTL_EQL_EMANCIPATE;
- extern unsigned IOCTL_EQL_ENSLAVE;
- extern unsigned IOCTL_EQL_GETMASTRCFG;
--- 
-2.27.0
-
diff --git a/package/gcc/11.1.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch b/package/gcc/11.2.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
similarity index 100%
rename from package/gcc/11.1.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
rename to package/gcc/11.2.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
diff --git a/package/gcc/11.1.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch b/package/gcc/11.2.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
similarity index 100%
rename from package/gcc/11.1.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
rename to package/gcc/11.2.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index ae2051d2aa..2b7f88154e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -92,7 +92,7 @@ config BR2_GCC_VERSION
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "9.4.0"     if BR2_GCC_VERSION_9_X
 	default "10.3.0"    if BR2_GCC_VERSION_10_X
-	default "11.1.0"    if BR2_GCC_VERSION_11_X
+	default "11.2.0"    if BR2_GCC_VERSION_11_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 0f7ff9dbf7..b37307ebe3 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
 sha512  dfd3500bf21784b8351a522d53463cf362ede66b0bc302edf350bb44e94418497a8b4b797b6af8ca9b2eeb746b3b115d9c3698381b989546e9151b4496415624  gcc-9.4.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-10.3.0/sha512.sum
 sha512  2b2dd7453d48a398c29eaebd1422b70341001b8c90a62aee51e83344e7fdd8a8e45f82a4a9165bd7edc76dada912c932f4b6632c5636760fec4c5d7e402b3f86  gcc-10.3.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-11.1.0/sha512.sum
-sha512  fd6bba0f67ff48069d03073d1a9b5e896383b1cfc9dde008e868e60a9ec5014a837d56af0ecbf467b3fb9b37ec74a676e819a18b44393a0a3c4280175b5d7ad8  gcc-11.1.0.tar.xz
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-11.2.0/sha512.sum
+sha512  d53a0a966230895c54f01aea38696f818817b505f1e2bfa65e508753fcd01b2aedb4a61434f41f3a2ddbbd9f41384b96153c684ded3f0fa97c82758d9de5c7cf  gcc-11.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
