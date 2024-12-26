Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AD8C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83F034F22F;
	Fri, 28 Feb 2025 16:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMJCDn8_voLt; Fri, 28 Feb 2025 16:43:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D6AD4F9B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D6AD4F9B9;
	Fri, 28 Feb 2025 16:43:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30CC068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1C6F42CEE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltQvoZKrrD8R for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 174DC419C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 174DC419C5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11E6A8350A; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 26 Dec 2024 23:18:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b3ddad3d5199fe2443b20a562aac41fa1fc70529
X-Git-Newrev: 3f37b67025dcd43f4b3e9279a87646e6a79c3aa1
X-Patchwork-Hint: ignore
Message-Id: <20250228162946.11E6A8350A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cifs-utils: bump to
 version 7.1
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3852246387721680625=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3852246387721680625==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3f37b67025dcd43f4b3e9279a87646e6a79c3aa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

From https://wiki.samba.org/index.php/LinuxCIFS_utils:

- October, 2024: Release 7.1
  LDAP Ping capability
  smbinfo adds gettconinfo command
  Various improvements to man pages
  https://lists.samba.org/archive/samba-technical/2024-October/139146.html
- August, 2022: Release 7.0
  Add GSS-Proxy support
  https://lists.samba.org/archive/samba-technical/2022-August/137528.html

Note: 7.0 was the release immediately after the 6.15 currently in
Buildroot.

One notable change is that this version 7.1 makes libtalloc a
mandatory dependency. Also, a small patch, submitted upstream, is
added to fix the build with musl due to a missing header include.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ap_ping.c-add-missing-sys-types.h-include.patch | 38 ++++++++++++++++++++++
 package/cifs-utils/Config.in                       |  8 ++++-
 package/cifs-utils/cifs-utils.hash                 |  2 +-
 package/cifs-utils/cifs-utils.mk                   |  4 +--
 4 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/package/cifs-utils/0001-cldap_ping.c-add-missing-sys-types.h-include.patch b/package/cifs-utils/0001-cldap_ping.c-add-missing-sys-types.h-include.patch
new file mode 100644
index 0000000000..bf7864e01a
--- /dev/null
+++ b/package/cifs-utils/0001-cldap_ping.c-add-missing-sys-types.h-include.patch
@@ -0,0 +1,38 @@
+From 62297e906149f9d2ca7b187a60f7c5ab99ef5dd5 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 26 Dec 2024 21:39:05 +0100
+Subject: [PATCH] cldap_ping.c: add missing <sys/types.h> include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+cldap_ping.c: In function ‘read_dns_string’:
+cldap_ping.c:72:37: error: ‘u_char’ undeclared (first use in this function)
+
+when building with the musl C library, but even with glibc u_char is
+defined in <sys/types.h>, it happens to work with glibc <sys/types.h>
+gets included by another header.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://lore.kernel.org/linux-cifs/20241226204235.2311371-1-thomas.petazzoni@bootlin.com/
+---
+ cldap_ping.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cldap_ping.c b/cldap_ping.c
+index 9183b27..a603be3 100644
+--- a/cldap_ping.c
++++ b/cldap_ping.c
+@@ -20,6 +20,7 @@
+ #include <talloc.h>
+ #include <string.h>
+ #include <sys/socket.h>
++#include <sys/types.h>
+ #include <arpa/inet.h>
+ #include <unistd.h>
+ #include <resolv.h>
+-- 
+2.47.0
+
diff --git a/package/cifs-utils/Config.in b/package/cifs-utils/Config.in
index d1b1406a3e..6813e3637d 100644
--- a/package/cifs-utils/Config.in
+++ b/package/cifs-utils/Config.in
@@ -1,7 +1,13 @@
+comment "cifs-utils needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_CIFS_UTILS
 	bool "cifs-utils"
-	# uses fork()
+	# uses fork(), libtalloc
 	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS # libtalloc
+	select BR2_PACKAGE_LIBTALLOC
 	help
 	  The in-kernel CIFS filesystem is generally the preferred
 	  method for mounting SMB/CIFS shares on Linux. The in-kernel
diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index ec6ea55961..942f8aaa39 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  a7b6940e93250c1676a6fa66b6ead91b78cd43a5fee99cc462459c8b9cf1e6f4  cifs-utils-6.15.tar.bz2
+sha256  a21123f76a4a6a36c9653189ba4918ebdf3cfcd3f9092730a47ff3450b5b5b2a  cifs-utils-7.1.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index edf08d4b4d..e8eefde275 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.15
+CIFS_UTILS_VERSION = 7.1
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
@@ -12,7 +12,7 @@ CIFS_UTILS_LICENSE_FILES = COPYING
 CIFS_UTILS_CPE_ID_VENDOR = samba
 # Missing install-sh in release tarball
 CIFS_UTILS_AUTORECONF = YES
-CIFS_UTILS_DEPENDENCIES = host-pkgconf
+CIFS_UTILS_DEPENDENCIES = host-pkgconf libtalloc
 
 # Let's disable PIE unconditionally. We want PIE to be enabled only by
 # the global BR2_RELRO_FULL option.

--===============3852246387721680625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3852246387721680625==--
