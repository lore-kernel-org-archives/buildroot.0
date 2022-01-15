Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4678C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 14:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81AD640502;
	Sat, 15 Jan 2022 14:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgfKbOL9JVTw; Sat, 15 Jan 2022 14:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D357B404ED;
	Sat, 15 Jan 2022 14:40:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F65A1BF293
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BFCD4032A
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ef22z8sEBpa8 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 14:40:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 789DF4089D
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 14:40:41 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso11398598wmd.5
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 06:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s2Gz8AXil4XlpTUo6TORf2YsFCnRKStX1l//ntqeZ9I=;
 b=GNXVoFAbwtQ4mN7qLUrmr1uxqLY645A6jgYZekxlS7+qSdH1j1xYKAY8QSHP6rD6Tk
 Ds9t7dnlrl+7L6ipuDUqI9okvkqvVxVMuqHyeORbtv8EQ7UeTfBrFvp8UwZ2AM4waYzk
 BIFu+x4rW3LFPsv+dTvvzrpT7N6RKewr0dU+eTEyANI8O766dPeyWDtl8Cb04C/Tf9iV
 x26iz84uypcLxm/bQoVbQZJoZXKu96/ynoQXvpFDEJsSklws3mF5D24OacupjV0h33jT
 Mui9kshT+r1yzvBlC/wiqeyJ42zzGZvE4dumkdB8Rwoy4FjTKPZ0Sa6iPAEQC7gvkwW+
 8RjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s2Gz8AXil4XlpTUo6TORf2YsFCnRKStX1l//ntqeZ9I=;
 b=1z53tp15G0UG4tegCOY02Xggh/5nMtUEdyDmtvUQiyhfQ+g6MLnK9GPrm3KCZBS7hO
 GmG22mBYwaYUojdF1tPIO9/tDrgGOvCU8rD/RmLID2nwG3JckEUccKYEVeLV3gL35hAh
 rW62QqtCLzaMN0y2tTS15d26jIcmAFS7CPcTWHi7dupuI4YSNRsb2vBXPnDXw/neb0uh
 7y8iP1RZ/H13pBlToLAYL9x8AzWNPKf1H+iZbQw3wP9tDi0b/Zs2vMP573zxPVgPvJRC
 TXD6yskPAlPa5DMzKc1/RlpUEsPBgxxfOFTWWG8qIU1SGvkuFQqMGWOhV5OvRras+wxE
 vYOg==
X-Gm-Message-State: AOAM531X8bpMnyG1+F9EWWA68vFKwPrsjh6GXts+cK4fP7UZsKE8Glp1
 aUbZXZPqwp8zuoze48WbRAxsqs3LyEU=
X-Google-Smtp-Source: ABdhPJxD0t27RN02M/0ePCq5f7mwxMzPuluRhTpdvfpa8O5cn+xb6+zvVcs3V07SuvyObNadRZx6bw==
X-Received: by 2002:adf:d1c9:: with SMTP id b9mr12373923wrd.560.1642257639340; 
 Sat, 15 Jan 2022 06:40:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id l9sm8321857wro.16.2022.01.15.06.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 06:40:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 15:39:00 +0100
Message-Id: <20220115143900.2033727-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: bump to version 9.55.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- Disable pdf which fails to build and was added by
  https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=316c3a08269212f1005709da64efcb383f8f5ce0
- Update hash of license file (references on ETS related patents removed
  with
  https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=431167121968b066d90b0506347b6eb779e08a3f)

https://www.ghostscript.com/doc/9.54.0/News.htm
https://www.ghostscript.com/doc/9.55.0/News.htm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...05-Fix-typo-in-non-forked-lcms2-code.patch |  28 +++
 ...g-702985-drop-use-of-FT_CALLBACK_DEF.patch |  55 ----
 ...de-device-specifier-strings-in-acces.patch | 234 ------------------
 ...ack-limits-after-function-evaluation.patch |  52 ----
 ...-management-in-sampled_data_continue.patch |  68 -----
 package/ghostscript/ghostscript.hash          |   6 +-
 package/ghostscript/ghostscript.mk            |  12 +-
 7 files changed, 33 insertions(+), 422 deletions(-)
 create mode 100644 package/ghostscript/0001-Bug-704405-Fix-typo-in-non-forked-lcms2-code.patch
 delete mode 100644 package/ghostscript/0001-bug-702985-drop-use-of-FT_CALLBACK_DEF.patch
 delete mode 100644 package/ghostscript/0002-Bug-704342-Include-device-specifier-strings-in-acces.patch
 delete mode 100644 package/ghostscript/0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch
 delete mode 100644 package/ghostscript/0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch

