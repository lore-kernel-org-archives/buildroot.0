Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE86EED609
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 14:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8054A60AA1;
	Thu,  1 Jan 2026 14:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lr6ghoiIj2sK; Thu,  1 Jan 2026 14:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFFC560A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767276435;
	bh=jrSUq0tNdpiuP92Wjs+3Kd4T9FdwXI99tmjH2/sy+Ww=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rdBG5YeM8rfdWLmWcR6KbmZRrjd+Xn9K3sZ2Yh/7F0o+5h12sY/xHmbkcA/SJg5OW
	 6sBpHxnTW3/QjeceYIeeqqrxGNtcTrEp9VYPoAIP3RdqP3ea77rnfXnQPW3NfhEzTO
	 WzIoSbpI6cF5qQfL57oCv4jJo1F2Zp+p9vfPRQDMAt4SoHffUN//pUxGdQRx86f++W
	 vVPt5XdhRueQuZnkn7WOkG50bs8HMkL/fRi0w9WdkFMg3DRTGdN0uUepKVOB5pU1A9
	 NmHfn7DAArr9exFIOh71AQUq3qBDZ182L1209rRmK2Idz75rsbUCDrncIW5IqBOkF4
	 AgRbTdrqLAEfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFFC560A9B;
	Thu,  1 Jan 2026 14:07:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DAAF206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 14:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9004780F1D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 14:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQTmMK-HWDX4 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 14:07:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A02180F1C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A02180F1C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 14:07:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78F0E87DA2; Thu,  1 Jan 2026 14:07:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 14:53:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5d29e752a996c24f26b03d118e6f755e8eae5a7
