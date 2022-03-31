Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80554C433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 12:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27E6B4107F;
	Thu, 31 Mar 2022 12:18:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDDtKfTUNrdR; Thu, 31 Mar 2022 12:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1224E4014D;
	Thu, 31 Mar 2022 12:18:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5D41BF3CA
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 12:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B80E2612E5
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 12:18:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbVjr9dY05JW for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 12:18:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB5BE612F3
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 12:18:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E83F786097; Thu, 31 Mar 2022 12:08:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 14:17:19 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f93f4dc615414f71eab6fd2d5ea31b527318b37b
X-Git-Newrev: fc1f28521055045d66fc3218eeee5e891d4d4ddd
X-Patchwork-Hint: ignore
Message-Id: <20220331120852.E83F786097@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/netatalk:
 security bump to version 3.1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc1f28521055045d66fc3218eeee5e891d4d4ddd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Fixes CVE-2021-31439, CVE-2022-23121, CVE-2022-23123, CVE-2022-23122,
  CVE-2022-23125, CVE-2022-23124 and CVE-2022-0194
- Drop second patch (already in version)
- Add tarball sha256
- Update indentation in hash file (two spaces)

https://sourceforge.net/projects/netatalk/files/netatalk/3.1.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5ed1baa7e2d20c2b6184db265f398d1c2bb0e2e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-multiple-def-of-invalid_dircache_entries.patch | 25 ----------------------
 package/netatalk/netatalk.hash                     |  7 +++---
 package/netatalk/netatalk.mk                       |  2 +-
 3 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch b/package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch
deleted file mode 100644
index e7ccc52553..0000000000
--- a/package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 32df6e155ccfc83216321925273c3e75e631ebe6 Mon Sep 17 00:00:00 2001
-From: Andrew Bauer <zonexpertconsulting@outlook.com>
-Date: Wed, 22 Jan 2020 09:59:47 -0600
-Subject: [PATCH] fix ftbs multiple def of invalid_dircache_entries
-
-[Retrieved from:
-https://github.com/Netatalk/Netatalk/pull/125/commits/32df6e155ccfc83216321925273c3e75e631ebe6]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- etc/afpd/directory.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/etc/afpd/directory.h b/etc/afpd/directory.h
-index eb89c606..81bfa9cb 100644
---- a/etc/afpd/directory.h
-+++ b/etc/afpd/directory.h
-@@ -91,7 +91,7 @@ struct maccess {
- #define	AR_UWRITE	(1<<2)
- #define	AR_UOWN		(1<<7)
- 
--q_t *invalid_dircache_entries;
-+extern q_t *invalid_dircache_entries;
- 
- typedef int (*dir_loop)(struct dirent *, char *, void *);
- 
diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index 6c3250a005..6dead5457c 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,6 +1,7 @@
-# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.12/
-md5 021d2330cb7f7cd2977aec46299dcc1b  netatalk-3.1.12.tar.bz2
-sha1 cc1fe1ebdbdb4da9cf82835c440e82ba28a832c5  netatalk-3.1.12.tar.bz2
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.13/
+md5  697421623c32ee0ab9c8076191766e5f  netatalk-3.1.13.tar.bz2
+sha1  16dd7fa84962a44b36b795b8c44393e728785947  netatalk-3.1.13.tar.bz2
 # Locally computed
+sha256  89ada6bcfe1b39ad94f58c236654d1d944f2645c3e7de98b3374e0bd37d5e05d  netatalk-3.1.13.tar.bz2
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  7599ae145e53be03a08f8b558b2f2e0c828e1630f1843cc04f41981b8cefcd65  COPYRIGHT
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 0c219a2316..7cc950beb6 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.12
+NETATALK_VERSION = 3.1.13
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 # For 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
