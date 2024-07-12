Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FC5C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 759A040146;
	Fri, 12 Jul 2024 15:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VElboccXpOL; Fri, 12 Jul 2024 15:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AAAE4022A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AAAE4022A;
	Fri, 12 Jul 2024 15:05:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E67091BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0F8D608E8
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qVeoJdfthFj for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:05:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0075F6083D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0075F6083D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:05:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4E4585FCF; Fri, 12 Jul 2024 15:05:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 17:01:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 829f7d9e8462fbfff9afa3ad5d90c7d383a82bb8
X-Git-Newrev: a72b3e2eee788ca4b8544ab4f6c0db41065823c6
X-Patchwork-Hint: ignore
Message-Id: <20240712150540.A4E4585FCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/prelink-cross: bump to version
 440c0059a21f06b5577499a80b55482cb99d6d1c
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a72b3e2eee788ca4b8544ab4f6c0db41065823c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer relevant patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...-tls.c-Fix-TLS-offsets-computation-for-s3.patch | 43 ----------------------
 package/prelink-cross/prelink-cross.hash           |  2 +-
 package/prelink-cross/prelink-cross.mk             |  2 +-
 4 files changed, 2 insertions(+), 46 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 474508bf63..f5a9af9945 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1154,7 +1154,6 @@ package/pptp-linux/0001-susv3-legacy.patch lib_patch.Upstream
 package/pptp-linux/0002-fix-parallel-build.patch lib_patch.Upstream
 package/prboom/0001-libpng-1.4.patch lib_patch.Upstream
 package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch lib_patch.Upstream
-package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch lib_patch.Upstream
 package/procps-ng/0001-configure-Add--disable-w.patch lib_patch.Upstream
 package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch lib_patch.Upstream
 package/procps-ng/0003-fix-pifd_open-check.patch lib_patch.Upstream
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
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
index 6776d407b8..4aa3a86c45 100644
--- a/package/prelink-cross/prelink-cross.hash
+++ b/package/prelink-cross/prelink-cross.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  555fd65c1b907f9b78d6d41ec04cb6e242d2ecb0667867e39cdd517b3f182dd3  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2-git4.tar.gz
+sha256  ce0d58b7c60a441fd61c52329e2c767f7888056c491f55627a5304b13fda743f  prelink-cross-440c0059a21f06b5577499a80b55482cb99d6d1c-git4.tar.gz
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/prelink-cross/prelink-cross.mk b/package/prelink-cross/prelink-cross.mk
index 2312ee53e6..c32ea74afd 100644
--- a/package/prelink-cross/prelink-cross.mk
+++ b/package/prelink-cross/prelink-cross.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRELINK_CROSS_VERSION = a853a5d715d84eec93aa68e8f2df26b7d860f5b2
+PRELINK_CROSS_VERSION = 440c0059a21f06b5577499a80b55482cb99d6d1c
 PRELINK_CROSS_SITE = https://git.yoctoproject.org/git/prelink-cross
 PRELINK_CROSS_SITE_METHOD = git
 PRELINK_CROSS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
