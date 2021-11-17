Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1384C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:48:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9316860EE4
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9316860EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6217E400D0;
	Wed, 17 Nov 2021 21:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IS2c8fOLjtdy; Wed, 17 Nov 2021 21:48:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 576E3400EB;
	Wed, 17 Nov 2021 21:48:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 264EB1BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 153C5400D0
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0St4KCFGSWI for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:48:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05BF9400EB
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:48:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EE2ED8D5C1; Wed, 17 Nov 2021 21:44:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:21:40 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: ef978418465be783590aaca61056eab95559eea1
X-Git-Newrev: 84a8aa98101a0a18355f5c03e65816e23024a7cb
X-Patchwork-Hint: ignore
Message-Id: <20211117214411.EE2ED8D5C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/vim: security
 bump to version 8.2.3582
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

commit: https://git.buildroot.net/buildroot/commit/?id=84a8aa98101a0a18355f5c03e65816e23024a7cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

- Fix CVE-2021-3928: vim is vulnerable to Stack-based Buffer Overflow
- Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9f42504d6d55d9e667484ce4edd5a9a6de690ddc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tems-for-nanosecond-resolution-timestamps.patch | 56 ----------------------
 package/vim/vim.hash                               |  2 +-
 package/vim/vim.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)

diff --git a/package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch b/package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch
deleted file mode 100644
index 2e78a8d594..0000000000
--- a/package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From b5db1ebf06d2904522ebf246f9c6a8bbf8fca398 Mon Sep 17 00:00:00 2001
-From: Gary Johnson <garyjohn@spocom.com>
-Date: Tue, 26 Oct 2021 13:50:19 -0700
-Subject: [PATCH] Fix config of old systems for nanosecond-resolution
- timestamps
-
-On old systems (e.g. 32-bit systems running Ubuntu 10.4), defining
-_XOPEN_SOURCE causes _BSD_SOURCE and _SVID_SOURCE not to be defined,
-which causes nanosecond-resolution timestamps not to be included in
-struct stat, which causes the build of fileio.c to fail.
-
-_XOPEN_SOURCE is defined for some systems in vim.h.
-
-A solution is to define _BSD_SOURCE and _SVID_SOURCE whenever
-_XOPEN_SOURCE is defined.
-
-On new systems, defining either _BSD_SOURCE or _SVID_SOURCE causes
-/usr/include/features.h to issue a warning message about _BSD_SOURCE and
-_SVID_SOURCE being deprecated and to use _DEFAULT_SOURCE instead.
-
-A solution for that is to also define _DEFAULT_SOURCE when _BSD_SOURCE
-and _SVID_SOURCE are defined.
-
-[Retrieved from:
-https://github.com/vim/vim/pull/9054/commits/b5db1ebf06d2904522ebf246f9c6a8bbf8fca398]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/vim.h | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/src/vim.h b/src/vim.h
-index 31d4bdefe87..f62ad88c7a1 100644
---- a/src/vim.h
-+++ b/src/vim.h
-@@ -43,6 +43,21 @@
- // 700 is needed for mkdtemp().
- #  ifndef _XOPEN_SOURCE
- #   define _XOPEN_SOURCE    700
-+
-+// On old systems, defining _XOPEN_SOURCE causes _BSD_SOURCE and/or
-+// _SVID_SOURCE not to be defined, so do that here.  Those are needed to
-+// include nanosecond-resolution timestamps in struct stat.  On new systems,
-+// _DEFAULT_SOURCE is needed to avoid warning messages about using deprecated
-+// _BSD_SOURCE or _SVID_SOURCE.
-+#   ifndef _BSD_SOURCE
-+#    define _BSD_SOURCE 1
-+#   endif
-+#   ifndef _SVID_SOURCE
-+#    define _SVID_SOURCE 1
-+#   endif
-+#   ifndef _DEFAULT_SOURCE
-+#    define _DEFAULT_SOURCE 1
-+#   endif
- #  endif
- # endif
- 
diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index bbe65c4dda..e07e48c68f 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ac2264c45684218232ec49a6ae8b88b9a68312b664b93b811868d24c39d8dc11  vim-8.2.3565.tar.gz
+sha256  363a90e45eb93c73340a711223c7ce5e564432f9eb34624e1a545f4fd57dd49d  vim-8.2.3582.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 960759aab4..0eb96dc835 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.3565
+VIM_VERSION = 8.2.3582
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
