Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C998606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BV5aYbQt
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCB9B40A9B;
	Wed, 21 Oct 2026 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLJhwSKz7dfj; Wed, 21 Oct 2026 19:29:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 16EF740A84
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610994;
	b=UbGRkCIz0oyiF0fwvaizcs9gBo6r67gYWSkU/1eIdGyVbZeZWLBjsKavF1IR53sH2Daf
	 S7FT0zMk3AIL8Z1gADbWVF+JLLyrmfTdMAzek0cVzsd19N/e5Q+Pmgs5kSfuLG7A/J96J
	 sLTho7jFm2BP2hzFRrQhg6ET3qvk/h8R0YqVVscsb3DOhRVxs2FNiRtS6FDU07mVAUqny
	 vUKBcXH0EUaAvBj3EKZgWFDlwaqfm7+Dvk7Z92tSsr+UKwHp4xpGogffqRdhQ3NzXnLFO
	 kjlRGIGoclbah36WP78nYzskdpx1PxIB2DyTXj1hWMHTTVPN06EfdXFD8LzdbpzkOGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=an8D577+1kJgtn7w2/cMWBQHmehEnIFu/vK1k1h/Gc0=;
	b=EJtgRsn88s+OvN57fG5Wy7TtIWDibMkYXZ/kE0Li2Up15WFOsHUHQRrFPZiYWosYpNUo
	 FupGA+VCzDH1qYPlBCKP9N55a8AEFyZ1ZJP2fUfsfHDkQ59QzQYL47OIRZzyRIH3IlYA0
	 0rY8stiXcDn6zwrHoBK7sBsdrH9UFaTArfgY+5BqVNd5QEDGkdIQf4RDiIZ/bqlJmjO4/
	 0BYZWijoGL2wCoIiLKX3/VJTjynxKNucLqOSEO3amC9IwIzfCuiKVmw1bqoSZ2zbaXTpr
	 kfU+LvbNkpYTR9GjvT5LRPpjpwSJY15/RDdhWlJgJbfhDcb6Xilx/nM3gK/LL44pscw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610994;
	bh=an8D577+1kJgtn7w2/cMWBQHmehEnIFu/vK1k1h/Gc0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BV5aYbQtyCrX9rYP81KiRpNhzK7PJMNp3NkghBnF+Slokvmos7PmnGjYGhPOqWA1N
	 sjFygwwlydhZR2rJryPJv6iq5bFFagKQ8/a1O8A4aLENs7pdFVgsbz8WEIeBYMWfL2
	 H5JAf3qWBC4479YB7wdbQtivQ8LX3mQhTyKY3f21DvG2hJM9Q6lHIwga+ABAVNT4jA
	 AHBzfD9tvsNovGJrU4xgsO6w+K4t0rVQ5NuP0nAwmx74mOUlVvxdEnDBXsl6zAxcHg
	 VEy5CPjx3Opcx6R+XYaNDXgr0jnFBbz5O68FWpfN3fNvljaEkKaJUK/J5up2goDTcN
	 yQn/1nXuILH7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16EF740A84;
	Wed, 21 Oct 2026 19:29:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD0813A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2D8340A9B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMpoLq0h86JU for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:29:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A5FE340A8E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610991;
 b=JmwjgX3vc8C3QBTPnwa/oG6I1xbcneNZCLS7mCzonPoNabT0Ex48lyGC3nsJQ6VmVrtn
 Ufj3WaRKbTfdEqMOY/dYt2CgJ6M5lcXhi+4E3c6asa5m4h2h2smiX/4CMhkKa5eW7MZG6
 81OvjH6i007enxMfUeuqGNhybyVXEjOFXQEkk1Uayp7XRqzGnNNOh3pUwKWZT1k81E2pA
 3CDE815Jo8jDK56p+SJY9xK3tHqfGJd4pVU621KrrkypWhPQjYIjwsheHbyUrik6WSICy
 E0M3O+CJauJt0IuU9j8Db9c2QQH1PuABQ0o1nJrW38P4A+raiQE3sKriD4ZhF2eU5pA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610991;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bJbKN7k8IdZ8feRojBuV5CzbP7IN88syWwleCRuQTjY=;
 b=J88FU3ROF/bxscNLiQSdLVBr3umadfiarcD21Wq2sTcjj8N+J0v7J9kmRYAe3cmHz9tv
 2ryi1AfYhAh4fbE1+aEf/qgpbYbNsCrST85DSOSIQIaL6LdY43URlrBGQjd+I/Gxo40sn
 aPC8hx+/GPPgt79Pd7JZrkWvgFcPxrSekWZVvymgM7TnPuOharxmWOQp2ThZbenX4ZXcV
 XrLX7pCsro+YO48uGtA8xKPDt6XwB0lUV6DQY4LtmtL9LonsAak0wKqMZLlROqo7Ewd0W
 FZZnrGswNzmv2CwoY+XQUuY27ogyW3V4cB1hjfWePFjtyL7CDXohfW4Av1aQAttZ6cw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5FE340A8E
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:29:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1EC499AEE; Wed, 21 Oct 2026 19:28:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:28:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9bd7330a43156da5d77b8423e46c8843d6af6db1
X-Git-Newrev: 2121608f627a4886833610c29ebabd6fa95a0869
X-Patchwork-Hint: ignore
Message-Id: <20261021192827.F1EC499AEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: bump to version 2.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2121608f627a4886833610c29ebabd6fa95a0869
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...4-Limit-memory-allocations-to-4GB-boundar.patch | 34 ++++++++++
 ...igure-Check-linker-for-image-base-support.patch | 75 ----------------------
 ...igure-Print-a-more-helpful-error-if-autoc.patch | 36 -----------
 boot/grub2/grub2.hash                              |  4 +-
 boot/grub2/grub2.mk                                |  4 +-
 5 files changed, 38 insertions(+), 115 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
