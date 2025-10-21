Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29094CCD1AF
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 20:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2BBC827A0;
	Tue, 21 Oct 2025 20:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQjSuVpE25Vj; Tue, 21 Oct 2025 20:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A4082726
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1A4082726;
	Tue, 21 Oct 2025 20:50:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D299070A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D027440995
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jU1AEWLi3jvL for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 20:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02B7C40988
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02B7C40988
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:50:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E398287714; Tue, 21 Oct 2025 20:50:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 22:43:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 926e0504d06b5d61d7affb24b94b133b916b71f7
X-Git-Newrev: c457a046cbec81d39fae0f108e88324553b55445
X-Patchwork-Hint: ignore
Message-Id: <20251021205020.E398287714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbpf: security bump to version
 1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c457a046cbec81d39fae0f108e88324553b55445
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The removed patch has been merged in version 1.6.0 fixing
the security CVE-2025-29481.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-29481

Release notes:
https://github.com/libbpf/libbpf/releases/tag/v1.5.1
https://github.com/libbpf/libbpf/releases/tag/v1.6.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-buffer-overflow-in-bpf_object__init_prog.patch | 103 ---------------------
 package/libbpf/libbpf.hash                         |   2 +-
 package/libbpf/libbpf.mk                           |   5 +-
 3 files changed, 2 insertions(+), 108 deletions(-)

