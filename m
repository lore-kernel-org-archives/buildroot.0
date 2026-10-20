Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3530606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hiLt0rzc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 842E480F3C;
	Tue, 20 Oct 2026 19:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYXzOZj7PkKH; Tue, 20 Oct 2026 19:58:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 126F981090
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792526299;
	b=GKbLCMKUw2aPnMEfeeqW1CNZw+3NIfbj6ZyUEn2cbtxK2y8efZGNKIENanmWHdtLPUNb
	 u0o3JdCq+/CNzS7RQxDg1gsgV+WbsvKtCo8yz9w73zmnokGdUvQJ/Old0mat4a5eY/c71
	 pkG4J0EXguVJfxEHA/jgO9YtiN4myWcvtPPnQp8eVxboI8jbrGDozROhR6q8YeFquOWRR
	 F+M8d/6yeZXTK81Bo5QZQZBkw/wIlZzZKiFn1A2Tui1py9diuHv0LngTaCvLNX7nzsJ9c
	 xFOl6QTgzmfs85NVJqG/czfhlgwy8P9GDLeYN6Rer0HwBipKJhAQaPLke5Gj5rmCmTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792526299;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YMcM/Kbowus2n4AWY7AESIAK3y+Ftu+7opzI0mWCHVs=;
	b=UZbbq1XUC/EDd8Q0BN/w0n5uTw/rd2mVRRFYXvfeDB+qZfmpWLNUIC9hTaGe2N3FJ07y
	 29j20Sa4wzF9zKpvil2co37j9HCR0YZgqqiydnOOUyDornEqhYJYd4S/pTxDQpNgzK+o3
	 +KA5J8sRvCI8FBz1FIUY8FmvE6LLUthhOt9U+lkV88zwku6jeK8sv1ihuy76LtwllAWEX
	 OVzKDVHzLC3HM9INLq7OFGfobS+HecJWICsYJNzEYk66QFfli44v3DBu/eb5Xmj8erh3k
	 Oytm4PBonUtjIKVZe88GlUAgSYTqX0IVpkEul7mF5GnoC85gQq/lTh9Pv8Ed3LAngqw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792526299;
	bh=YMcM/Kbowus2n4AWY7AESIAK3y+Ftu+7opzI0mWCHVs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hiLt0rzcdlxBTp+HbkZ6RLzL1pPb7OutQCP1fnTi33SN3PKMjynFuwzGqGUpqbnTg
	 OYuIrWHUhVwSUwtBnWeLkkxH5nM61CU9w56qTwuSYVjInVYbG8KsQm4cHCCoV1SRSy
	 54q/jnCG1mQSeYNgiol1HZtxFtKaIayxbMGLY3dkiCgAIxyu/B+qsrPuy9ssXK8lVw
	 AlMUclvN1V5rl7G7yY4NLc6NZ/incDYkccyNlAObX2cyRuNVx+WbTdGyQzU0O+064g
	 NTqbIttjRSvIyAW0tz2W7pr7L+4aP7xuV2frlWLF8zxEEaqBL9zGVzYPYk7t6+J9ah
	 SNhLVtlqiL/4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 126F981090;
	Tue, 20 Oct 2026 19:58:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA2AA3A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BB4C405F0
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BN3we_IxWnXt for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 19:58:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 78436407C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792526296;
 b=VvWowZfqarLBHS17WS3J0sGUDgvfrhSook6k75vOSaqTunWUWKTLsQt/8vFkwnE/CX2T
 L9/Z/o+Ot30oBYFnI6Hl5HH+7zvMfuySD2kEMwf3msQXPZIUA+J8P39CcY1DCpZelXoVV
 GseYgthYbAjWkl5l/IeV3uH2egzXCqdGyDM+enRTticahValfVPZLtckRQWwrdTzM+ljm
 DsSt1PyrkwgazzpF16U0F19pQLsFyWMwLslK5iEc28KEKX5M0RYDoykH52I2EIUbohFEh
 rOcERgNciQ8Tsm9cI1qqPHs+WHPUmDk3Yp5PNC6S2Lhu+NiV2Pe5OciL0sb3ci3T4YQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792526296;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=DEZ0dpuai28J3aNzHjFDb0a/jtJsJBSwRDXIoPiK/2E=;
 b=UBzmvM0PRu+KXNurdGE+7tHxWWszqc9LtFqVZ8ZitjVMYu9L22Bnxv4t9aheK9x5i6um
 oovujm8g3L1eVhSTzhYQOe4LkSOeU6s9K8hV06LxPOQaem6xCoo8sKZE8p2UFQbEQuMr6
 R3HhLiAHO1NxEfG0rQtzH7FtzDLCr9/CGFyOzueHk/eE0quEv3kBKdSf8lcu8KZpValOG
 Adr0iCyrJJPMkfu/rhrkFl6ypa8MIVKvWWdhcnJe1Py01CVDk3RO2uCnviX7g+YNzpd8K
 vxetAjUnVanAXDWTjXRn/7aJQSzJ/ZMs6kwKH5t70ptgSbjvG3QfgZ1WIrvEIgLCSYA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tZN1tDxp; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78436407C4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:58:14 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8BE3E61F00;
 Tue, 20 Oct 2026 21:58:08 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 20 Oct 2026 21:57:58 +0200
