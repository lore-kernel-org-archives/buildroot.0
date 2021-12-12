Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEBFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FC4340264;
	Sun, 12 Dec 2021 12:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lF1tBhBLkphO; Sun, 12 Dec 2021 12:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C182E40538;
	Sun, 12 Dec 2021 12:25:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D9181BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18A06429A1
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2RKKrDhLCST for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7344842067
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CDEA982B70; Sun, 12 Dec 2021 12:17:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38c5068d10787addd5aea6f532b6abe825fe5e3d
X-Git-Newrev: 0987512a28a862e84d977b336cac02fbdc99fadc
X-Patchwork-Hint: ignore
Message-Id: <20211212121714.CDEA982B70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pure-ftpd: bump to version 1.0.50
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

commit: https://git.buildroot.net/buildroot/commit/?id=0987512a28a862e84d977b336cac02fbdc99fadc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- Update hash of COPYING (year updated with
  https://github.com/jedisct1/pure-ftpd/commit/a81471dceb9caa3f8c1c4b0b35a1291108a0dead
  https://github.com/jedisct1/pure-ftpd/commit/16809bdf93a48b2c89019886065f4bb191619ce6
  and alt_arc4random.c removed with
  https://github.com/jedisct1/pure-ftpd/commit/43591eb6f6488ed9ede0da01dc118dbd8565a89b)
- Update indentation in hash file (two spaces)

https://github.com/jedisct1/pure-ftpd/releases/tag/1.0.50

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...uffer-to-store-every-file-name-to-display.patch | 70 ----------------------
 .../0002-pure_strcmp-len-s2-can-be-len-s1.patch    | 30 ----------
 ...s-always-set-the-tail-of-the-list-to-NULL.patch | 35 -----------
 ...-upload-file-size-when-quotas-are-enabled.patch | 33 ----------
 package/pure-ftpd/pure-ftpd.hash                   |  4 +-
 package/pure-ftpd/pure-ftpd.mk                     | 14 +----
 6 files changed, 3 insertions(+), 183 deletions(-)

