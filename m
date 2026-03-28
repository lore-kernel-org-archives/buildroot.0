Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8FE10F3DD9
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 11:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D03D8610FE;
	Sat, 28 Mar 2026 11:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGSbcqVhOaos; Sat, 28 Mar 2026 11:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E95CD610F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774699127;
	bh=6XrK8ECQS4tuIHsxECOa8bbzrWZvOkqwqrwiAkMdyAg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sUnZBh866UFQL2/MJSDJibrt5EkF452oF/k57AqEtrVnPR+Wq+4ikLU7UO9GNPeCv
	 +eqsSKEJ0bikkZzIOFH5QS2Jh+wy0PG5YsRX6/LjAvvOlyY68KgQhKluXXyAIQOVcC
	 A4GSbhC58kO4168BJKV9MxGo61w2RhzWFUMs+xa2Ot5Q7d56mzBD2KjNd520NtW9qX
	 E2OYCKup0v2GVWA8NhtHnBIpE70ghvkD+PpaDv90FWGZlUYAJAeNx41tccsYOKMDqp
	 fPXPUm3HbykFyVFH8vUmmuEoCs9ThqDfTOGnDnzjJvfUCb+s8NR/emFx9TDRGfn7PN
	 zOC8BsrEptKhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E95CD610F5;
	Sat, 28 Mar 2026 11:58:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7504210F
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 11:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 674D74135F
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 11:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efdEttxUuPa4 for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 11:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47BB541348
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47BB541348
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 11:58:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 811907FCE7; Sat, 28 Mar 2026 11:58:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Mar 2026 12:05:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcbae423d36e92503056682b40b815d51462e782
X-Git-Newrev: d848e83a32faf8a99a8ae26e85de9f32f215d02e
X-Patchwork-Hint: ignore
Message-Id: <20260328115843.811907FCE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.24.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d848e83a32faf8a99a8ae26e85de9f32f215d02e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.samba.org/samba/history/samba-4.24.0.html

Removed patch 0002, its content is included in upstream commit
https://gitlab.com/samba-team/devel/samba/-/commit/50604bc027c3d053cafd803ff515e6da881e79a5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...ge_test.c-include-stdint.h-before-cmoka.h.patch | 40 ----------------------
 package/samba4/samba4.hash                         |  4 +--
 package/samba4/samba4.mk                           |  2 +-
 4 files changed, 3 insertions(+), 44 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 973ecfba89..8c64f9ce51 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -847,7 +847,6 @@ package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch lib_patch.Upstream
 package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch lib_patch.Upstream
-package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch lib_patch.Upstream
 package/samba4/S91smb Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/sane-backends/0001-sane_backend-add-missing-config.h.patch lib_patch.Upstream
 package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch lib_patch.Upstream
diff --git a/package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch b/package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
deleted file mode 100644
index e63f43c290..0000000000
--- a/package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b2ea5dc3639d68b878c6534f4992da446dbbf2d4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 16 May 2020 18:15:38 +0200
-Subject: [PATCH] ldap_message_test.c: include stdint.h before cmoka.h
-
-This fix the following build failure on uclibc:
-
-In file included from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/include/stdint.h:9:0,
-                 from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/inttypes.h:27,
-                 from ../../lib/replace/../replace/replace.h:64,
-                 from ../../source4/include/includes.h:23,
-                 from ../../libcli/ldap/tests/ldap_message_test.c:41:
-/home/giuliobenetti/autobuild/run/instance-1/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:122:27: error: conflicting types for 'uintptr_t'
- typedef unsigned long int uintptr_t;
-                           ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/09e84d15efe755bdefa9f8c6b8355c49ddbc2f65
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
----
- libcli/ldap/tests/ldap_message_test.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libcli/ldap/tests/ldap_message_test.c b/libcli/ldap/tests/ldap_message_test.c
-index c5aacd4bc6b..51331e5c600 100644
---- a/libcli/ldap/tests/ldap_message_test.c
-+++ b/libcli/ldap/tests/ldap_message_test.c
-@@ -34,6 +34,7 @@
-  */
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
--- 
-2.26.2
-
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 84ada82bfd..d9bb2eac01 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.6.tar.asc
-sha256  e3dabd8b5e42dc97669fa0faef032510a94e496b58f7067082e5036d88f0e702  samba-4.23.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.0.tar.asc
+sha256  1b1e457fd651a612cd08226cc6efd04e5d01e36d918c8b4c4e470e74e86881ea  samba-4.24.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 2631f2dcad..e5d73a43ef 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.6
+SAMBA4_VERSION = 4.24.0
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