Message-ID: <20261020195759.1091151-1-ju.o@free.fr>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] boot/grub2: bump to version 2.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For release notes, see [1] and [2].

The grub2 project moved to gitlab. See [3] and [4].
This commit updates GRUB2_SITE accordingly.

The commit removes the package patches which are included in this
release, and also adds an upstream patch to fix an issue on arm64
platform.

Tested by compiling and booting the defconfigs using grub2:

    qemu_aarch64_sbsa_defconfig
    qemu_arm_ebbr_defconfig
    qemu_loongarch64_virt_efi_defconfig
    qemu_riscv64_virt_efi_defconfig
    qemu_x86_64_efi_defconfig
    pc_x86_64_bios_defconfig
    pc_x86_64_efi_defconfig

and running the runtime tests with:

    support/testing/run-tests \
        -d dl -o output_folder \
            tests.boot.test_grub \
            tests.fs.test_iso9660

[1] https://gitlab.freedesktop.org/gnu-grub/grub/-/releases/grub-2.16
[2] https://gitlab.freedesktop.org/gnu-grub/grub/-/blob/grub-2.16/NEWS
[3] https://gitlab.freedesktop.org/gnu-grub/grub/-/commit/754a3d867d015ffc242a7bb67fd6b88624667af9
[4] https://lists.gnu.org/archive/html/grub-devel/2026-03/msg00036.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- No change.

Note: runtime tests using i386 CPU are failing due to unrelated
reasons (illegal instruction in libc form /sbin/init). Without
this bump, those tests are failing the same way. Since the
failure happens in user space, it means the boot still work with
this bump.
---
 ...it-memory-allocations-to-4GB-boundar.patch | 34 +++++++++
 ...-Check-linker-for-image-base-support.patch | 75 -------------------
 ...-Print-a-more-helpful-error-if-autoc.patch | 36 ---------
 boot/grub2/grub2.hash                         |  4 +-
 boot/grub2/grub2.mk                           |  4 +-
 5 files changed, 38 insertions(+), 115 deletions(-)
 create mode 100644 boot/grub2/0001-Revert-arm64-Limit-memory-allocations-to-4GB-boundar.patch
 delete mode 100644 boot/grub2/0001-Revert-configure-Check-linker-for-image-base-support.patch
 delete mode 100644 boot/grub2/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch

