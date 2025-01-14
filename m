Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE583C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 745E460598;
	Fri, 28 Feb 2025 16:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xuVjxSVwO41; Fri, 28 Feb 2025 16:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5551E6062F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5551E6062F;
	Fri, 28 Feb 2025 16:58:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03F131DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E43043EA2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obhBG0CC72-S for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D63D42DF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D63D42DF7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9558C8118C; Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 23:31:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b171b7bd78eacd277dafb82a8524cc224f97ba6b
X-Git-Newrev: 2eba7b1a97d9a0503defe667c25011cdfba7a7cd
X-Patchwork-Hint: ignore
Message-Id: <20250228163010.9558C8118C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/prelink-cross: remove
 package
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0293691040998844255=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0293691040998844255==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2eba7b1a97d9a0503defe667c25011cdfba7a7cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We are now using cross-ldd instead of prelink-cross, so we can drop
this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                |  1 -
 ...-tls.c-Fix-TLS-offsets-computation-for-s3.patch | 43 ---------------------
 ...002-src-execstack.c-fix-prelink_path-type.patch | 44 ----------------------
 package/prelink-cross/prelink-cross.hash           |  3 --
 package/prelink-cross/prelink-cross.mk             | 16 --------
 5 files changed, 107 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ee89f7e4bf..ab9c925002 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -996,7 +996,6 @@ package/pptp-linux/0001-susv3-legacy.patch lib_patch.Upstream
 package/pptp-linux/0002-fix-parallel-build.patch lib_patch.Upstream
 package/prboom/0001-libpng-1.4.patch lib_patch.Upstream
 package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch lib_patch.Upstream
-package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch lib_patch.Upstream
 package/procps-ng/S02sysctl lib_sysv.Variables
 package/proftpd/S50proftpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/prosody/0001-enable-syslog.patch lib_patch.Upstream
diff --git a/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch b/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch
deleted file mode 100644
index cea1357d1d..0000000000
--- a/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 4064f77d2f550762cbf220fec7c26a8ce4219ea4 Mon Sep 17 00:00:00 2001
-From: Alexander Egorenkov <egorenar@linux.ibm.com>
-Date: Sun, 8 Aug 2021 11:19:52 +0200
-Subject: [PATCH] src/rtld/dl-tls.c: Fix TLS offsets computation for s390 arch
-
-rtld_determine_tlsoffsets() didn't handle s390 arch properly by falling
-back to the default case. If TLS_TCB_AT_TP is 1, then set offset to -1.
-
-From glibc's sysdeps/s390/nptl/tls.h:
--------------------------------------
-/* The TCB can have any size and the memory following the address the
-   thread pointer points to is unspecified.  Allocate the TCB there.  */
-define TLS_TCB_AT_TP	1
-define TLS_DTV_AT_TP	0
-
-This lead to the following error:
----------------------------------
-prelink-rtld: error while loading shared libraries: /lib64/libc.so.6: cannot handle TLS data
-
-Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
----
- src/rtld/dl-tls.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/rtld/dl-tls.c b/src/rtld/dl-tls.c
-index 280cee45f950..29422dcfd25e 100644
---- a/src/rtld/dl-tls.c
-+++ b/src/rtld/dl-tls.c
-@@ -143,6 +143,11 @@ rtld_determine_tlsoffsets (int e_machine, struct r_scope_elem *search_list)
-       tls_tcb_size = 0;
-       break;
- 
-+    case EM_S390:
-+      tls_tcb_at_tp = 1;
-+      tls_tcb_size = -1;
-+      break;
-+
-     default:
-       /* Hope there's no TLS!  */
-       for (i = 0; i < search_list->r_nlist; i++)
--- 
-2.31.1
-
diff --git a/package/prelink-cross/0002-src-execstack.c-fix-prelink_path-type.patch b/package/prelink-cross/0002-src-execstack.c-fix-prelink_path-type.patch
deleted file mode 100644
index 26a68d8f5d..0000000000
--- a/package/prelink-cross/0002-src-execstack.c-fix-prelink_path-type.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 516030f287f65ca8bdab92c979ba2d328ee40506 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Fri, 31 May 2024 12:51:01 -0600
-Subject: [PATCH] src/execstack.c: fix prelink_path type
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-execstack.c: In function ‘execstack_make_rdwr’:
-execstack.c:127:17: error: passing argument 1 of ‘asprintf’ from incompatible pointer type [-Wincompatible-pointer-types]
-  127 |       asprintf (&prelink_path, "%s/%s", dirname, PRELINK_PROG EXEEXT);
-      |                 ^~~~~~~~~~~~~
-      |                 |
-      |                 const char **
-In file included from execstack.c:10:
-/usr/include/stdio.h:403:40: note: expected ‘char ** restrict’ but argument is of type ‘const char **’
-  403 | extern int asprintf (char **__restrict __ptr,
-      |                      ~~~~~~~~~~~~~~~~~~^~~~~
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream: https://git.yoctoproject.org/prelink-cross/commit/?id=ff2561c02ade96c5d4d56ddd4e27ff064840a176
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/execstack.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/execstack.c b/src/execstack.c
-index dda6bc7..5413fa2 100644
---- a/src/execstack.c
-+++ b/src/execstack.c
-@@ -52,7 +52,7 @@ const char *program_path;
- 
- /* The full pathname of the prelink tool, or NULL if it hasn't been
-    computed yet.  */
--const char *prelink_path;
-+char *prelink_path;
- 
- static error_t
- parse_opt (int key, char *arg, struct argp_state *state)
--- 
-2.45.2
-
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
deleted file mode 100644
index 6776d407b8..0000000000
--- a/package/prelink-cross/prelink-cross.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  555fd65c1b907f9b78d6d41ec04cb6e242d2ecb0667867e39cdd517b3f182dd3  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2-git4.tar.gz
-sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/prelink-cross/prelink-cross.mk b/package/prelink-cross/prelink-cross.mk
deleted file mode 100644
index 2312ee53e6..0000000000
--- a/package/prelink-cross/prelink-cross.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# host-prelink-cross
-#
-################################################################################
-
-PRELINK_CROSS_VERSION = a853a5d715d84eec93aa68e8f2df26b7d860f5b2
-PRELINK_CROSS_SITE = https://git.yoctoproject.org/git/prelink-cross
-PRELINK_CROSS_SITE_METHOD = git
-PRELINK_CROSS_LICENSE = GPL-2.0+
-PRELINK_CROSS_LICENSE_FILES = COPYING
-# Sources from git, no configure script present
-PRELINK_CROSS_AUTORECONF = YES
-HOST_PRELINK_CROSS_DEPENDENCIES = host-elfutils host-libiberty
-
-$(eval $(host-autotools-package))

--===============0293691040998844255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0293691040998844255==--
