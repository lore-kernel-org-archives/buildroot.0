Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B57C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:04:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5153611C6
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5153611C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A10B4403F9;
	Wed,  6 Oct 2021 06:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HbXkEosgjz_7; Wed,  6 Oct 2021 06:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4CA0403FB;
	Wed,  6 Oct 2021 06:04:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6AFD1BF869
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2B07405BE
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfB2kwAIydyN for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 06:04:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1032440747
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 06:04:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C2C4F91280; Wed,  6 Oct 2021 06:01:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 08:03:15 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 3f942b0c1566201fcb31336d9186ba3dab02a1eb
X-Git-Newrev: 76c433414b2233c70381ef4cb47f2a73bfe6c79f
X-Patchwork-Hint: ignore
Message-Id: <20211006060126.C2C4F91280@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/ntfs-3g: security
 bump to version 2021.8.22
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=76c433414b2233c70381ef4cb47f2a73bfe6c79f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- Fixed vulnerability threats caused by maliciously tampered NTFS
  partitions (CVE-2021-33285, CVE-2021-33286, CVE-2021-33287, etc.):
  https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-q759-8j5v-q5jp
- Drop patch (already in version)

https://github.com/tuxera/ntfs-3g/wiki/NTFS-3G-Release-History

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
(cherry picked from commit 57adb82576c403dc59bcfbe354466778d1177c17)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ting-an-error-when-failed-to-build-the-mo.patch | 72 ----------------------
 package/ntfs-3g/ntfs-3g.hash                       |  2 +-
 package/ntfs-3g/ntfs-3g.mk                         |  5 +-
 3 files changed, 2 insertions(+), 77 deletions(-)

diff --git a/package/ntfs-3g/0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch b/package/ntfs-3g/0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch
deleted file mode 100644
index 9ba8aae50c..0000000000
--- a/package/ntfs-3g/0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 85c1634a26faa572d3c558d4cf8aaaca5202d4e9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jean-Pierre=20Andr=C3=A9?= <jean-pierre.andre@wanadoo.fr>
-Date: Wed, 19 Dec 2018 15:57:50 +0100
-Subject: [PATCH] Fixed reporting an error when failed to build the mountpoint
-
-The size check was inefficient because getcwd() uses an unsigned int
-argument.
-
-Fixes CVE-2019-9755: An integer underflow issue exists in ntfs-3g 2017.3.23.
-A local attacker could potentially exploit this by running /bin/ntfs-3g with
-specially crafted arguments from a specially crafted directory to cause a
-heap buffer overflow, resulting in a crash or the ability to execute
-arbitrary code.  In installations where /bin/ntfs-3g is a setuid-root
-binary, this could lead to a local escalation of privileges.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/lowntfs-3g.c | 6 +++++-
- src/ntfs-3g.c    | 6 +++++-
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/src/lowntfs-3g.c b/src/lowntfs-3g.c
-index 993867fa..0660439b 100644
---- a/src/lowntfs-3g.c
-+++ b/src/lowntfs-3g.c
-@@ -4411,7 +4411,8 @@ int main(int argc, char *argv[])
- 	else {
- 		ctx->abs_mnt_point = (char*)ntfs_malloc(PATH_MAX);
- 		if (ctx->abs_mnt_point) {
--			if (getcwd(ctx->abs_mnt_point,
-+			if ((strlen(opts.mnt_point) < PATH_MAX)
-+			    && getcwd(ctx->abs_mnt_point,
- 				     PATH_MAX - strlen(opts.mnt_point) - 1)) {
- 				strcat(ctx->abs_mnt_point, "/");
- 				strcat(ctx->abs_mnt_point, opts.mnt_point);
-@@ -4419,6 +4420,9 @@ int main(int argc, char *argv[])
- 			/* Solaris also wants the absolute mount point */
- 				opts.mnt_point = ctx->abs_mnt_point;
- #endif /* defined(__sun) && defined (__SVR4) */
-+			} else {
-+				free(ctx->abs_mnt_point);
-+				ctx->abs_mnt_point = (char*)NULL;
- 			}
- 		}
- 	}
-diff --git a/src/ntfs-3g.c b/src/ntfs-3g.c
-index 6ce89fef..4e0912ae 100644
---- a/src/ntfs-3g.c
-+++ b/src/ntfs-3g.c
-@@ -4148,7 +4148,8 @@ int main(int argc, char *argv[])
- 	else {
- 		ctx->abs_mnt_point = (char*)ntfs_malloc(PATH_MAX);
- 		if (ctx->abs_mnt_point) {
--			if (getcwd(ctx->abs_mnt_point,
-+			if ((strlen(opts.mnt_point) < PATH_MAX)
-+			    && getcwd(ctx->abs_mnt_point,
- 				     PATH_MAX - strlen(opts.mnt_point) - 1)) {
- 				strcat(ctx->abs_mnt_point, "/");
- 				strcat(ctx->abs_mnt_point, opts.mnt_point);
-@@ -4156,6 +4157,9 @@ int main(int argc, char *argv[])
- 			/* Solaris also wants the absolute mount point */
- 				opts.mnt_point = ctx->abs_mnt_point;
- #endif /* defined(__sun) && defined (__SVR4) */
-+			} else {
-+				free(ctx->abs_mnt_point);
-+				ctx->abs_mnt_point = (char*)NULL;
- 			}
- 		}
- 	}
--- 
-2.20.1
-
diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
index 63c999f253..668e11a800 100644
--- a/package/ntfs-3g/ntfs-3g.hash
+++ b/package/ntfs-3g/ntfs-3g.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5  ntfs-3g_ntfsprogs-2017.3.23.tgz
+sha256  55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d1b8b94bb202efb  ntfs-3g_ntfsprogs-2021.8.22.tgz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 1a388af761..21f7cfc46d 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTFS_3G_VERSION = 2017.3.23
+NTFS_3G_VERSION = 2021.8.22
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPTS = --disable-ldconfig
@@ -14,9 +14,6 @@ NTFS_3G_LICENSE = GPL-2.0+, LGPL-2.0+
 NTFS_3G_LICENSE_FILES = COPYING COPYING.LIB
 NTFS_3G_CPE_ID_VENDOR = tuxera
 
-# 0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch
-NTFS_3G_IGNORE_CVES += CVE-2019-9755
-
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 NTFS_3G_CONF_OPTS += --with-fuse=external
 NTFS_3G_DEPENDENCIES += libfuse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
