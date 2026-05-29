Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4570CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 736D784216;
	Fri, 29 May 2026 16:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blB1RG1yqeCy; Fri, 29 May 2026 16:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DBDA81250
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071367;
	bh=kotf9dIMSOqBNTbz+qvjY6PtwXKhxhLhiHfs3kNYwVE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mEr/UKXTI7i20BcHiU8f4ul6HNaz4E14dHBMCIOjkQWN3WKX1+BN4pXcs+cIm7ll0
	 QCr5sb0GXVI5t0xDpvdsdCjm3r/xVG02b1vJcsVqbVpHNf5q43N659Dg5/YkFHqVA5
	 7a3NsbhW3kjuUEGm63yLMexlswvgbQSlSQzSnj6jVwePaDQ4tTdjFEgq3LqF1rr1zW
	 z8iMtYkFnf2asFpLzqolKkOHbp1JAekC9zrykIZq6mP3Aejs00i4HCghF/u6jw0ISk
	 +fnHXpvBwIG43j3bhHeui4nzTeIrFyY9b138iVgO1ucN5zW9TTDhDEAQtYXLlaXPNZ
	 3m18pG/tXJtxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DBDA81250;
	Fri, 29 May 2026 16:16:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51A6C288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E49B408AB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0E35qImcVgiQ for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68C0E403DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68C0E403DF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:16:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5242873F2; Fri, 29 May 2026 16:15:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:12:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5726264e197691951b35dd017c484858126d536b
X-Git-Newrev: dd151e7a1096260e128ec6ea7e7fcc4fbfd8e32c
X-Patchwork-Hint: ignore
Message-Id: <20260529161552.C5242873F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/quota: bump version to
 4.11
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd151e7a1096260e128ec6ea7e7fcc4fbfd8e32c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Bump version to 4.11. Removed patches given [1] has:

* setproject: Fix openWRT build (Jan Kara)
* setproject: fix openat() call (Konstantin Demin)

[1] https://sourceforge.net/p/linuxquota/code/ci/v4.11/tree/Changelog

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../quota/0001-setproject-fix-openat-call.patch    | 41 ----------------------
 .../quota/0002-setproject-Fix-openWRT-build.patch  | 32 -----------------
 package/quota/quota.hash                           |  6 +---
 package/quota/quota.mk                             |  2 +-
 4 files changed, 2 insertions(+), 79 deletions(-)

diff --git a/package/quota/0001-setproject-fix-openat-call.patch b/package/quota/0001-setproject-fix-openat-call.patch
deleted file mode 100644
index 3c5d523e1e..0000000000
--- a/package/quota/0001-setproject-fix-openat-call.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d9852bd5b76ca65f283929e803b87343942ecb1f Mon Sep 17 00:00:00 2001
-From: Konstantin Demin <rockdrilla@gmail.com>
-Date: Tue, 1 Jul 2025 14:35:36 +0200
-Subject: [PATCH] setproject: fix openat() call
-
-It looks like that openat() call was copy-pasted from above fstatat() call.
-However, manpage for openat() doesn't mention AT_SYMLINK_NOFOLLOW.
-Furthermore, AT_SYMLINK_NOFOLLOW constant value (0x100) sometimes (!) clashes
-with O_CREAT constant value which is defined as 0100 (0x40) OR 0x100 (yes, two
-different values for the same constant appear in headers). This produces build
-errors when fortifying defines (-D_FORTIFY_SOURCE) are in effect (e.g. with
-glibc 2.41). In order to keep correct behavior, use O_NOFOLLOW instead of
-AT_SYMLINK_NOFOLLOW.
-
-Fixes: e61d46c65899ced9599c93a6128f19d8759fcad8
-Signed-off-by: Konstantin Demin <rockdrilla@gmail.com>
-Signed-off-by: Jan Kara <jack@suse.cz>
-
-Upstream: https://sourceforge.net/p/linuxquota/code/ci/d9852bd5b76ca65f283929e803b87343942ecb1f/
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- setproject.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setproject.c b/setproject.c
-index 3047c3d..e688dcd 100644
---- a/setproject.c
-+++ b/setproject.c
-@@ -73,7 +73,7 @@ static void setproject_recurse(int dirfd, unsigned id, unsigned dev)
- 		if (!S_ISDIR(st.st_mode) && !S_ISREG(st.st_mode))
- 			continue;
- 
--		int fd = openat(dirfd, d->d_name, AT_SYMLINK_NOFOLLOW);
-+		int fd = openat(dirfd, d->d_name, O_NOFOLLOW);
- 		if (fd < 0) {
- 			errstr(_("error opening %s: %m"), d->d_name);
- 			errno = 0;
--- 
-2.47.3
-
diff --git a/package/quota/0002-setproject-Fix-openWRT-build.patch b/package/quota/0002-setproject-Fix-openWRT-build.patch
deleted file mode 100644
index 04cc5fab04..0000000000
--- a/package/quota/0002-setproject-Fix-openWRT-build.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 41ba7031ca4852739dd1f66102d34e4a98490906 Mon Sep 17 00:00:00 2001
-From: Jan Kara <jack@suse.cz>
-Date: Tue, 1 Jul 2025 15:41:56 +0200
-Subject: [PATCH] setproject: Fix openWRT build
-
-basename() needs libgen.h include in openWRT build environment. Add it.
-
-Reported-by: "W. Michael Petullo" <mike@flyn.org>
-Signed-off-by: Jan Kara <jack@suse.cz>
-
-Upstream: https://sourceforge.net/p/linuxquota/code/ci/41ba7031ca4852739dd1f66102d34e4a98490906/
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- setproject.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/setproject.c b/setproject.c
-index e688dcd..4308435 100644
---- a/setproject.c
-+++ b/setproject.c
-@@ -13,6 +13,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <unistd.h>
-+#include <libgen.h>
- 
- #include <linux/fs.h>
- 
--- 
-2.47.3
-
diff --git a/package/quota/quota.hash b/package/quota/quota.hash
index e82c1f2c64..675a28041b 100644
--- a/package/quota/quota.hash
+++ b/package/quota/quota.hash
@@ -1,6 +1,2 @@
-# From https://sourceforge.net/projects/linuxquota/files/quota-tools/4.10/
-sha1  343f26a6f1b6a8dbbd7d89045b0c087efb08d553  quota-4.10.tar.gz
-
-# Locally calculated
-sha256  a04a0cafca29c15be8b6ac660e06188bccb802c19efe2e7c19ed7f3d667ecf5e  quota-4.10.tar.gz
+sha256  0a51b8f920254d8e83c34a4c3082b7d241f5d6fd65188afadf29859d5223ef78  quota-4.11.tar.gz
 sha256  32a5fd41e7a257f7f0373988ea8d45cebdbf376060703c242c11c000751b1203  COPYING
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index f22ebe41c4..f5a0a09dfc 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUOTA_VERSION = 4.10
+QUOTA_VERSION = 4.11
 QUOTA_SITE = https://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-nfs-utils
 QUOTA_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