diff --git a/package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch b/package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
deleted file mode 100644
index 2806ff220d..0000000000
--- a/package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 806b4e0a9f658d831119cece11a082ba1578b800 Mon Sep 17 00:00:00 2001
-From: Viktor Malik <vmalik@redhat.com>
-Date: Tue, 15 Apr 2025 17:50:14 +0200
-Subject: [PATCH] libbpf: Fix buffer overflow in bpf_object__init_prog
-
-Upstream: https://github.com/libbpf/libbpf/commit/806b4e0a9f658d831119cece11a082ba1578b800
-
-CVE: CVE-2025-29481
-
-As shown in [1], it is possible to corrupt a BPF ELF file such that
-arbitrary BPF instructions are loaded by libbpf. This can be done by
-setting a symbol (BPF program) section offset to a large (unsigned)
-number such that <section start + symbol offset> overflows and points
-before the section data in the memory.
-
-Consider the situation below where:
-- prog_start = sec_start + symbol_offset    <-- size_t overflow here
-- prog_end   = prog_start + prog_size
-
-    prog_start        sec_start        prog_end        sec_end
-        |                |                 |              |
-        v                v                 v              v
-    .....................|################################|............
-
-The report in [1] also provides a corrupted BPF ELF which can be used as
-a reproducer:
-
-    $ readelf -S crash
-    Section Headers:
-      [Nr] Name              Type             Address           Offset
-           Size              EntSize          Flags  Link  Info  Align
-    ...
-      [ 2] uretprobe.mu[...] PROGBITS         0000000000000000  00000040
-           0000000000000068  0000000000000000  AX       0     0     8
-
-    $ readelf -s crash
-    Symbol table '.symtab' contains 8 entries:
-       Num:    Value          Size Type    Bind   Vis      Ndx Name
-    ...
-         6: ffffffffffffffb8   104 FUNC    GLOBAL DEFAULT    2 handle_tp
-
-Here, the handle_tp prog has section offset ffffffffffffffb8, i.e. will
-point before the actual memory where section 2 is allocated.
-
-This is also reported by AddressSanitizer:
-
-    =================================================================
-    ==1232==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x7c7302fe0000 at pc 0x7fc3046e4b77 bp 0x7ffe64677cd0 sp 0x7ffe64677490
-    READ of size 104 at 0x7c7302fe0000 thread T0
-        #0 0x7fc3046e4b76 in memcpy (/lib64/libasan.so.8+0xe4b76)
-        #1 0x00000040df3e in bpf_object__init_prog /src/libbpf/src/libbpf.c:856
-        #2 0x00000040df3e in bpf_object__add_programs /src/libbpf/src/libbpf.c:928
-        #3 0x00000040df3e in bpf_object__elf_collect /src/libbpf/src/libbpf.c:3930
-        #4 0x00000040df3e in bpf_object_open /src/libbpf/src/libbpf.c:8067
-        #5 0x00000040f176 in bpf_object__open_file /src/libbpf/src/libbpf.c:8090
-        #6 0x000000400c16 in main /poc/poc.c:8
-        #7 0x7fc3043d25b4 in __libc_start_call_main (/lib64/libc.so.6+0x35b4)
-        #8 0x7fc3043d2667 in __libc_start_main@@GLIBC_2.34 (/lib64/libc.so.6+0x3667)
-        #9 0x000000400b34 in _start (/poc/poc+0x400b34)
-
-    0x7c7302fe0000 is located 64 bytes before 104-byte region [0x7c7302fe0040,0x7c7302fe00a8)
-    allocated by thread T0 here:
-        #0 0x7fc3046e716b in malloc (/lib64/libasan.so.8+0xe716b)
-        #1 0x7fc3045ee600 in __libelf_set_rawdata_wrlock (/lib64/libelf.so.1+0xb600)
-        #2 0x7fc3045ef018 in __elf_getdata_rdlock (/lib64/libelf.so.1+0xc018)
-        #3 0x00000040642f in elf_sec_data /src/libbpf/src/libbpf.c:3740
-
-The problem here is that currently, libbpf only checks that the program
-end is within the section bounds. There used to be a check
-`while (sec_off < sec_sz)` in bpf_object__add_programs, however, it was
-removed by commit 6245947c1b3c ("libbpf: Allow gaps in BPF program
-sections to support overriden weak functions").
-
-Add a check for detecting the overflow of `sec_off + prog_sz` to
-bpf_object__init_prog to fix this issue.
-
-[1] https://github.com/lmarch2/poc/blob/main/libbpf/libbpf.md
-
-Fixes: 6245947c1b3c ("libbpf: Allow gaps in BPF program sections to support overriden weak functions")
-Reported-by: lmarch2 <2524158037@qq.com>
-Signed-off-by: Viktor Malik <vmalik@redhat.com>
-Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
-Reviewed-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
-Link: https://github.com/lmarch2/poc/blob/main/libbpf/libbpf.md
-Link: https://lore.kernel.org/bpf/20250415155014.397603-1-vmalik@redhat.com
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- src/libbpf.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libbpf.c b/src/libbpf.c
-index b2591f5ca..56250b5ac 100644
---- a/src/libbpf.c
-+++ b/src/libbpf.c
-@@ -896,7 +896,7 @@ bpf_object__add_programs(struct bpf_object *obj, Elf_Data *sec_data,
- 			return -LIBBPF_ERRNO__FORMAT;
- 		}
- 
--		if (sec_off + prog_sz > sec_sz) {
-+		if (sec_off + prog_sz > sec_sz || sec_off + prog_sz < sec_off) {
- 			pr_warn("sec '%s': program at offset %zu crosses section boundary\n",
- 				sec_name, sec_off);
- 			return -LIBBPF_ERRNO__FORMAT;
diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index f5ecc59cd8..809d6934eb 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  53492aff6dd47e4da04ef5e672d753b9743848bdb38e9d90eafbe190b7983c44  libbpf-1.5.0.tar.gz
+sha256  d360ed1541fa4fc036132e7732fdf1e4569c187d3e4a4ddc07fd9dbfd121c4eb  libbpf-1.6.0.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
 sha256  e1638b9a0c68ca90fad3df1d6b4e430804d2fbdc15e58d02cffddfae38953bbf  LICENSE.BSD-2-Clause
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 7c8cfbee85..f5154813e6 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 1.5.0
+LIBBPF_VERSION = 1.6.0
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
@@ -13,9 +13,6 @@ LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf elfutils zlib
 HOST_LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf host-elfutils host-zlib
 LIBBPF_INSTALL_STAGING = YES
 
-# 0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
-LIBBPF_IGNORE_CVES += CVE-2025-29481
-
 define LIBBPF_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
 		-C $(@D)/src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
