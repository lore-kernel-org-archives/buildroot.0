Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F68CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9645483D0E;
	Fri, 12 Jun 2026 20:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYlAArgS0L3k; Fri, 12 Jun 2026 20:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1786E83D02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781294499;
	bh=YAybG3+bQzsWNP3b2PEJzi5Rg4R1LC1IXHvKtuQieCw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UzdLSlP3fXtzGJ2KVThZ3lkL9+ulrZBeCKTODZgfkkA2YgVQIKszyfhThQjio7JRx
	 SoKI5IxWLs/mtdN6zctGc+7+bmQ6iqzwNqlycX8T9JvPxn4Y6Mv7/obdPt6fDEGK4n
	 GxKTv3/vbOH1W9gIl8QOGpcNpCq+a6a1Os5P+SMLFrpDxd3P664gezqgMCmZuJU7Ri
	 2QSHc+pIlfIXqrtxQCHCPI7SgXC5NhbXS0PEbzEyK00mHfqwTwEiOfbbS612cN/M9W
	 3+iteY8Nbx7d+bMaC0QLstU8RwI4xOJMsAcmNjYgUhNg4UZanoeNY0Vqb4UkMfmHJg
	 hXsDFPAvnrr7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1786E83D02;
	Fri, 12 Jun 2026 20:01:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFDD21E9D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A59F140D41
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIxzAFgYJSx2 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9430940D3D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9430940D3D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:01:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3234B88148; Fri, 12 Jun 2026 20:01:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 18:55:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00e4a03348ca4fccbc64d540a9d06d0bbdc2602f
X-Git-Newrev: 28eeca9a988441dc55ab4a78da83cd58bffafa53
X-Patchwork-Hint: ignore
Message-Id: <20260612200116.3234B88148@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython: bump to version 1.28.0
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
Content-Type: multipart/mixed; boundary="===============2062498970609891525=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2062498970609891525==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/28eeca9a988441dc55ab4a78da83cd58bffafa53
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This allows us to fix packaging issue with micropython-lib, which was
not packaging the correct versions of some libraries.  The new version
makes changes to the `manifestfile` tool/library used by our
collect_micropython_libs.py script, which makes it easier to collect the
correct library version.  This fixes #166.

To better support alternate use cases, the option to package the modules
in unix-ffi has been split into a separate option, instead of assuming
it's needed if and only if libffi is selected.

Both the upstream changes and the unix-ffi split require changes to
collect_micropython_libs.py.  First, since we might not want the
unix-ffi libraries, the script takes an extra argument for whether or
not to include them.  Next, since the manifest.require function no
longer takes a unix_ffi optional parameter, we use manifest.add_library
as recommended in the micropython-lib/unix-ffi directory README, if we
are are actually packaging those libraries.

All of the patches we have been maintaining have also been merged upstream
by 1.28.0, so they are removed.  Their respective Upstream: trailers all
point to the relevant commits, except for
0003-Fixes-for-GCC-15-1-unterminated-string-literal-warning.patch, from
https://github.com/micropython/micropython/commit/ae6062a45a776e193e8c02ece62d058b64f2b4f5

The LICENSE hash has been updated, as the year and the licenses used for
the ports and libraries have also been updated in the LICENSE file.

For more details on the version bump, see the release notes:
  - https://github.com/micropython/micropython/releases/tag/v1.23.0
  - https://github.com/micropython/micropython/releases/tag/v1.24.0
  - https://github.com/micropython/micropython/releases/tag/v1.24.1
  - https://github.com/micropython/micropython/releases/tag/v1.25.0
  - https://github.com/micropython/micropython/releases/tag/v1.26.0
  - https://github.com/micropython/micropython/releases/tag/v1.26.1
  - https://github.com/micropython/micropython/releases/tag/v1.27.0
  - https://github.com/micropython/micropython/releases/tag/v1.28.0

Signed-off-by: Daniel Houck <Software@DRHouck.me>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-Make-non-Thumb2-long-jump-workaround-opt.patch | 130 ------------
 ...nlinextensa-Simplify-register-name-lookup.patch |  85 --------
 ...-15-1-unterminated-string-literal-warning.patch | 234 ---------------------
 ...free-if-extending-a-bytearray-from-itself.patch | 183 ----------------
 package/micropython/Config.in                      |  21 +-
 package/micropython/collect_micropython_lib.py     |  18 +-
 package/micropython/micropython.hash               |   4 +-
 package/micropython/micropython.mk                 |  13 +-
 8 files changed, 38 insertions(+), 650 deletions(-)