diff --git a/boot/grub2/0001-Revert-arm64-Limit-memory-allocations-to-4GB-boundar.patch b/boot/grub2/0001-Revert-arm64-Limit-memory-allocations-to-4GB-boundar.patch
new file mode 100644
index 0000000000..ec83b2fa79
--- /dev/null
+++ b/boot/grub2/0001-Revert-arm64-Limit-memory-allocations-to-4GB-boundar.patch
@@ -0,0 +1,34 @@
+From ec277f1056227689c8875d1c73602b47bfe72633 Mon Sep 17 00:00:00 2001
+From: Neal Gompa <neal@gompa.dev>
+Date: Mon, 28 Sep 2026 18:12:45 -0400
+Subject: [PATCH] Revert "arm64: Limit memory allocations to 4GB boundary"
+
+This causes failed memory allocations on some ARM-based platforms,
+notably Apple Silicon Macs.
+
+This reverts commit 1cae861314f43540cde773fab8b6ed769dc5f106.
+
+Reviewed-by: Leo Sandoval <lsandova@redhat.com>
+Signed-off-by: Neal Gompa <neal@gompa.dev>
+Part-of: <https://gitlab.freedesktop.org/gnu-grub/grub/-/merge_requests/274>
+Upstream: https://gitlab.freedesktop.org/gnu-grub/grub/-/commit/711110daccaf15df695b270d13f76b5bc84a64dd
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ include/grub/arm64/efi/memory.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/grub/arm64/efi/memory.h b/include/grub/arm64/efi/memory.h
+index 2c64918e3..c6cb32417 100644
+--- a/include/grub/arm64/efi/memory.h
++++ b/include/grub/arm64/efi/memory.h
+@@ -1,6 +1,6 @@
+ #ifndef GRUB_MEMORY_CPU_HEADER
+ #include <grub/efi/memory.h>
+ 
+-#define GRUB_EFI_MAX_USABLE_ADDRESS 0xffffffff
++#define GRUB_EFI_MAX_USABLE_ADDRESS 0xffffffffffffULL
+ 
+ #endif /* ! GRUB_MEMORY_CPU_HEADER */
+-- 
+2.56.0
+
diff --git a/boot/grub2/0001-Revert-configure-Check-linker-for-image-base-support.patch b/boot/grub2/0001-Revert-configure-Check-linker-for-image-base-support.patch
deleted file mode 100644
index edfaea2de8..0000000000
--- a/boot/grub2/0001-Revert-configure-Check-linker-for-image-base-support.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 3a9d2dd2f5fb07b75a74c307d61b9b9fc5d20a62 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Fri, 27 Feb 2026 11:46:54 +0800
-Subject: [PATCH] Revert "configure: Check linker for --image-base support"
-
-This reverts commit 1a5417f39a0ccefcdd5440f2a67f84d2d2e26960.
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-Upstream: temporary revert, until upstream fixes the issue, see
-discussion at
-https://lists.gnu.org/archive/html/grub-devel/2026-02/msg00039.html
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- acinclude.m4 |  5 -----
- configure.ac | 14 ++------------
- 2 files changed, 2 insertions(+), 17 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 70c1912f8..fa7840f09 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -79,11 +79,6 @@ AC_DEFUN([grub_PROG_OBJCOPY_ABSOLUTE],
- [AC_MSG_CHECKING([whether ${TARGET_OBJCOPY} works for absolute addresses])
- AC_CACHE_VAL(grub_cv_prog_objcopy_absolute,
- [cat > conftest.c <<\EOF
--asm (
--    ".globl start, _start, __start\n"
--    ".ifdef cmain; .set start = _start = __start = cmain\n.endif\n"
--    ".ifdef _cmain; .set start = _start = __start = _cmain\n.endif\n"
--);
- void cmain (void);
- void
- cmain (void)
-diff --git a/configure.ac b/configure.ac
-index d8ca1b7c1..041cfbab4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1461,6 +1461,7 @@ elif test x$grub_cv_target_cc_link_format = x-mi386pe || test x$grub_cv_target_c
-   TARGET_IMG_LDSCRIPT='$(top_srcdir)'"/conf/i386-cygwin-img-ld.sc"
-   TARGET_IMG_LDFLAGS="-Wl,-T${TARGET_IMG_LDSCRIPT}"
-   TARGET_IMG_LDFLAGS_AC="-Wl,-T${srcdir}/conf/i386-cygwin-img-ld.sc"
-+  TARGET_IMG_BASE_LDOPT="-Wl,-Ttext"
-   TARGET_IMG_CFLAGS=
- else
-   TARGET_APPLE_LINKER=0
-@@ -1468,6 +1469,7 @@ else
-   TARGET_IMG_LDSCRIPT=
-   TARGET_IMG_LDFLAGS='-Wl,-N'
-   TARGET_IMG_LDFLAGS_AC='-Wl,-N'
-+  TARGET_IMG_BASE_LDOPT="-Wl,-Ttext"
-   TARGET_IMG_CFLAGS=
- fi
- 
-@@ -1798,18 +1800,6 @@ grub_PROG_TARGET_CC
- m4_ifndef([AX_CHECK_LINK_FLAG], [m4_fatal([autoconf-archive is missing. You must install it to generate the configure script.])])
- 
- if test "x$TARGET_APPLE_LINKER" != x1 ; then
--AX_CHECK_LINK_FLAG([-Wl,--image-base,0x400000],
--    [TARGET_IMG_BASE_LDOPT="-Wl,--image-base"],
--    [TARGET_IMG_BASE_LDOPT="-Wl,-Ttext"],
--    [],
--    [AC_LANG_SOURCE([
--asm (".globl start; start:");
--asm (".globl _start; _start:");
--asm (".globl __start; __start:");
--void __main (void);
--void __main (void) {}
--int main (void);
--    ])])
- grub_PROG_OBJCOPY_ABSOLUTE
- fi
- grub_PROG_LD_BUILD_ID_NONE
--- 
-2.43.0
-
diff --git a/boot/grub2/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch b/boot/grub2/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch
deleted file mode 100644
index 8e38bb9d3f..0000000000
--- a/boot/grub2/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d0f516385dc73e8dd92b78ce08c1df100434fe67 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Fri, 27 Feb 2026 13:58:44 +0800
-Subject: [PATCH] Revert "configure: Print a more helpful error if
- autoconf-archive is not installed"
-
-This reverts commit ac042f3f58d33ce9cd5ff61750f06da1a1d7b0eb.
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-Upstream: temporary revert, until upstream fixes the issue, see
-discussion at
-https://lists.gnu.org/archive/html/grub-devel/2026-02/msg00039.html
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 041cfbab4..209c0fb11 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1794,11 +1794,6 @@ LIBS=""
- # Defined in acinclude.m4.
- grub_ASM_USCORE
- grub_PROG_TARGET_CC
--
--# The error message produced by autoconf if autoconf-archive is not installed is
--# quite misleading and not very helpful. So, try point people in the right direction.
--m4_ifndef([AX_CHECK_LINK_FLAG], [m4_fatal([autoconf-archive is missing. You must install it to generate the configure script.])])
--
- if test "x$TARGET_APPLE_LINKER" != x1 ; then
- grub_PROG_OBJCOPY_ABSOLUTE
- fi
--- 
-2.43.0
-
diff --git a/boot/grub2/grub2.hash b/boot/grub2/grub2.hash
index 5b5ac28eda..cf46011359 100644
--- a/boot/grub2/grub2.hash
+++ b/boot/grub2/grub2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# https://ftp.gnu.org/gnu/grub/grub-2.14.tar.xz.sig
-sha256  bc8d3c73535b8838d8c8e2654d73edc4e6ae8c8acdb45d5df5dc9a1547446d43  grub-2.14.tar.xz
+# https://gitlab.freedesktop.org/api/v4/projects/26558/packages/generic/source-assets/grub-2.16/grub-2.16.tar.xz.sig
+sha256  f0db0104927df0b9a48bc41b735c702936190d17eb2d73d3018fa77474a0cabe  grub-2.16.tar.xz
 # Locally computed:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index de9f913e93..d34415d467 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GRUB2_VERSION = 2.14
-GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
+GRUB2_VERSION = 2.16
+GRUB2_SITE = https://gitlab.freedesktop.org/api/v4/projects/26558/packages/generic/source-assets/grub-$(GRUB2_VERSION)
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
 GRUB2_LICENSE_FILES = COPYING
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
