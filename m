Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D67AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 07:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B1060EFE;
	Sun, 17 Jul 2022 07:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01B1060EFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L93NCkAHTJJE; Sun, 17 Jul 2022 07:21:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE4F760F01;
	Sun, 17 Jul 2022 07:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE4F760F01
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D84ED1BF2CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BA59607CE
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BA59607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2EkUCjmq3pJu for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 07:20:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E43760BF5
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 07:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E43760BF5
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C063683903; Sun, 17 Jul 2022 07:06:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 09:19:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86ab91483dcb4b60de8c1daa20e2f42bd95ab5fb
X-Git-Newrev: 3f121357ae225be9ac2fbf4505027c2cc690626b
X-Patchwork-Hint: ignore
Message-Id: <20220717070652.C063683903@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpgme: bump to version 1.17.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f121357ae225be9ac2fbf4505027c2cc690626b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=blob;f=NEWS;h=a460ddfe78f18a03143c8dd87ef2c138392104e6;hb=ee50a38823daaa16b151a549a7dafef34bbd1e81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...001-core-Support-closefrom-also-for-glibc.patch | 36 ----------------------
 package/libgpgme/libgpgme.hash                     |  6 ++--
 package/libgpgme/libgpgme.mk                       |  2 +-
 3 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch b/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch
deleted file mode 100644
index b8db949cef..0000000000
--- a/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4b64774b6d13ffa4f59dddf947a97d61bcfa2f2e Mon Sep 17 00:00:00 2001
-From: Jiri Kucera <sanczes@gmail.com>
-Date: Sun, 25 Jul 2021 11:35:54 +0200
-Subject: [PATCH] core: Support closefrom also for glibc.
-
-* src/posix-io.c (_gpgme_io_spawn): Use glibc's closefrom.
---
-
-Since 2.34, glibc introduces closefrom (the implementation
-follows *BSD standard).
-
-Signed-off-by: Werner Koch <wk@gnupg.org>
-
-[Retrieved from:
-https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=4b64774b6d13ffa4f59dddf947a97d61bcfa2f2e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/posix-io.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/posix-io.c b/src/posix-io.c
-index e712ef28..2a3a81fc 100644
---- a/src/posix-io.c
-+++ b/src/posix-io.c
-@@ -570,7 +570,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
-               if (fd_list[i].fd > fd)
-                 fd = fd_list[i].fd;
-             fd++;
--#if defined(__sun) || defined(__FreeBSD__)
-+#if defined(__sun) || defined(__FreeBSD__) || defined(__GLIBC__)
-             closefrom (fd);
-             max_fds = fd;
- #else /*!__sun */
--- 
-2.11.0
-
diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index ca2a79496c..7d02b9e139 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.16.0.tar.bz2.sig
-# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  6c8cc4aedb10d5d4c905894ba1d850544619ee765606ac43df7405865de29ed0  gpgme-1.16.0.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.17.1.tar.bz2.sig
+# using key 6DAA6E64A76D2840571B4902528897B826403ADA
+sha256  711eabf5dd661b9b04be9edc9ace2a7bc031f6bd9d37a768d02d0efdef108f5f  gpgme-1.17.1.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index b42a1a363a..1b57b18872 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.16.0
+LIBGPGME_VERSION = 1.17.1
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