diff --git a/package/micropython/0001-py-nlrthumb-Make-non-Thumb2-long-jump-workaround-opt.patch b/package/micropython/0001-py-nlrthumb-Make-non-Thumb2-long-jump-workaround-opt.patch
deleted file mode 100644
index b05791045e..0000000000
--- a/package/micropython/0001-py-nlrthumb-Make-non-Thumb2-long-jump-workaround-opt.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From 7b050b366b7dacfb43779c51702a892d8f1873d0 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>
-Date: Sun, 2 Apr 2023 19:58:42 +0200
-Subject: [PATCH] py/nlrthumb: Make non-Thumb2 long-jump workaround opt-in.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Although the original motivation given for the workaround[1] is correct,
-nlr.o and nlrthumb.o are linked with a small enough distance that the
-problem does not occur, and the workaround isn't necessary. The distance
-between the b instruction and its target (nlr_push_tail) is just 64
-bytes[2], well within the ±2046 byte range addressable by an
-unconditional branch instruction in Thumb mode.
-
-The workaround induces a relocation in the text section (textrel), which
-isn't supported everywhere, notably not on musl-libc[3], where it causes
-a crash on start-up. With the workaround removed, micropython works on an
-ARMv5T Linux system built with musl-libc.
-
-This commit changes nlrthumb.c to use a direct jump by default, but
-leaves the long jump workaround as an option for those cases where it's
-actually needed.
-
-[1]: commit dd376a239dc4f47b0ee7866810fcda151f3cf6dd
-
-Author: Damien George <damien.p.george@gmail.com>
-Date:   Fri Sep 1 15:25:29 2017 +1000
-
-    py/nlrthumb: Get working again on standard Thumb arch (ie not Thumb2).
-
-    "b" on Thumb might not be long enough for the jump to nlr_push_tail so
-    it must be done indirectly.
-
-[2]: Excerpt from objdump -d micropython:
-
-000095c4 <nlr_push_tail>:
-    95c4:       b510            push    {r4, lr}
-    95c6:       0004            movs    r4, r0
-    95c8:       f02d fd42       bl      37050 <mp_thread_get_state>
-    95cc:       6943            ldr     r3, [r0, #20]
-    95ce:       6023            str     r3, [r4, #0]
-    95d0:       6144            str     r4, [r0, #20]
-    95d2:       2000            movs    r0, #0
-    95d4:       bd10            pop     {r4, pc}
-
-000095d6 <nlr_pop>:
-    95d6:       b510            push    {r4, lr}
-    95d8:       f02d fd3a       bl      37050 <mp_thread_get_state>
-    95dc:       6943            ldr     r3, [r0, #20]
-    95de:       681b            ldr     r3, [r3, #0]
-    95e0:       6143            str     r3, [r0, #20]
-    95e2:       bd10            pop     {r4, pc}
-
-000095e4 <nlr_push>:
-    95e4:       60c4            str     r4, [r0, #12]
-    95e6:       6105            str     r5, [r0, #16]
-    95e8:       6146            str     r6, [r0, #20]
-    95ea:       6187            str     r7, [r0, #24]
-    95ec:       4641            mov     r1, r8
-    95ee:       61c1            str     r1, [r0, #28]
-    95f0:       4649            mov     r1, r9
-    95f2:       6201            str     r1, [r0, #32]
-    95f4:       4651            mov     r1, sl
-    95f6:       6241            str     r1, [r0, #36]   @ 0x24
-    95f8:       4659            mov     r1, fp
-    95fa:       6281            str     r1, [r0, #40]   @ 0x28
-    95fc:       4669            mov     r1, sp
-    95fe:       62c1            str     r1, [r0, #44]   @ 0x2c
-    9600:       4671            mov     r1, lr
-    9602:       6081            str     r1, [r0, #8]
-    9604:       e7de            b.n     95c4 <nlr_push_tail>
-
-[3]: https://www.openwall.com/lists/musl/2020/09/25/4
-
-Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
-Upstream: https://github.com/micropython/micropython/commit/7b050b366b7dacfb43779c51702a892d8f1873d0
----
- py/mpconfig.h |  6 ++++++
- py/nlrthumb.c | 10 +++++++++-
- 2 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/py/mpconfig.h b/py/mpconfig.h
-index af2480266..1aa3e0699 100644
---- a/py/mpconfig.h
-+++ b/py/mpconfig.h
-@@ -587,6 +587,12 @@
- /*****************************************************************************/
- /* Python internal features                                                  */
-
-+// Use a special long jump in nlrthumb.c, which may be necessary if nlr.o and
-+// nlrthumb.o are linked far apart from each other.
-+#ifndef MICROPY_NLR_THUMB_USE_LONG_JUMP
-+#define MICROPY_NLR_THUMB_USE_LONG_JUMP (0)
-+#endif
-+
- // Whether to enable import of external modules
- // When disabled, only importing of built-in modules is supported
- // When enabled, a port must implement mp_import_stat (among other things)
-diff --git a/py/nlrthumb.c b/py/nlrthumb.c
-index a22c5df5b..e7b24f242 100644
---- a/py/nlrthumb.c
-+++ b/py/nlrthumb.c
-@@ -38,6 +38,14 @@
-
- __attribute__((naked)) unsigned int nlr_push(nlr_buf_t *nlr) {
-
-+    // If you get a linker error here, indicating that a relocation doesn't
-+    // fit, try the following (in that order):
-+    //
-+    // 1. Ensure that nlr.o nlrthumb.o are linked closely together, i.e.
-+    //    there aren't too many other files between them in the linker list
-+    //    (PY_CORE_O_BASENAME in py/py.mk)
-+    // 2. Set -DMICROPY_NLR_THUMB_USE_LONG_JUMP=1 during the build
-+    //
-     __asm volatile (
-         "str    r4, [r0, #12]       \n" // store r4 into nlr_buf
-         "str    r5, [r0, #16]       \n" // store r5 into nlr_buf
-@@ -71,7 +79,7 @@ __attribute__((naked)) unsigned int nlr_push(nlr_buf_t *nlr) {
-         "str    lr, [r0, #8]        \n" // store lr into nlr_buf
-         #endif
-
--        #if !defined(__thumb2__)
-+        #if MICROPY_NLR_THUMB_USE_LONG_JUMP
-         "ldr    r1, nlr_push_tail_var \n"
-         "bx     r1                  \n" // do the rest in C
-         ".align 2                   \n"
---
-2.43.0
-
diff --git a/package/micropython/0002-py-emitinlinextensa-Simplify-register-name-lookup.patch b/package/micropython/0002-py-emitinlinextensa-Simplify-register-name-lookup.patch
deleted file mode 100644
index 1d18db8235..0000000000
--- a/package/micropython/0002-py-emitinlinextensa-Simplify-register-name-lookup.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 7d9fcfcd1b0ef9f20e703037eba6a49a4fc4cb0c Mon Sep 17 00:00:00 2001
-From: Alessandro Gatti <a.gatti@frob.it>
-Date: Tue, 28 Jan 2025 14:58:29 +0100
-Subject: [PATCH] py/emitinlinextensa: Simplify register name lookup.
-
-This commit changes the Xtensa inline assembly parser to use a slightly
-simpler (and probably a tiny bit more efficient) way to look up register
-names when decoding instruction parameters.
-
-Signed-off-by: Alessandro Gatti <a.gatti@frob.it>
-Upstream: https://github.com/micropython/micropython/commit/50fab08e6b861adf65905d6adacd74201c87ddb9
-[tperale: backport 1.22.2]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- py/emitinlinextensa.c | 49 +++++++++----------------------------------
- 1 file changed, 10 insertions(+), 39 deletions(-)
-
-diff --git a/py/emitinlinextensa.c b/py/emitinlinextensa.c
-index 5dac2ae39..e59146047 100644
---- a/py/emitinlinextensa.c
-+++ b/py/emitinlinextensa.c
-@@ -115,50 +115,21 @@ STATIC bool emit_inline_xtensa_label(emit_inline_asm_t *emit, mp_uint_t label_nu
-     return true;
- }
- 
--typedef struct _reg_name_t { byte reg;
--                             byte name[3];
--} reg_name_t;
--STATIC const reg_name_t reg_name_table[] = {
--    {0, "a0\0"},
--    {1, "a1\0"},
--    {2, "a2\0"},
--    {3, "a3\0"},
--    {4, "a4\0"},
--    {5, "a5\0"},
--    {6, "a6\0"},
--    {7, "a7\0"},
--    {8, "a8\0"},
--    {9, "a9\0"},
--    {10, "a10"},
--    {11, "a11"},
--    {12, "a12"},
--    {13, "a13"},
--    {14, "a14"},
--    {15, "a15"},
-+STATIC const qstr_short_t REGISTERS[16] = {
-+    MP_QSTR_a0, MP_QSTR_a1, MP_QSTR_a2, MP_QSTR_a3, MP_QSTR_a4, MP_QSTR_a5, MP_QSTR_a6, MP_QSTR_a7,
-+    MP_QSTR_a8, MP_QSTR_a9, MP_QSTR_a10, MP_QSTR_a11, MP_QSTR_a12, MP_QSTR_a13, MP_QSTR_a14, MP_QSTR_a15
- };
- 
--// return empty string in case of error, so we can attempt to parse the string
--// without a special check if it was in fact a string
--STATIC const char *get_arg_str(mp_parse_node_t pn) {
--    if (MP_PARSE_NODE_IS_ID(pn)) {
--        qstr qst = MP_PARSE_NODE_LEAF_ARG(pn);
--        return qstr_str(qst);
--    } else {
--        return "";
--    }
--}
--
- STATIC mp_uint_t get_arg_reg(emit_inline_asm_t *emit, const char *op, mp_parse_node_t pn) {
--    const char *reg_str = get_arg_str(pn);
--    for (mp_uint_t i = 0; i < MP_ARRAY_SIZE(reg_name_table); i++) {
--        const reg_name_t *r = &reg_name_table[i];
--        if (reg_str[0] == r->name[0]
--            && reg_str[1] == r->name[1]
--            && reg_str[2] == r->name[2]
--            && (reg_str[2] == '\0' || reg_str[3] == '\0')) {
--            return r->reg;
-+    if (MP_PARSE_NODE_IS_ID(pn)) {
-+        qstr node_qstr = MP_PARSE_NODE_LEAF_ARG(pn);
-+        for (size_t i = 0; i < MP_ARRAY_SIZE(REGISTERS); i++) {
-+            if (node_qstr == REGISTERS[i]) {
-+                return i;
-+            }
-         }
-     }
-+
-     emit_inline_xtensa_error_exc(emit,
-         mp_obj_new_exception_msg_varg(&mp_type_SyntaxError,
-             MP_ERROR_TEXT("'%s' expects a register"), op));
--- 
-2.49.0
-
diff --git a/package/micropython/0003-Fixes-for-GCC-15-1-unterminated-string-literal-warning.patch b/package/micropython/0003-Fixes-for-GCC-15-1-unterminated-string-literal-warning.patch
deleted file mode 100644
index 31775bdbc0..0000000000
--- a/package/micropython/0003-Fixes-for-GCC-15-1-unterminated-string-literal-warning.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-From 531d4839d44a90447c232d51d1bee0cae45add9a Mon Sep 17 00:00:00 2001
-From: Angus Gratton <angus@redyak.com.au>
-Date: Fri, 9 May 2025 13:34:37 +1000
-Subject: [PATCH] extmod/moductypes: Refactor string literal as array
- initializer.
-
-Avoids the new Wunterminated-string-literal when compiled with gcc 15.1.
-
-Also split out the duplicate string to a top-level array (probably the
-duplicate string literal was interned, so unlikely to have any impact.)
-
-This work was funded through GitHub Sponsors.
-
-Signed-off-by: Angus Gratton <angus@redyak.com.au>
-Upstream: https://github.com/micropython/micropython/pull/17269
-[tperale: backport 1.22.2]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- extmod/moductypes.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/extmod/moductypes.c b/extmod/moductypes.c
-index f56567107..87fd5fb69 100644
---- a/extmod/moductypes.c
-+++ b/extmod/moductypes.c
-@@ -277,15 +277,18 @@ STATIC mp_obj_t uctypes_struct_sizeof(size_t n_args, const mp_obj_t *args) {
- }
- STATIC MP_DEFINE_CONST_FUN_OBJ_VAR_BETWEEN(uctypes_struct_sizeof_obj, 1, 2, uctypes_struct_sizeof);
- 
-+static const char type2char[16] = {
-+    'B', 'b', 'H', 'h', 'I', 'i', 'Q', 'q',
-+    '-', '-', '-', '-', '-', '-', 'f', 'd'
-+};
-+
- static inline mp_obj_t get_unaligned(uint val_type, byte *p, int big_endian) {
-     char struct_type = big_endian ? '>' : '<';
--    static const char type2char[16] = "BbHhIiQq------fd";
-     return mp_binary_get_val(struct_type, type2char[val_type], p, &p);
- }
- 
- static inline void set_unaligned(uint val_type, byte *p, int big_endian, mp_obj_t val) {
-     char struct_type = big_endian ? '>' : '<';
--    static const char type2char[16] = "BbHhIiQq------fd";
-     mp_binary_set_val(struct_type, type2char[val_type], val, p, &p);
- }
- 
-
-From 0398873d8c8096d2054db130efd1fcecba2a426d Mon Sep 17 00:00:00 2001
-From: Angus Gratton <angus@redyak.com.au>
-Date: Fri, 9 May 2025 13:36:05 +1000
-Subject: [PATCH] py/emitinlinethumb: Refactor string literal as array
- initializer.
-
-Avoids the new Wunterminated-string-literal when compiled with gcc 15.1.
-
-This work was funded through GitHub Sponsors.
-
-Signed-off-by: Angus Gratton <angus@redyak.com.au>
----
- py/emitinlinethumb.c | 108 +++++++++++++++++++++----------------------
- 1 file changed, 54 insertions(+), 54 deletions(-)
-
-diff --git a/py/emitinlinethumb.c b/py/emitinlinethumb.c
-index 29487f104..0b9efa1da 100644
---- a/py/emitinlinethumb.c
-+++ b/py/emitinlinethumb.c
-@@ -150,27 +150,27 @@ typedef struct _reg_name_t { byte reg;
-                              byte name[3];
- } reg_name_t;
- STATIC const reg_name_t reg_name_table[] = {
--    {0, "r0\0"},
--    {1, "r1\0"},
--    {2, "r2\0"},
--    {3, "r3\0"},
--    {4, "r4\0"},
--    {5, "r5\0"},
--    {6, "r6\0"},
--    {7, "r7\0"},
--    {8, "r8\0"},
--    {9, "r9\0"},
--    {10, "r10"},
--    {11, "r11"},
--    {12, "r12"},
--    {13, "r13"},
--    {14, "r14"},
--    {15, "r15"},
--    {10, "sl\0"},
--    {11, "fp\0"},
--    {13, "sp\0"},
--    {14, "lr\0"},
--    {15, "pc\0"},
-+    {0, {'r', '0' }},
-+    {1, {'r', '1' }},
-+    {2, {'r', '2' }},
-+    {3, {'r', '3' }},
-+    {4, {'r', '4' }},
-+    {5, {'r', '5' }},
-+    {6, {'r', '6' }},
-+    {7, {'r', '7' }},
-+    {8, {'r', '8' }},
-+    {9, {'r', '9' }},
-+    {10, {'r', '1', '0' }},
-+    {11, {'r', '1', '1' }},
-+    {12, {'r', '1', '2' }},
-+    {13, {'r', '1', '3' }},
-+    {14, {'r', '1', '4' }},
-+    {15, {'r', '1', '5' }},
-+    {10, {'s', 'l' }},
-+    {11, {'f', 'p' }},
-+    {13, {'s', 'p' }},
-+    {14, {'l', 'r' }},
-+    {15, {'p', 'c' }},
- };
- 
- #define MAX_SPECIAL_REGISTER_NAME_LENGTH 7
-@@ -368,20 +368,20 @@ typedef struct _cc_name_t { byte cc;
-                             byte name[2];
- } cc_name_t;
- STATIC const cc_name_t cc_name_table[] = {
--    { ASM_THUMB_CC_EQ, "eq" },
--    { ASM_THUMB_CC_NE, "ne" },
--    { ASM_THUMB_CC_CS, "cs" },
--    { ASM_THUMB_CC_CC, "cc" },
--    { ASM_THUMB_CC_MI, "mi" },
--    { ASM_THUMB_CC_PL, "pl" },
--    { ASM_THUMB_CC_VS, "vs" },
--    { ASM_THUMB_CC_VC, "vc" },
--    { ASM_THUMB_CC_HI, "hi" },
--    { ASM_THUMB_CC_LS, "ls" },
--    { ASM_THUMB_CC_GE, "ge" },
--    { ASM_THUMB_CC_LT, "lt" },
--    { ASM_THUMB_CC_GT, "gt" },
--    { ASM_THUMB_CC_LE, "le" },
-+    { ASM_THUMB_CC_EQ, { 'e', 'q' }},
-+    { ASM_THUMB_CC_NE, { 'n', 'e' }},
-+    { ASM_THUMB_CC_CS, { 'c', 's' }},
-+    { ASM_THUMB_CC_CC, { 'c', 'c' }},
-+    { ASM_THUMB_CC_MI, { 'm', 'i' }},
-+    { ASM_THUMB_CC_PL, { 'p', 'l' }},
-+    { ASM_THUMB_CC_VS, { 'v', 's' }},
-+    { ASM_THUMB_CC_VC, { 'v', 'c' }},
-+    { ASM_THUMB_CC_HI, { 'h', 'i' }},
-+    { ASM_THUMB_CC_LS, { 'l', 's' }},
-+    { ASM_THUMB_CC_GE, { 'g', 'e' }},
-+    { ASM_THUMB_CC_LT, { 'l', 't' }},
-+    { ASM_THUMB_CC_GT, { 'g', 't' }},
-+    { ASM_THUMB_CC_LE, { 'l', 'e' }},
- };
- 
- typedef struct _format_4_op_t { byte op;
-@@ -389,21 +389,21 @@ typedef struct _format_4_op_t { byte op;
- } format_4_op_t;
- #define X(x) (((x) >> 4) & 0xff) // only need 1 byte to distinguish these ops
- STATIC const format_4_op_t format_4_op_table[] = {
--    { X(ASM_THUMB_FORMAT_4_EOR), "eor" },
--    { X(ASM_THUMB_FORMAT_4_LSL), "lsl" },
--    { X(ASM_THUMB_FORMAT_4_LSR), "lsr" },
--    { X(ASM_THUMB_FORMAT_4_ASR), "asr" },
--    { X(ASM_THUMB_FORMAT_4_ADC), "adc" },
--    { X(ASM_THUMB_FORMAT_4_SBC), "sbc" },
--    { X(ASM_THUMB_FORMAT_4_ROR), "ror" },
--    { X(ASM_THUMB_FORMAT_4_TST), "tst" },
--    { X(ASM_THUMB_FORMAT_4_NEG), "neg" },
--    { X(ASM_THUMB_FORMAT_4_CMP), "cmp" },
--    { X(ASM_THUMB_FORMAT_4_CMN), "cmn" },
--    { X(ASM_THUMB_FORMAT_4_ORR), "orr" },
--    { X(ASM_THUMB_FORMAT_4_MUL), "mul" },
--    { X(ASM_THUMB_FORMAT_4_BIC), "bic" },
--    { X(ASM_THUMB_FORMAT_4_MVN), "mvn" },
-+    { X(ASM_THUMB_FORMAT_4_EOR), {'e', 'o', 'r' }},
-+    { X(ASM_THUMB_FORMAT_4_LSL), {'l', 's', 'l' }},
-+    { X(ASM_THUMB_FORMAT_4_LSR), {'l', 's', 'r' }},
-+    { X(ASM_THUMB_FORMAT_4_ASR), {'a', 's', 'r' }},
-+    { X(ASM_THUMB_FORMAT_4_ADC), {'a', 'd', 'c' }},
-+    { X(ASM_THUMB_FORMAT_4_SBC), {'s', 'b', 'c' }},
-+    { X(ASM_THUMB_FORMAT_4_ROR), {'r', 'o', 'r' }},
-+    { X(ASM_THUMB_FORMAT_4_TST), {'t', 's', 't' }},
-+    { X(ASM_THUMB_FORMAT_4_NEG), {'n', 'e', 'g' }},
-+    { X(ASM_THUMB_FORMAT_4_CMP), {'c', 'm', 'p' }},
-+    { X(ASM_THUMB_FORMAT_4_CMN), {'c', 'm', 'n' }},
-+    { X(ASM_THUMB_FORMAT_4_ORR), {'o', 'r', 'r' }},
-+    { X(ASM_THUMB_FORMAT_4_MUL), {'m', 'u', 'l' }},
-+    { X(ASM_THUMB_FORMAT_4_BIC), {'b', 'i', 'c' }},
-+    { X(ASM_THUMB_FORMAT_4_MVN), {'m', 'v', 'n' }},
- };
- #undef X
- 
-@@ -428,10 +428,10 @@ typedef struct _format_vfp_op_t {
-     char name[3];
- } format_vfp_op_t;
- STATIC const format_vfp_op_t format_vfp_op_table[] = {
--    { 0x30, "add" },
--    { 0x34, "sub" },
--    { 0x20, "mul" },
--    { 0x80, "div" },
-+    { 0x30, {'a', 'd', 'd' }},
-+    { 0x34, {'s', 'u', 'b' }},
-+    { 0x20, {'m', 'u', 'l' }},
-+    { 0x80, {'d', 'i', 'v' }},
- };
- 
- // shorthand alias for whether we allow ARMv7-M instructions
-
-From bfd5a0350a0d53f52695d373dae6ee367971b145 Mon Sep 17 00:00:00 2001
-From: Angus Gratton <angus@redyak.com.au>
-Date: Fri, 9 May 2025 14:34:09 +1000
-Subject: [PATCH] lib/littlefs: Fix string initializer in lfs1.c.
-
-Avoids the new Wunterminated-string-literal when compiled with gcc 15.1.
-
-It would be preferable to just disable this warning, but Clang
--Wunknown-warning-option kicks in even when disabling warnings so this
-becomes fiddly to apply.
-
-This work was funded through GitHub Sponsors.
-
-Signed-off-by: Angus Gratton <angus@redyak.com.au>
----
- lib/littlefs/lfs1.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/littlefs/lfs1.c b/lib/littlefs/lfs1.c
-index 6a3fd670012cc..ec18dc470258c 100644
---- a/lib/littlefs/lfs1.c
-+++ b/lib/littlefs/lfs1.c
-@@ -2141,7 +2141,7 @@ int lfs1_format(lfs1_t *lfs1, const struct lfs1_config *cfg) {
-             .d.elen = sizeof(superblock.d) - sizeof(superblock.d.magic) - 4,
-             .d.nlen = sizeof(superblock.d.magic),
-             .d.version = LFS1_DISK_VERSION,
--            .d.magic = {"littlefs"},
-+            .d.magic = {'l', 'i', 't', 't', 'l', 'e', 'f', 's'},
-             .d.block_size  = lfs1->cfg->block_size,
-             .d.block_count = lfs1->cfg->block_count,
-             .d.root = {lfs1->root[0], lfs1->root[1]},
diff --git a/package/micropython/0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch b/package/micropython/0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch
deleted file mode 100644
index 90a795a6c3..0000000000
--- a/package/micropython/0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch
+++ /dev/null
@@ -1,183 +0,0 @@
-From 4bed614e707c0644c06e117f848fa12605c711cd Mon Sep 17 00:00:00 2001
-From: Angus Gratton <angus@redyak.com.au>
-Date: Tue, 13 Feb 2024 09:24:36 +1100
-Subject: [PATCH] py/objarray: Fix use-after-free if extending a bytearray from
- itself.
-
-Two cases, one assigning to a slice.
-Closes https://github.com/micropython/micropython/issues/13283
-
-Second is extending a slice from itself, similar logic.
-
-In both cases the problem occurs when m_renew causes realloc to move the
-buffer, leaving a dangling pointer behind.
-
-There are more complex and hard to fix cases when either argument is a
-memoryview into the buffer, currently resizing to a new address breaks
-memoryviews into that object.
-
-Reproducing this bug and confirming the fix was done by running the unix
-port under valgrind with GC-aware extensions.
-
-Note in default configurations with GIL this bug exists but has no impact
-(the free buffer won't be reused while the function is still executing, and
-is no longer referenced after it returns).
-
-Signed-off-by: Angus Gratton <angus@redyak.com.au>
-CVE: CVE-2024-8947
-Upstream: https://github.com/micropython/micropython/commit/4bed614e707c0644c06e117f848fa12605c711cd
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- py/objarray.c                          | 20 ++++++++++++++++----
- tests/basics/bytearray_add.py          |  9 ++++++++-
- tests/basics/bytearray_add_self.py     |  8 ++++++++
- tests/basics/bytearray_add_self.py.exp |  1 +
- tests/basics/bytearray_slice_assign.py | 18 ++++++++++++------
- 5 files changed, 45 insertions(+), 11 deletions(-)
- create mode 100644 tests/basics/bytearray_add_self.py
- create mode 100644 tests/basics/bytearray_add_self.py.exp
-
-diff --git a/py/objarray.c b/py/objarray.c
-index 1fff234822521..803af2cd270c7 100644
---- a/py/objarray.c
-+++ b/py/objarray.c
-@@ -424,6 +424,13 @@ static mp_obj_t array_extend(mp_obj_t self_in, mp_obj_t arg_in) {
-     if (self->free < len) {
-         self->items = m_renew(byte, self->items, (self->len + self->free) * sz, (self->len + len) * sz);
-         self->free = 0;
-+
-+        if (self_in == arg_in) {
-+            // Get arg_bufinfo again in case self->items has moved
-+            //
-+            // (Note not possible to handle case that arg_in is a memoryview into self)
-+            mp_get_buffer_raise(arg_in, &arg_bufinfo, MP_BUFFER_READ);
-+        }
-     } else {
-         self->free -= len;
-     }
-@@ -456,7 +463,8 @@ static mp_obj_t array_subscr(mp_obj_t self_in, mp_obj_t index_in, mp_obj_t value
-                 #if MICROPY_PY_ARRAY_SLICE_ASSIGN
-                 // Assign
-                 size_t src_len;
--                void *src_items;
-+                uint8_t *src_items;
-+                size_t src_offs = 0;
-                 size_t item_sz = mp_binary_get_size('@', o->typecode & TYPECODE_MASK, NULL);
-                 if (mp_obj_is_obj(value) && MP_OBJ_TYPE_GET_SLOT_OR_NULL(((mp_obj_base_t *)MP_OBJ_TO_PTR(value))->type, subscr) == array_subscr) {
-                     // value is array, bytearray or memoryview
-@@ -469,7 +477,7 @@ static mp_obj_t array_subscr(mp_obj_t self_in, mp_obj_t index_in, mp_obj_t value
-                     src_items = src_slice->items;
-                     #if MICROPY_PY_BUILTINS_MEMORYVIEW
-                     if (mp_obj_is_type(value, &mp_type_memoryview)) {
--                        src_items = (uint8_t *)src_items + (src_slice->memview_offset * item_sz);
-+                        src_offs = src_slice->memview_offset * item_sz;
-                     }
-                     #endif
-                 } else if (mp_obj_is_type(value, &mp_type_bytes)) {
-@@ -504,13 +512,17 @@ static mp_obj_t array_subscr(mp_obj_t self_in, mp_obj_t index_in, mp_obj_t value
-                         // TODO: alloc policy; at the moment we go conservative
-                         o->items = m_renew(byte, o->items, (o->len + o->free) * item_sz, (o->len + len_adj) * item_sz);
-                         o->free = len_adj;
-+                        // m_renew may have moved o->items
-+                        if (src_items == dest_items) {
-+                            src_items = o->items;
-+                        }
-                         dest_items = o->items;
-                     }
-                     mp_seq_replace_slice_grow_inplace(dest_items, o->len,
--                        slice.start, slice.stop, src_items, src_len, len_adj, item_sz);
-+                        slice.start, slice.stop, src_items + src_offs, src_len, len_adj, item_sz);
-                 } else {
-                     mp_seq_replace_slice_no_grow(dest_items, o->len,
--                        slice.start, slice.stop, src_items, src_len, item_sz);
-+                        slice.start, slice.stop, src_items + src_offs, src_len, item_sz);
-                     // Clear "freed" elements at the end of list
-                     // TODO: This is actually only needed for typecode=='O'
-                     mp_seq_clear(dest_items, o->len + len_adj, o->len, item_sz);
-diff --git a/tests/basics/bytearray_add.py b/tests/basics/bytearray_add.py
-index a7e2b57374255..1f30a3b740e95 100644
---- a/tests/basics/bytearray_add.py
-+++ b/tests/basics/bytearray_add.py
-@@ -15,4 +15,11 @@
- 
- # this inplace add tests the code when the buffer doesn't need to be increased
- b = bytearray()
--b += b''
-+b += b""
-+
-+# extend a bytearray from itself
-+b = bytearray(b"abcdefgh")
-+for _ in range(4):
-+    c = bytearray(b)  # extra allocation, as above
-+    b.extend(b)
-+print(b)
-diff --git a/tests/basics/bytearray_add_self.py b/tests/basics/bytearray_add_self.py
-new file mode 100644
-index 0000000000000..94ae8689fd16c
---- /dev/null
-+++ b/tests/basics/bytearray_add_self.py
-@@ -0,0 +1,8 @@
-+# add a bytearray to itself
-+# This is not supported by CPython as of 3.11.18.
-+
-+b = bytearray(b"123456789")
-+for _ in range(4):
-+    c = bytearray(b)  # extra allocation increases chance 'b' has to relocate
-+    b += b
-+print(b)
-diff --git a/tests/basics/bytearray_add_self.py.exp b/tests/basics/bytearray_add_self.py.exp
-new file mode 100644
-index 0000000000000..5ef948157ac0f
---- /dev/null
-+++ b/tests/basics/bytearray_add_self.py.exp
-@@ -0,0 +1 @@
-+bytearray(b'123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789')
-diff --git a/tests/basics/bytearray_slice_assign.py b/tests/basics/bytearray_slice_assign.py
-index fa7878e10ddbb..4de0819042a13 100644
---- a/tests/basics/bytearray_slice_assign.py
-+++ b/tests/basics/bytearray_slice_assign.py
-@@ -18,7 +18,7 @@
- l[1:3] = bytearray()
- print(l)
- l = bytearray(x)
--#del l[1:3]
-+# del l[1:3]
- print(l)
- 
- l = bytearray(x)
-@@ -28,7 +28,7 @@
- l[:3] = bytearray()
- print(l)
- l = bytearray(x)
--#del l[:3]
-+# del l[:3]
- print(l)
- 
- l = bytearray(x)
-@@ -38,7 +38,7 @@
- l[:-3] = bytearray()
- print(l)
- l = bytearray(x)
--#del l[:-3]
-+# del l[:-3]
- print(l)
- 
- # slice assignment that extends the array
-@@ -61,8 +61,14 @@
- print(b)
- 
- # Growth of bytearray via slice extension
--b = bytearray(b'12345678')
--b.append(57) # expand and add a bit of unused space at end of the bytearray
-+b = bytearray(b"12345678")
-+b.append(57)  # expand and add a bit of unused space at end of the bytearray
- for i in range(400):
--    b[-1:] = b'ab' # grow slowly into the unused space
-+    b[-1:] = b"ab"  # grow slowly into the unused space
-+print(len(b), b)
-+
-+# Growth of bytearray via slice extension from itself
-+b = bytearray(b"1234567")
-+for i in range(3):
-+    b[-1:] = b
- print(len(b), b)
diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index f532b3bdb5..6109e95109 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -13,10 +13,29 @@ if BR2_PACKAGE_MICROPYTHON
 
 config BR2_PACKAGE_MICROPYTHON_LIB
 	bool "micropython-lib"
-	select BR2_PACKAGE_PCRE2 # runtime
 	help
 	  Core Python libraries ported to MicroPython.
 
+	  This contains compatible but reduced-functionality versions
+	  of some Python standard library and wider Python ecosystem
+	  modules, as well as some MicroPython-specific libraries
+	  that aren't included in the base package.
+
+if BR2_PACKAGE_MICROPYTHON_LIB
+
+config BR2_PACKAGE_MICROPYTHON_LIB_UNIXFFI
+	bool "micropython-lib unix-ffi modules"
+	default y
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_PCRE2 # runtime
+	help
+	  Unix-specific MicroPython packages
+
+	  These provide additional functionality to MicroPython in
+	  standard environments.
+
+endif # BR2_PACKAGE_MICROPYTHON_LIB
+
 endif # BR2_PACKAGE_MICROPYTHON
 
 comment "micropython needs a toolchain w/ threads, dynamic library"
diff --git a/package/micropython/collect_micropython_lib.py b/package/micropython/collect_micropython_lib.py
index 8dce78337a..5fb74787a9 100755
--- a/package/micropython/collect_micropython_lib.py
+++ b/package/micropython/collect_micropython_lib.py
@@ -57,23 +57,29 @@ def process_cmdline_args():
     )
     parser.add_argument("micropython", help="Path to micropython source directory")
     parser.add_argument("destination", help="Destination directory")
+    parser.add_argument("--ffi", action=argparse.BooleanOptionalAction,
+                        default=True, help="Install libs that require FFI")
 
     args = parser.parse_args()
-    return os.path.abspath(args.micropython), os.path.abspath(args.destination)
+    return args
 
 
 def main():
-    micropython_dir, destination_dir = process_cmdline_args()
-    mpy_lib_dir = f"{micropython_dir}/lib/micropython-lib"
+    args = process_cmdline_args()
+    mpy_lib_dir = f"{args.micropython}/lib/micropython-lib"
 
     manifest = manifestfile.ManifestFile(
         manifestfile.MODE_FREEZE, {"MPY_LIB_DIR": mpy_lib_dir}
     )
 
-    for library, is_ffi in get_all_libraries(mpy_lib_dir):
-        manifest.require(library, unix_ffi=is_ffi)
+    if args.ffi:
+        manifest.add_library("unix-ffi", os.path.join("$(MPY_LIB_DIR)", "unix-ffi"),
+                             prepend=True)
 
-    copy_libraries(manifest, destination_dir)
+    for library, is_ffi in get_all_libraries(mpy_lib_dir):
+        if args.ffi or not is_ffi:
+            manifest.require(library)
+    copy_libraries(manifest, args.destination)
 
 
 main()
diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index bbfde0e89f..84a74b2d21 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  bb3ba34848a7620663b6a7cba22af45d3056fc79328c2ceb943874b5478d8756  micropython-1.22.2.tar.xz
-sha256  fe63a3fbd0731f6530e0783224763bceef972e516cab4b8513ca4d7b05be9713  LICENSE
+sha256  4e43c59657b8da33b4bc503509a827cc3ea6cb66c446475c57776cf4467ba215  micropython-1.28.0.tar.xz
+sha256  c7273a4675e28b40547b4814bf68da41954632ebbc38b3fff69f22d69850f690  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 826247069e..044714451c 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.22.2
+MICROPYTHON_VERSION = 1.28.0
 MICROPYTHON_SITE = https://micropython.org/resources/source
 MICROPYTHON_SOURCE = micropython-$(MICROPYTHON_VERSION).tar.xz
 # Micropython has a lot of code copied from other projects, and also a number
@@ -29,13 +29,6 @@ ifeq ($(BR2_xtensa),y)
 MICROPYTHON_CFLAGS += -DMICROPY_NLR_SETJMP=1
 endif
 
-# https://github.com/micropython/micropython/issues/14115
-# Temporary fix for GCC 14 compatibility, should be removed after updating to
-# 1.23.0 or later.
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_14),y)
-MICROPYTHON_CFLAGS += -DMICROPY_NLR_SETJMP=1
-endif
-
 # When building from a tarball we don't have some of the dependencies that are in
 # the git repository as submodules
 MICROPYTHON_MAKE_OPTS += \
@@ -46,6 +39,7 @@ MICROPYTHON_MAKE_OPTS += \
 	LDFLAGS_EXTRA="$(TARGET_LDFLAGS)" \
 	CWARN=
 
+# Support libffi in MicroPython itself; separate from unix-ffi libraries
 ifeq ($(BR2_PACKAGE_LIBFFI),y)
 MICROPYTHON_DEPENDENCIES += host-pkgconf libffi
 MICROPYTHON_MAKE_OPTS += MICROPY_PY_FFI=1
@@ -71,7 +65,8 @@ ifeq ($(BR2_PACKAGE_MICROPYTHON_LIB),y)
 define MICROPYTHON_COLLECT_LIBS
 	$(EXTRA_ENV) PYTHONPATH=$(@D)/tools \
 		package/micropython/collect_micropython_lib.py \
-		$(@D) $(@D)/.built_pylib
+		$(@D) $(@D)/.built_pylib \
+		$(if $(BR2_PACKAGE_MICROPYTHON_LIB_UNIXFFI),--ffi,--no-ffi)
 endef
 
 define MICROPYTHON_INSTALL_LIBS

--===============2062498970609891525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2062498970609891525==--