diff --git a/package/pure-ftpd/0001-listdir-reuse-a-single-buffer-to-store-every-file-name-to-display.patch b/package/pure-ftpd/0001-listdir-reuse-a-single-buffer-to-store-every-file-name-to-display.patch
deleted file mode 100644
index 2f791d1d6e..0000000000
--- a/package/pure-ftpd/0001-listdir-reuse-a-single-buffer-to-store-every-file-name-to-display.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From aea56f4bcb9948d456f3fae4d044fd3fa2e19706 Mon Sep 17 00:00:00 2001
-From: Frank Denis <github@pureftpd.org>
-Date: Mon, 30 Dec 2019 17:40:04 +0100
-Subject: [PATCH] listdir(): reuse a single buffer to store every file name to
- display
-
-Allocating a new buffer for each entry is useless.
-
-And as these buffers are allocated on the stack, on systems with a
-small stack size, with many entries, the limit can easily be reached,
-causing a stack exhaustion and aborting the user session.
-
-Reported by Antonio Morales from the GitHub Security Lab team, thanks!
-[Retrieved from:
-https://github.com/jedisct1/pure-ftpd/commit/aea56f4bcb9948d456f3fae4d044fd3fa2e19706]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/ls.c | 15 ++++++++-------
- 1 file changed, 8 insertions(+), 7 deletions(-)
-
-diff --git a/src/ls.c b/src/ls.c
-index cf804c7..f8a588f 100644
---- a/src/ls.c
-+++ b/src/ls.c
-@@ -661,6 +661,8 @@ static void listdir(unsigned int depth, int f, void * const tls_fd,
-     char *names;
-     PureFileInfo *s;
-     PureFileInfo *r;
-+    char *alloca_subdir;
-+    size_t sizeof_subdir;
-     int d;
- 
-     if (depth >= max_ls_depth || matches >= max_ls_files) {
-@@ -690,14 +692,12 @@ static void listdir(unsigned int depth, int f, void * const tls_fd,
-     }
-     outputfiles(f, tls_fd);
-     r = dir;
-+    sizeof_subdir = PATH_MAX + 1U;
-+    if ((alloca_subdir = ALLOCA(sizeof_subdir)) == NULL) {
-+        goto toomany;
-+    }
-     while (opt_R && r != s) {
-         if (r->name_offset != (size_t) -1 && !chdir(FI_NAME(r))) {
--            char *alloca_subdir;
--            const size_t sizeof_subdir = PATH_MAX + 1U;
--
--            if ((alloca_subdir = ALLOCA(sizeof_subdir)) == NULL) {
--                goto toomany;
--            }
-             if (SNCHECK(snprintf(alloca_subdir, sizeof_subdir, "%s/%s",
-                                  name, FI_NAME(r)), sizeof_subdir)) {
-                 goto nolist;
-@@ -706,8 +706,8 @@ static void listdir(unsigned int depth, int f, void * const tls_fd,
-             wrstr(f, tls_fd, alloca_subdir);
-             wrstr(f, tls_fd, ":\r\n\r\n");
-             listdir(depth + 1U, f, tls_fd, alloca_subdir);
-+
-             nolist:
--            ALLOCA_FREE(alloca_subdir);
-             if (matches >= max_ls_files) {
-                 goto toomany;
-             }
-@@ -720,6 +720,7 @@ static void listdir(unsigned int depth, int f, void * const tls_fd,
-         r++;
-     }
-     toomany:
-+    ALLOCA_FREE(alloca_subdir);
-     free(names);
-     free(dir);
-     names = NULL;
diff --git a/package/pure-ftpd/0002-pure_strcmp-len-s2-can-be-len-s1.patch b/package/pure-ftpd/0002-pure_strcmp-len-s2-can-be-len-s1.patch
deleted file mode 100644
index 3de3cbd2c8..0000000000
--- a/package/pure-ftpd/0002-pure_strcmp-len-s2-can-be-len-s1.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 36c6d268cb190282a2c17106acfd31863121b58e Mon Sep 17 00:00:00 2001
-From: Frank Denis <github@pureftpd.org>
-Date: Mon, 24 Feb 2020 15:19:43 +0100
-Subject: [PATCH] pure_strcmp(): len(s2) can be > len(s1)
-
-Reported by Antonio Morales from GitHub Security Labs, thanks!
-[Retrieved from:
-https://github.com/jedisct1/pure-ftpd/commit/36c6d268cb190282a2c17106acfd31863121b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/utils.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/src/utils.c b/src/utils.c
-index f41492d..a7f0381 100644
---- a/src/utils.c
-+++ b/src/utils.c
-@@ -45,5 +45,11 @@ int pure_memcmp(const void * const b1_, const void * const b2_, size_t len)
- 
- int pure_strcmp(const char * const s1, const char * const s2)
- {
--    return pure_memcmp(s1, s2, strlen(s1) + 1U);
-+    const size_t s1_len = strlen(s1);
-+    const size_t s2_len = strlen(s2);
-+
-+    if (s1_len != s2_len) {
-+        return -1;
-+    }
-+    return pure_memcmp(s1, s2, s1_len);
- }
diff --git a/package/pure-ftpd/0003-diraliases-always-set-the-tail-of-the-list-to-NULL.patch b/package/pure-ftpd/0003-diraliases-always-set-the-tail-of-the-list-to-NULL.patch
deleted file mode 100644
index 6c58eb74ae..0000000000
--- a/package/pure-ftpd/0003-diraliases-always-set-the-tail-of-the-list-to-NULL.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8d0d42542e2cb7a56d645fbe4d0ef436e38bcefa Mon Sep 17 00:00:00 2001
-From: Frank Denis <github@pureftpd.org>
-Date: Tue, 18 Feb 2020 18:36:58 +0100
-Subject: [PATCH] diraliases: always set the tail of the list to NULL
-
-Spotted and reported by Antonio Norales from GitHub Security Labs.
-Thanks!
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/jedisct1/pure-ftpd/commit/8d0d42542e2cb7a56d645fbe4d0ef436e38bcefa]
----
- src/diraliases.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/diraliases.c b/src/diraliases.c
-index 4002a36..fb70273 100644
---- a/src/diraliases.c
-+++ b/src/diraliases.c
-@@ -93,7 +93,6 @@ int init_aliases(void)
-                 (tail->dir = strdup(dir)) == NULL) {
-                 die_mem();
-             }
--            tail->next = NULL;
-         } else {
-             DirAlias *curr;
- 
-@@ -105,6 +104,7 @@ int init_aliases(void)
-             tail->next = curr;
-             tail = curr;
-         }
-+        tail->next = NULL;
-     }
-     fclose(fp);
-     aliases_up++;
diff --git a/package/pure-ftpd/0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch b/package/pure-ftpd/0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch
deleted file mode 100644
index b269e6cfe7..0000000000
--- a/package/pure-ftpd/0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 37ad222868e52271905b94afea4fc780d83294b4 Mon Sep 17 00:00:00 2001
-From: Frank Denis <github@pureftpd.org>
-Date: Tue, 23 Nov 2021 18:53:34 +0100
-Subject: [PATCH] Initialize the max upload file size when quotas are enabled
-
-Due to an unwanted check, files causing the quota to be exceeded
-were deleted after the upload, but not during the upload.
-
-The bug was introduced in 2009 in version 1.0.23
-
-Spotted by @DroidTest, thanks!
-
-[Retrieved from:
-https://github.com/jedisct1/pure-ftpd/commit/37ad222868e52271905b94afea4fc780d83294b4]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/ftpd.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/ftpd.c b/src/ftpd.c
-index d856839..be2fd78 100644
---- a/src/ftpd.c
-+++ b/src/ftpd.c
-@@ -4247,8 +4247,7 @@ void dostor(char *name, const int append, const int autorename)
-     if (quota_update(&quota, 0LL, 0LL, &overflow) == 0 &&
-         (overflow > 0 || quota.files >= user_quota_files ||
-          quota.size > user_quota_size ||
--         (max_filesize >= (off_t) 0 &&
--          (max_filesize = user_quota_size - quota.size) < (off_t) 0))) {
-+         (max_filesize = user_quota_size - quota.size) < (off_t) 0)) {
-         overflow = 1;
-         (void) close(f);
-         goto afterquota;
diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index 8fe73e4fb0..e8b779c313 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 8a727dfef810f275fba3eb6099760d4f8a0bdeae2c1197d0d5bfeb8c1b2f61b6  pure-ftpd-1.0.49.tar.bz2
-sha256 3a9e94382a69d04aa434d69b20ff2c01dbbfcb7191f05f69a7109c0ee1559c19  COPYING
+sha256  6722c7fd09fe3c9ebbd572f3d097087ec7b32aacb3df8fa3400d4c07e4f377d7  pure-ftpd-1.0.50.tar.bz2
+sha256  c1be5d56c28927b05131d7384bd522af4b11c3afea45725f5ca7983c11db61ac  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 35a1aac917..f3cbef84b9 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.49
+PURE_FTPD_VERSION = 1.0.50
 PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
@@ -12,18 +12,6 @@ PURE_FTPD_LICENSE_FILES = COPYING
 PURE_FTPD_CPE_ID_VENDOR = pureftpd
 PURE_FTPD_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-# 0001-listdir-reuse-a-single-buffer-to-store-every-file-name-to-display.patch
-PURE_FTPD_IGNORE_CVES += CVE-2019-20176
-
-# 0002-pure_strcmp-len-s2-can-be-len-s1.patch
-PURE_FTPD_IGNORE_CVES += CVE-2020-9365
-
-# 0003-diraliases-always-set-the-tail-of-the-list-to-NULL.patch
-PURE_FTPD_IGNORE_CVES += CVE-2020-9274
-
-# 0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch
-PURE_FTPD_IGNORE_CVES += CVE-2021-40524
-
 PURE_FTPD_CONF_OPTS = \
 	--with-altlog \
 	--with-puredb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
