Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DC3C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BD24409F7;
	Tue,  1 Feb 2022 22:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tx-H1Qr8p_fM; Tue,  1 Feb 2022 22:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33ECB40304;
	Tue,  1 Feb 2022 22:29:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53D761BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EC9A400CE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pugt7SRd2H1c for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:29:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96C2C400CC
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:29:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k18so34803679wrg.11
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 14:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BgV/mqK7uBtKsgEQACAkdFdgBK8DUV1EIEzVW9M7p4Q=;
 b=pX8zktbSYFoSzdSlmcGDxHWr9Z3tksKCru37HKbyGYq6M/MhhoXXEYj0wZTrwEjDX/
 xB48QOFj87scmEyomrUZOEiMd0qnC1+ard5aY7XyGNQVOUA2X6qOlGtAkrT59GjZvM3O
 RGlPo8PSH88jk/SoAYOU3JXfa0TJRdbZWLGW4ifqXPHtvHU0XNQneh6uSoyglH4L41HD
 24z7IG8T/fC3oC7s614tMwvjp4p62R5DEK/qenZSSm42x7PPG1YRf8OAbjUByf5WYVZw
 +sLGa0mBqCA4qn+inkohbRP2qBCsqah3ou2PO5N6qhtXkQYyKchaGVygJgYdy+cpndLv
 A0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BgV/mqK7uBtKsgEQACAkdFdgBK8DUV1EIEzVW9M7p4Q=;
 b=ZkKVAcyrSmNMSJZviD+iOPlOCjX5LUP1WAeVZGMdvy8SGDYg+9sKlBa6B/V7HvHFtC
 VtS4P2hJw/emGY7xMMbr9+J0qJUvEX0rgjtKuzGjW+6Ukd2mPuw9hrFlsNK0xgfS2kFW
 MXVg97lFIR7HCqm2uzLDaEIUnDtzWvH07KTl5AJ3h/q6UZpg+wKW6VguE9FElhKBf1d6
 WjeBtqinZPJY6HP1B4qeUmlkIle4x4GVOKe3uxRyywVmzVOGpcULwykhltAou+KdHOKA
 DzHb2+f5Qugryiibbd6sJspOPdu7iRhsDkIFcY5+IYyoBsJI6sJoUMGTGQ9kwSUAsc3l
 12Ig==
X-Gm-Message-State: AOAM532qmeYuMPEvSSGzHW0W/DRxrRy37ssM8c+VqqFYqoQNLLUCsIsx
 T1LLZh6zZjuGUIolukE507KlmYg4OFI=
X-Google-Smtp-Source: ABdhPJzb5B2LpWkoOgrZXJ/yDmDcU1n0CpbLvWGqO/ooNpqSddmduVexmVMgHlzG2XxugFbdafXjfg==
X-Received: by 2002:a5d:56cc:: with SMTP id m12mr23217069wrw.167.1643754585527; 
 Tue, 01 Feb 2022 14:29:45 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id i3sm15337722wru.33.2022.02.01.14.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 14:29:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 23:27:45 +0100
Message-Id: <20220201222745.411463-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/safeclib: bump to version 3.7.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version) and so autoreconf

https://github.com/rurban/safeclib/blob/v3.7.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gure.ac-add-disable-hardening-option.patch | 63 -------------------
 package/safeclib/safeclib.hash                |  4 +-
 package/safeclib/safeclib.mk                  |  6 +-
 3 files changed, 4 insertions(+), 69 deletions(-)
 delete mode 100644 package/safeclib/0001-configure.ac-add-disable-hardening-option.patch