diff --git a/package/ghostscript/0001-Bug-704405-Fix-typo-in-non-forked-lcms2-code.patch b/package/ghostscript/0001-Bug-704405-Fix-typo-in-non-forked-lcms2-code.patch
new file mode 100644
index 0000000000..bb1227f687
--- /dev/null
+++ b/package/ghostscript/0001-Bug-704405-Fix-typo-in-non-forked-lcms2-code.patch
@@ -0,0 +1,28 @@
+From 830afae5454dea3bff903869d82022306890a96c Mon Sep 17 00:00:00 2001
+From: Robin Watts <Robin.Watts@artifex.com>
+Date: Fri, 1 Oct 2021 12:44:44 +0100
+Subject: [PATCH] Bug 704405: Fix typo in non-forked lcms2 code.
+
+[Retrieved from:
+https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=830afae5454dea3bff903869d82022306890a96c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ base/gsicc_lcms2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/base/gsicc_lcms2.c b/base/gsicc_lcms2.c
+index ccf1d7051..9badb6dee 100644
+--- a/base/gsicc_lcms2.c
++++ b/base/gsicc_lcms2.c
+@@ -462,7 +462,7 @@ int
+ gscms_transform_color(gx_device *dev, gsicc_link_t *icclink, void *inputcolor,
+                              void *outputcolor, int num_bytes)
+ {
+-    return gscms_transformm_color_const(dev, icclink, inputcolor, outputcolor, num_bytes);
++    return gscms_transform_color_const(dev, icclink, inputcolor, outputcolor, num_bytes);
+ }
+ 
+ int
+-- 
+2.25.1
+
diff --git a/package/ghostscript/0001-bug-702985-drop-use-of-FT_CALLBACK_DEF.patch b/package/ghostscript/0001-bug-702985-drop-use-of-FT_CALLBACK_DEF.patch
deleted file mode 100644
index 044dcc72f1..0000000000
--- a/package/ghostscript/0001-bug-702985-drop-use-of-FT_CALLBACK_DEF.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 41ef9a0bc36b9db7115fbe9623f989bfb47bbade Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Tue, 20 Oct 2020 09:49:45 +0100
-Subject: [PATCH] Bug 702985: drop use of FT_CALLBACK_DEF() def
-
-From 2.10.3, Freetype disappeared the FT_CALLBACK_DEF() macro, which is what
-we used when defining our callbacks from Freetype.
-
-No guidance forthcoming from the Freetype developer who made those changes,
-so change to explicitly declaring the callbacks file static.
-
-Should fix the reported build failures.
-
-Downloaded from upstream commit:
-https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=41ef9a0bc36b
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- base/fapi_ft.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/base/fapi_ft.c b/base/fapi_ft.c
-index 65fa6dcf4..21aef2f06 100644
---- a/base/fapi_ft.c
-+++ b/base/fapi_ft.c
-@@ -125,7 +125,7 @@ static void
- delete_inc_int_info(gs_fapi_server * a_server,
-                     FT_IncrementalRec * a_inc_int_info);
- 
--FT_CALLBACK_DEF(void *)
-+static void *
- FF_alloc(FT_Memory memory, long size)
- {
-     gs_memory_t *mem = (gs_memory_t *) memory->user;
-@@ -133,7 +133,7 @@ FF_alloc(FT_Memory memory, long size)
-     return (gs_malloc(mem, size, 1, "FF_alloc"));
- }
- 
--FT_CALLBACK_DEF(void *)
-+static void *
-     FF_realloc(FT_Memory memory, long cur_size, long new_size, void *block)
- {
-     gs_memory_t *mem = (gs_memory_t *) memory->user;
-@@ -153,7 +153,7 @@ FT_CALLBACK_DEF(void *)
-     return (tmp);
- }
- 
--FT_CALLBACK_DEF(void)
-+static void
-     FF_free(FT_Memory memory, void *block)
- {
-     gs_memory_t *mem = (gs_memory_t *) memory->user;
--- 
-2.17.1
-
diff --git a/package/ghostscript/0002-Bug-704342-Include-device-specifier-strings-in-acces.patch b/package/ghostscript/0002-Bug-704342-Include-device-specifier-strings-in-acces.patch
deleted file mode 100644
index 81436d8228..0000000000
--- a/package/ghostscript/0002-Bug-704342-Include-device-specifier-strings-in-acces.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-From a9bd3dec9fde03327a4a2c69dad1036bf9632e20 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Tue, 7 Sep 2021 20:36:12 +0100
-Subject: [PATCH] Bug 704342: Include device specifier strings in access
- validation
-
-for the "%pipe%", %handle%" and %printer% io devices.
-
-We previously validated only the part after the "%pipe%" Postscript device
-specifier, but this proved insufficient.
-
-This rebuilds the original file name string, and validates it complete. The
-slight complication for "%pipe%" is it can be reached implicitly using
-"|" so we have to check both prefixes.
-
-Addresses CVE-2021-3781
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- base/gdevpipe.c | 22 +++++++++++++++-
- base/gp_mshdl.c | 11 +++++++-
- base/gp_msprn.c | 10 ++++++-
- base/gp_os2pr.c | 13 +++++++++-
- base/gslibctx.c | 69 ++++++++++---------------------------------------
- 5 files changed, 65 insertions(+), 60 deletions(-)
-
-diff --git a/base/gdevpipe.c b/base/gdevpipe.c
-index 96d71f5d8..5bdc485be 100644
---- a/base/gdevpipe.c
-+++ b/base/gdevpipe.c
-@@ -72,8 +72,28 @@ pipe_fopen(gx_io_device * iodev, const char *fname, const char *access,
- #else
-     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
-     gs_fs_list_t *fs = ctx->core->fs;
-+    /* The pipe device can be reached in two ways, explicltly with %pipe%
-+       or implicitly with "|", so we have to check for both
-+     */
-+    char f[gp_file_name_sizeof];
-+    const char *pipestr = "|";
-+    const size_t pipestrlen = strlen(pipestr);
-+    const size_t preflen = strlen(iodev->dname);
-+    const size_t nlen = strlen(fname);
-+    int code1;
-+
-+    if (preflen + nlen >= gp_file_name_sizeof)
-+        return_error(gs_error_invalidaccess);
-+
-+    memcpy(f, iodev->dname, preflen);
-+    memcpy(f + preflen, fname, nlen + 1);
-+
-+    code1 = gp_validate_path(mem, f, access);
-+
-+    memcpy(f, pipestr, pipestrlen);
-+    memcpy(f + pipestrlen, fname, nlen + 1);
- 
--    if (gp_validate_path(mem, fname, access) != 0)
-+    if (code1 != 0 && gp_validate_path(mem, f, access) != 0 )
-         return gs_error_invalidfileaccess;
- 
-     /*
-diff --git a/base/gp_mshdl.c b/base/gp_mshdl.c
-index 2b964ed74..8d87ceadc 100644
---- a/base/gp_mshdl.c
-+++ b/base/gp_mshdl.c
-@@ -95,8 +95,17 @@ mswin_handle_fopen(gx_io_device * iodev, const char *fname, const char *access,
-     long hfile;	/* Correct for Win32, may be wrong for Win64 */
-     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
-     gs_fs_list_t *fs = ctx->core->fs;
-+    char f[gp_file_name_sizeof];
-+    const size_t preflen = strlen(iodev->dname);
-+    const size_t nlen = strlen(fname);
- 
--    if (gp_validate_path(mem, fname, access) != 0)
-+    if (preflen + nlen >= gp_file_name_sizeof)
-+        return_error(gs_error_invalidaccess);
-+
-+    memcpy(f, iodev->dname, preflen);
-+    memcpy(f + preflen, fname, nlen + 1);
-+
-+    if (gp_validate_path(mem, f, access) != 0)
-         return gs_error_invalidfileaccess;
- 
-     /* First we try the open_handle method. */
-diff --git a/base/gp_msprn.c b/base/gp_msprn.c
-index ed4827968..746a974f7 100644
---- a/base/gp_msprn.c
-+++ b/base/gp_msprn.c
-@@ -168,8 +168,16 @@ mswin_printer_fopen(gx_io_device * iodev, const char *fname, const char *access,
-     uintptr_t *ptid = &((tid_t *)(iodev->state))->tid;
-     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
-     gs_fs_list_t *fs = ctx->core->fs;
-+    const size_t preflen = strlen(iodev->dname);
-+    const size_t nlen = strlen(fname);
- 
--    if (gp_validate_path(mem, fname, access) != 0)
-+    if (preflen + nlen >= gp_file_name_sizeof)
-+        return_error(gs_error_invalidaccess);
-+
-+    memcpy(pname, iodev->dname, preflen);
-+    memcpy(pname + preflen, fname, nlen + 1);
-+
-+    if (gp_validate_path(mem, pname, access) != 0)
-         return gs_error_invalidfileaccess;
- 
-     /* First we try the open_printer method. */
-diff --git a/base/gp_os2pr.c b/base/gp_os2pr.c
-index f852c71fc..ba54cde66 100644
---- a/base/gp_os2pr.c
-+++ b/base/gp_os2pr.c
-@@ -107,9 +107,20 @@ os2_printer_fopen(gx_io_device * iodev, const char *fname, const char *access,
-            FILE ** pfile, char *rfname, uint rnamelen)
- {
-     os2_printer_t *pr = (os2_printer_t *)iodev->state;
--    char driver_name[256];
-+    char driver_name[gp_file_name_sizeof];
-     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
-     gs_fs_list_t *fs = ctx->core->fs;
-+    const size_t preflen = strlen(iodev->dname);
-+    const int size_t = strlen(fname);
-+
-+    if (preflen + nlen >= gp_file_name_sizeof)
-+        return_error(gs_error_invalidaccess);
-+
-+    memcpy(driver_name, iodev->dname, preflen);
-+    memcpy(driver_name + preflen, fname, nlen + 1);
-+
-+    if (gp_validate_path(mem, driver_name, access) != 0)
-+        return gs_error_invalidfileaccess;
- 
-     /* First we try the open_printer method. */
-     /* Note that the loop condition here ensures we don't
-diff --git a/base/gslibctx.c b/base/gslibctx.c
-index 6dfed6cd5..318039fad 100644
---- a/base/gslibctx.c
-+++ b/base/gslibctx.c
-@@ -655,82 +655,39 @@ rewrite_percent_specifiers(char *s)
- int
- gs_add_outputfile_control_path(gs_memory_t *mem, const char *fname)
- {
--    char *fp, f[gp_file_name_sizeof];
--    const int pipe = 124; /* ASCII code for '|' */
--    const int len = strlen(fname);
--    int i, code;
-+    char f[gp_file_name_sizeof];
-+    int code;
- 
-     /* Be sure the string copy will fit */
--    if (len >= gp_file_name_sizeof)
-+    if (strlen(fname) >= gp_file_name_sizeof)
-         return gs_error_rangecheck;
-     strcpy(f, fname);
--    fp = f;
-     /* Try to rewrite any %d (or similar) in the string */
-     rewrite_percent_specifiers(f);
--    for (i = 0; i < len; i++) {
--        if (f[i] == pipe) {
--           fp = &f[i + 1];
--           /* Because we potentially have to check file permissions at two levels
--              for the output file (gx_device_open_output_file and the low level
--              fopen API, if we're using a pipe, we have to add both the full string,
--              (including the '|', and just the command to which we pipe - since at
--              the pipe_fopen(), the leading '|' has been stripped.
--            */
--           code = gs_add_control_path(mem, gs_permit_file_writing, f);
--           if (code < 0)
--               return code;
--           code = gs_add_control_path(mem, gs_permit_file_control, f);
--           if (code < 0)
--               return code;
--           break;
--        }
--        if (!IS_WHITESPACE(f[i]))
--            break;
--    }
--    code = gs_add_control_path(mem, gs_permit_file_control, fp);
-+
-+    code = gs_add_control_path(mem, gs_permit_file_control, f);
-     if (code < 0)
-         return code;
--    return gs_add_control_path(mem, gs_permit_file_writing, fp);
-+    return gs_add_control_path(mem, gs_permit_file_writing, f);
- }
- 
- int
- gs_remove_outputfile_control_path(gs_memory_t *mem, const char *fname)
- {
--    char *fp, f[gp_file_name_sizeof];
--    const int pipe = 124; /* ASCII code for '|' */
--    const int len = strlen(fname);
--    int i, code;
-+    char f[gp_file_name_sizeof];
-+    int code;
- 
-     /* Be sure the string copy will fit */
--    if (len >= gp_file_name_sizeof)
-+    if (strlen(fname) >= gp_file_name_sizeof)
-         return gs_error_rangecheck;
-     strcpy(f, fname);
--    fp = f;
-     /* Try to rewrite any %d (or similar) in the string */
--    for (i = 0; i < len; i++) {
--        if (f[i] == pipe) {
--           fp = &f[i + 1];
--           /* Because we potentially have to check file permissions at two levels
--              for the output file (gx_device_open_output_file and the low level
--              fopen API, if we're using a pipe, we have to add both the full string,
--              (including the '|', and just the command to which we pipe - since at
--              the pipe_fopen(), the leading '|' has been stripped.
--            */
--           code = gs_remove_control_path(mem, gs_permit_file_writing, f);
--           if (code < 0)
--               return code;
--           code = gs_remove_control_path(mem, gs_permit_file_control, f);
--           if (code < 0)
--               return code;
--           break;
--        }
--        if (!IS_WHITESPACE(f[i]))
--            break;
--    }
--    code = gs_remove_control_path(mem, gs_permit_file_control, fp);
-+    rewrite_percent_specifiers(f);
-+
-+    code = gs_remove_control_path(mem, gs_permit_file_control, f);
-     if (code < 0)
-         return code;
--    return gs_remove_control_path(mem, gs_permit_file_writing, fp);
-+    return gs_remove_control_path(mem, gs_permit_file_writing, f);
- }
- 
- int
--- 
-2.20.1
-
diff --git a/package/ghostscript/0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch b/package/ghostscript/0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch
deleted file mode 100644
index 352f1754f6..0000000000
--- a/package/ghostscript/0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 7861fcad13c497728189feafb41cd57b5b50ea25 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Fri, 12 Feb 2021 10:34:23 +0000
-Subject: [PATCH] oss-fuzz 30715: Check stack limits after function evaluation.
-
-During function result sampling, after the callout to the Postscript
-interpreter, make sure there is enough stack space available before pushing
-or popping entries.
-
-In thise case, the Postscript procedure for the "function" is totally invalid
-(as a function), and leaves the op stack in an unrecoverable state (as far as
-function evaluation is concerned). We end up popping more entries off the
-stack than are available.
-
-To cope, add in stack limit checking to throw an appropriate error when this
-happens.
-
-[Retrieved from:
-https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=7861fcad13c497728189feafb41cd57b5b50ea25]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- psi/zfsample.c | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/psi/zfsample.c b/psi/zfsample.c
-index 290809405..652ae02c6 100644
---- a/psi/zfsample.c
-+++ b/psi/zfsample.c
-@@ -551,9 +551,17 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
-     } else {
-         if (stack_depth_adjust) {
-             stack_depth_adjust -= num_out;
--            push(O_STACK_PAD - stack_depth_adjust);
--            for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
--                make_null(op - i);
-+            if ((O_STACK_PAD - stack_depth_adjust) < 0) {
-+                stack_depth_adjust = -(O_STACK_PAD - stack_depth_adjust);
-+                check_op(stack_depth_adjust);
-+                pop(stack_depth_adjust);
-+            }
-+            else {
-+                check_ostack(O_STACK_PAD - stack_depth_adjust);
-+                push(O_STACK_PAD - stack_depth_adjust);
-+                for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
-+                    make_null(op - i);
-+            }
-         }
-     }
- 
--- 
-2.25.1
-
diff --git a/package/ghostscript/0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch b/package/ghostscript/0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch
deleted file mode 100644
index 72e07df0ac..0000000000
--- a/package/ghostscript/0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 2a3129365d3bc0d4a41f107ef175920d1505d1f7 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Tue, 1 Jun 2021 19:57:16 +0100
-Subject: [PATCH] Bug 703902: Fix op stack management in
- sampled_data_continue()
-
-Replace pop() (which does no checking, and doesn't handle stack extension
-blocks) with ref_stack_pop() which does do all that.
-
-We still use pop() in one case (it's faster), but we have to later use
-ref_stack_pop() before calling sampled_data_sample() which also accesses the
-op stack.
-
-Fixes:
-https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=34675
-
-[Retrieved from:
-https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=2a3129365d3bc0d4a41f107ef175920d1505d1f7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- psi/zfsample.c | 16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/psi/zfsample.c b/psi/zfsample.c
-index 0e8e4bc8d..00cd0cfdd 100644
---- a/psi/zfsample.c
-+++ b/psi/zfsample.c
-@@ -533,15 +533,19 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
-         for (j = 0; j < bps; j++)
-             data_ptr[bps * i + j] = (byte)(cv >> ((bps - 1 - j) * 8));	/* MSB first */
-     }
--    pop(num_out);		    /* Move op to base of result values */
- 
--    /* Check if we are done collecting data. */
-+    pop(num_out); /* Move op to base of result values */
- 
-+    /* From here on, we have to use ref_stack_pop() rather than pop()
-+       so that it handles stack extension blocks properly, before calling
-+       sampled_data_sample() which also uses the op stack.
-+     */
-+    /* Check if we are done collecting data. */
-     if (increment_cube_indexes(params, penum->indexes)) {
-         if (stack_depth_adjust == 0)
--            pop(O_STACK_PAD);	    /* Remove spare stack space */
-+            ref_stack_pop(&o_stack, O_STACK_PAD);	    /* Remove spare stack space */
-         else
--            pop(stack_depth_adjust - num_out);
-+            ref_stack_pop(&o_stack, stack_depth_adjust - num_out);
-         /* Execute the closing procedure, if given */
-         code = 0;
-         if (esp_finish_proc != 0)
-@@ -554,11 +558,11 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
-             if ((O_STACK_PAD - stack_depth_adjust) < 0) {
-                 stack_depth_adjust = -(O_STACK_PAD - stack_depth_adjust);
-                 check_op(stack_depth_adjust);
--                pop(stack_depth_adjust);
-+                ref_stack_pop(&o_stack, stack_depth_adjust);
-             }
-             else {
-                 check_ostack(O_STACK_PAD - stack_depth_adjust);
--                push(O_STACK_PAD - stack_depth_adjust);
-+                ref_stack_push(&o_stack, O_STACK_PAD - stack_depth_adjust);
-                 for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
-                     make_null(op - i);
-             }
--- 
-2.25.1
-
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index f6cedc6198..95305a5e06 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9533/SHA512SUMS
-sha512  c142ef9d83896aa8fd18c8e412220fe8f4950614be00d327d27ab051fe85e16524bf2ee00f46c2aca7a352ce47bc3acf2c4de0f7bbea7e4c55474b8af6cdc0a6  ghostscript-9.53.3.tar.gz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9550/SHA512SUMS
+sha512  3646b7981dced443559ba97c74c08463139e86a5479661e4dcd217c51e3f8e766da9cf4d7889a98ba3c079a17e9e5b452cc765b633e0720deab2337e77efdd09  ghostscript-9.55.0.tar.gz
 
 # Hash for license file:
-sha256  6f852249f975287b3efd43a5883875e47fa9f3125e2f1b18b5c09517ac30ecf2  LICENSE
+sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 9e13f29fe9..24a0c489a8 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.53.3
+GHOSTSCRIPT_VERSION = 9.55.0
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
@@ -21,15 +21,6 @@ GHOSTSCRIPT_DEPENDENCIES = \
 	libpng \
 	tiff
 
-# 0002-Bug-704342-Include-device-specifier-strings-in-acces.patch
-GHOSTSCRIPT_IGNORE_CVES += CVE-2021-3781
-
-# 0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch
-GHOSTSCRIPT_IGNORE_CVES += CVE-2021-45944
-
-# 0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch
-GHOSTSCRIPT_IGNORE_CVES += CVE-2021-45949
-
 # Ghostscript includes (old) copies of several libraries, delete them.
 # Inspired by linuxfromscratch:
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
@@ -52,6 +43,7 @@ GHOSTSCRIPT_CONF_OPTS = \
 	--enable-freetype \
 	--disable-gtk \
 	--without-libpaper \
+	--without-pdf \
 	--with-system-libtiff
 
 ifeq ($(BR2_PACKAGE_JBIG2DEC),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