X-Git-Newrev: f2992604a3267a1c5e12dfd1280199c388b9dd75
X-Patchwork-Hint: ignore
Message-Id: <20260101140711.78F0E87DA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk: fix patch subdirectories
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2992604a3267a1c5e12dfd1280199c388b9dd75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the wrong patch folders which should have been fixed
in commit 475c79d ("package/openjdk{-bin}: bump versions to 17.0.12+7
and 21.0.4+7")

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                  |  4 ++--
 ...01-Add-ARCv2-ISA-processors-support-to-Zero.patch | 18 +++++++++---------
 ...01-Add-ARCv2-ISA-processors-support-to-Zero.patch | 20 ++++++++++----------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 56e5451f57..4c0d99efc5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -741,8 +741,8 @@ package/olsr/0006-build-patch-for-gpsd-3-25.patch lib_patch.Upstream
 package/olsr/S50olsr Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch lib_patch.Upstream
 package/open2300/0001-fix-makefile.patch lib_patch.Upstream
-package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
-package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
+package/openjdk/17.0.12+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
+package/openjdk/21.0.4+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openldap/0001-fix-bignum.patch lib_patch.Upstream
 package/openldap/0002-disable-docs.patch lib_patch.Upstream
 package/openntpd/S49ntp Shellcheck lib_sysv.Variables
diff --git a/package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.12+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 87%
rename from package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.12+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
index afec2772c0..c4dda78fde 100644
--- a/package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
+++ b/package/openjdk/17.0.12+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -1,4 +1,4 @@
-From 9a3c2a0714420186ae8d5159d5416c6fa2009ad9 Mon Sep 17 00:00:00 2001
+From edf96f51d2c6d6e7a7762a879b916a5e58d8c23c Mon Sep 17 00:00:00 2001
 From: Alexey Brodkin <abrodkin@synopsys.com>
 Date: Mon, 18 Oct 2021 05:20:05 -0700
 Subject: [PATCH] Add ARCv2 ISA processors support to Zero
@@ -20,11 +20,11 @@ Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
  3 files changed, 23 insertions(+), 1 deletion(-)
 
 diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
-index 5120918aed2..f7a99955874 100644
+index 865feea36d9..30c224e4a99 100644
 --- a/make/autoconf/libraries.m4
 +++ b/make/autoconf/libraries.m4
-@@ -152,6 +152,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
-     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -latomic"
+@@ -146,6 +146,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
+     fi
    fi
  
 +  # Libatomic library
@@ -39,7 +39,7 @@ index 5120918aed2..f7a99955874 100644
    if test "x$OPENJDK_TARGET_OS" = xaix; then
      BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lperfstat"
 diff --git a/make/autoconf/platform.m4 b/make/autoconf/platform.m4
-index c0f2446dbd7..dc416ece885 100644
+index eb66266262b..3ca94b351b2 100644
 --- a/make/autoconf/platform.m4
 +++ b/make/autoconf/platform.m4
 @@ -54,6 +54,12 @@ AC_DEFUN([PLATFORM_EXTRACT_VARS_FROM_CPU],
@@ -65,7 +65,7 @@ index c0f2446dbd7..dc416ece885 100644
      HOTSPOT_$1_CPU_DEFINE=SPARC
    elif test "x$OPENJDK_$1_CPU" = xppc; then
 diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.cpp
-index b08caf4d5d3..2bf084895ba 100644
+index 63b7562f118..58b43241df4 100644
 --- a/src/hotspot/os/linux/os_linux.cpp
 +++ b/src/hotspot/os/linux/os_linux.cpp
 @@ -1721,6 +1721,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
@@ -99,11 +99,11 @@ index b08caf4d5d3..2bf084895ba 100644
    static  Elf32_Half running_arch_code=EM_LOONGARCH;
  #else
      #error Method os::dll_load requires that one of following is defined:\
--        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
-+        AARCH64, ALPHA, ARC, ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
+-        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, LOONGARCH64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
++        AARCH64, ALPHA, ARC, ARM, AMD64, IA32, IA64, LOONGARCH64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
  #endif
  
    // Identify compatibility class for VM's architecture and library's architecture
 -- 
-2.16.2
+2.43.0
 
diff --git a/package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/21.0.4+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 88%
rename from package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/21.0.4+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
index 6c46ec7b42..89ec2996d3 100644
--- a/package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
+++ b/package/openjdk/21.0.4+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -1,4 +1,4 @@
-From 9a3c2a0714420186ae8d5159d5416c6fa2009ad9 Mon Sep 17 00:00:00 2001
+From c990ac56c441682b65a3dc699a753e1d924b40d1 Mon Sep 17 00:00:00 2001
 From: Alexey Brodkin <abrodkin@synopsys.com>
 Date: Mon, 18 Oct 2021 05:20:05 -0700
 Subject: [PATCH] Add ARCv2 ISA processors support to Zero
@@ -20,10 +20,10 @@ Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
  3 files changed, 23 insertions(+), 1 deletion(-)
 
 diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
-index 5120918aed2..f7a99955874 100644
+index 51d4f724c33..41844933a14 100644
 --- a/make/autoconf/libraries.m4
 +++ b/make/autoconf/libraries.m4
-@@ -163,6 +163,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
+@@ -157,6 +157,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
      BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lrt"
    fi
  
@@ -39,7 +39,7 @@ index 5120918aed2..f7a99955874 100644
    if test "x$OPENJDK_TARGET_OS" = xaix; then
      BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lperfstat"
 diff --git a/make/autoconf/platform.m4 b/make/autoconf/platform.m4
-index c0f2446dbd7..dc416ece885 100644
+index df610cc489b..2e21572ba4d 100644
 --- a/make/autoconf/platform.m4
 +++ b/make/autoconf/platform.m4
 @@ -54,6 +54,12 @@ AC_DEFUN([PLATFORM_EXTRACT_VARS_FROM_CPU],
@@ -65,10 +65,10 @@ index c0f2446dbd7..dc416ece885 100644
      HOTSPOT_$1_CPU_DEFINE=SPARC
    elif test "x$OPENJDK_$1_CPU" = xppc; then
 diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.cpp
-index b08caf4d5d3..2bf084895ba 100644
+index 492300a37d4..3a10790f4a0 100644
 --- a/src/hotspot/os/linux/os_linux.cpp
 +++ b/src/hotspot/os/linux/os_linux.cpp
-@@ -1653,6 +1653,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1663,6 +1663,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
  #ifndef EM_AARCH64
    #define EM_AARCH64    183               /* ARM AARCH64 */
  #endif
@@ -78,7 +78,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #ifndef EM_RISCV
    #define EM_RISCV      243               /* RISC-V */
  #endif
-@@ -1677,6 +1680,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1687,6 +1690,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
      {EM_SH,          EM_SH,      ELFCLASS32, ELFDATA2MSB, (char*)"SuperH BE"},
  #endif
      {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
@@ -86,7 +86,7 @@ index b08caf4d5d3..2bf084895ba 100644
      // we only support 64 bit z architecture
      {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
      {EM_ALPHA,       EM_ALPHA,   ELFCLASS64, ELFDATA2LSB, (char*)"Alpha"},
-@@ -1709,6 +1713,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1719,6 +1723,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_PPC;
  #elif  (defined AARCH64)
    static  Elf32_Half running_arch_code=EM_AARCH64;
@@ -95,7 +95,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #elif  (defined ARM)
    static  Elf32_Half running_arch_code=EM_ARM;
  #elif  (defined S390)
-@@ -1731,7 +1737,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1741,7 +1747,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_LOONGARCH;
  #else
      #error Method os::dll_load requires that one of following is defined:\
@@ -105,5 +105,5 @@ index b08caf4d5d3..2bf084895ba 100644
  
    // Identify compatibility class for VM's architecture and library's architecture
 -- 
-2.16.2
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