diff --git a/package/safeclib/0001-configure.ac-add-disable-hardening-option.patch b/package/safeclib/0001-configure.ac-add-disable-hardening-option.patch
deleted file mode 100644
index e851fce993..0000000000
--- a/package/safeclib/0001-configure.ac-add-disable-hardening-option.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 94c612016834d7bdc2b721ff5f4f5e158bda6fdd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 8 Jan 2022 21:49:22 +0100
-Subject: [PATCH] configure.ac: add --disable-hardening option
-
-Allow the user to disable hardening which is enabled by default since
-version 02092020 and
-https://github.com/rurban/safeclib/commit/caa4408eb4a5c767f0474258af3b6ccf444e10aa
-to avoid the following build failure when the toolchain doesn't support
-stack-protector:
-
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: ../src/.libs/libsafec-3.6.0.a(safe_mem_constraint.o): in function `handle_mem_bos_chk_warn':
-safe_mem_constraint.c:(.text+0x40): undefined reference to `__stack_chk_guard'
-
-Fixes:
- - http://autobuild.buildroot.org/results/a481ee2d26a094358b0298617cce691be3077f22
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rurban/safeclib/pull/107]
----
- configure.ac | 27 +++++++++++++++++++--------
- 1 file changed, 19 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 55756b06..f852ed44 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -383,6 +383,21 @@ AC_ARG_ENABLE(debug-build,
- 	esac], [enable_debug_build=false ])
- AM_CONDITIONAL(ENABLE_DEBUG_BUILD, test "x$enable_debug_build" = "xtrue")
- 
-+AC_ARG_ENABLE(hardening,
-+	AS_HELP_STRING([--disable-hardening],
-+	               [disable hardening @<:@default=no@:>@]),
-+	[case "${enableval}" in
-+	yes) enable_hardening=true ;;
-+	no)  enable_hardening=false ;;
-+	*)   AC_MSG_ERROR([bad value ${enableval} for --enable-hardening]) ;;
-+	esac], [enable_hardening=true])
-+
-+if test "x$enable_hardening" = "xtrue" ; then
-+	AX_APPEND_COMPILE_FLAGS([-fstack-protector-strong -fstack-clash-protection -fcf-protection],
-+                         [WARN_CFLAGS],[$ax_ccf_err])
-+	AX_APPEND_LINK_FLAGS([-fstack-protector-strong -fstack-clash-protection -fcf-protection],
-+                         [WARN_LDFLAGS],[$ax_ccf_err])
-+fi
- 
- AC_MSG_NOTICE([Check programs])
- # ===============================================
-@@ -543,10 +562,6 @@ case $host_os in
-        [],[$ax_ccf_err])
-     ;;
- esac
--AX_APPEND_COMPILE_FLAGS([-fstack-protector-strong -fstack-clash-protection -fcf-protection],
--                         [WARN_CFLAGS],[$ax_ccf_err])
--AX_APPEND_LINK_FLAGS([-fstack-protector-strong -fstack-clash-protection -fcf-protection],
--                         [WARN_LDFLAGS],[$ax_ccf_err])
- 
- if test x$ax_cv_check_cflags__Wrestrict = xyes; then
-    AC_DEFINE([HAVE_WARNING_RESTRICT], 1, [Have -Wrestrict])
--- 
-2.34.1
-
diff --git a/package/safeclib/safeclib.hash b/package/safeclib/safeclib.hash
index af732f93fd..bca5d86261 100644
--- a/package/safeclib/safeclib.hash
+++ b/package/safeclib/safeclib.hash
@@ -1,5 +1,5 @@
-# From https://github.com/rurban/safeclib/releases/tag/v02092020
-sha256  d374bdcbfcdc4c9a76abed3707667372ca212fd87a369e7bcaaa54e716d27c0a  libsafec-02092020.tar.xz
+# From https://github.com/rurban/safeclib/releases/tag/v3.7.1
+sha256  71d3ec970f930bd980f2a41127228eeedfc53749e4c6b203329adc4ff7df32a7  safeclib-3.7.1.tar.xz
 
 # Hash for license file
 sha256  c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b  COPYING
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index 29ffea7f2e..91b3e26c68 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-SAFECLIB_VERSION = 02092020
+SAFECLIB_VERSION = 3.7.1
 SAFECLIB_SITE = \
 	https://github.com/rurban/safeclib/releases/download/v$(SAFECLIB_VERSION)
-SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).tar.xz
+SAFECLIB_SOURCE = safeclib-$(SAFECLIB_VERSION).tar.xz
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
-# We're patching configure.ac
-SAFECLIB_AUTORECONF = YES
 # -fstack-protector-strong is used by default. Disable that so the
 # BR2_SSP_* options in the toolchain wrapper are used instead
 SAFECLIB_CONF_OPTS = --disable-hardening
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
