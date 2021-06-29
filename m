Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B7DC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:02:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39927610CC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39927610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EC71842E5;
	Wed,  4 Aug 2021 00:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1t3mbuiI4yKP; Wed,  4 Aug 2021 00:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 477AD842B4;
	Wed,  4 Aug 2021 00:02:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAEC61BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CADF74068B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0DsbTwPXrot for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A37D40688
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B50B5860D3; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 22:25:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9265f1e8ac21bf867edb22710e4602192e479c84
X-Git-Newrev: 7fe6b75b590edcdff5f0284bd91c35624f3e7eeb
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.B50B5860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erofs-utils: bump
 version to 1.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7fe6b75b590edcdff5f0284bd91c35624f3e7eeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- new upstream version (mainly add big pcluster support);
- add 0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/patch/?id=7ab34000c672adca90388a8fcb1f70a7d391d35c

Signed-off-by: Gao Xiang <hsiangkao@aol.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-manpage-only-install-erofsfuse.1-with-th.patch | 32 ++++++++++++++++++++++
 package/erofs-utils/erofs-utils.hash               |  2 +-
 package/erofs-utils/erofs-utils.mk                 |  2 +-
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch b/package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch
new file mode 100644
index 0000000000..0aa99d5324
--- /dev/null
+++ b/package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch
@@ -0,0 +1,32 @@
+From 7ab34000c672adca90388a8fcb1f70a7d391d35c Mon Sep 17 00:00:00 2001
+From: David Michael <fedora.dm0@gmail.com>
+Date: Thu, 3 Jun 2021 16:18:57 -0400
+Subject: [PATCH] erofs-utils: manpage: only install erofsfuse.1 with the
+ command
+
+Link: https://lore.kernel.org/r/87lf7q3dn2.fsf@gmail.com
+Reviewed-by: Gao Xiang <xiang@kernel.org>
+Signed-off-by: David Michael <fedora.dm0@gmail.com>
+Signed-off-by: Gao Xiang <xiang@kernel.org>
+---
+ man/Makefile.am | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/man/Makefile.am b/man/Makefile.am
+index ffcf6f81c255..0df947b6fbf7 100644
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -1,5 +1,9 @@
+ # SPDX-License-Identifier: GPL-2.0+
+ # Makefile.am
+ 
+-dist_man_MANS = mkfs.erofs.1 erofsfuse.1
++dist_man_MANS = mkfs.erofs.1
+ 
++EXTRA_DIST = erofsfuse.1
++if ENABLE_FUSE
++man_MANS = erofsfuse.1
++endif
+-- 
+2.20.1
+
diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index 0de52d28a9..8bbb088568 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6b2ea15c3b092bd9a3abd966f78bc01c6caacb94022643ff34cf69893ee04e84  erofs-utils-1.2.1.tar.gz
+sha256  132635740039bbe76d743aea72378bfae30dbf034e123929f5d794198d4c0b12  erofs-utils-1.3.tar.gz
 sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  COPYING
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index 5d547148b2..e35470b02e 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.2.1
+EROFS_UTILS_VERSION = 1.3
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
 EROFS_UTILS_LICENSE = GPL-2.0+
 EROFS_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
