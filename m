Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3B4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 12:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D93B83E9A;
	Mon, 14 Mar 2022 12:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6VjBSdKO2_d; Mon, 14 Mar 2022 12:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3725783E05;
	Mon, 14 Mar 2022 12:21:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A46F1BF9AC
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3839F83F71
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gN-lkpNNn8JM for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 12:20:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B58D7826EA
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 12:20:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E50AC82868; Mon, 14 Mar 2022 12:11:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 13:17:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4aaa7ac4d86b3f509dea696d972b092d09442d7
X-Git-Newrev: a346843eedef792f48ef6a49cc83ae89d97287fe
X-Patchwork-Hint: ignore
Message-Id: <20220314121152.E50AC82868@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/screen: bump to version 4.9.0
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
Content-Type: multipart/mixed; boundary="===============4075982504635993482=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4075982504635993482==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a346843eedef792f48ef6a49cc83ae89d97287fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop latest patch (already in version)
- Update indentation in hash file (two spaces)

https://lists.gnu.org/archive/html/screen-users/2022-02/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/screen/0008-CVE-2021-26937.patch | 68 --------------------------------
 package/screen/screen.hash               |  6 +--
 package/screen/screen.mk                 |  5 +--
 3 files changed, 4 insertions(+), 75 deletions(-)

diff --git a/package/screen/0008-CVE-2021-26937.patch b/package/screen/0008-CVE-2021-26937.patch
deleted file mode 100644
index df7efa0294..0000000000
--- a/package/screen/0008-CVE-2021-26937.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Description: [CVE-2021-26937] Fix out of bounds array access
-Author: Michael Schröder <mls@suse.de>
-Bug-Debian: https://bugs.debian.org/982435
-Bug: https://savannah.gnu.org/bugs/?60030
-Bug: https://lists.gnu.org/archive/html/screen-devel/2021-02/msg00000.html
-Bug-OSS-Security: https://www.openwall.com/lists/oss-security/2021/02/09/3
-Origin: https://lists.gnu.org/archive/html/screen-devel/2021-02/msg00010.html
-
-Downloaded from Debian:
-https://sources.debian.org/data/main/s/screen/4.8.0-5/debian/patches/99_CVE-2021-26937.patch
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---- a/encoding.c
-+++ b/encoding.c
-@@ -43,7 +43,7 @@
- # ifdef UTF8
- static int   recode_char __P((int, int, int));
- static int   recode_char_to_encoding __P((int, int));
--static void  comb_tofront __P((int, int));
-+static void  comb_tofront __P((int));
- #  ifdef DW_CHARS
- static int   recode_char_dw __P((int, int *, int, int));
- static int   recode_char_dw_to_encoding __P((int, int *, int));
-@@ -1263,6 +1263,8 @@
-     {0x30000, 0x3FFFD},
-   };
- 
-+  if (c >= 0xdf00 && c <= 0xdfff)
-+    return 1;          /* dw combining sequence */
-   return ((bisearch(c, wide, sizeof(wide) / sizeof(struct interval) - 1)) ||
-           (cjkwidth &&
-            bisearch(c, ambiguous,
-@@ -1330,11 +1332,12 @@
- }
- 
- static void
--comb_tofront(root, i)
--int root, i;
-+comb_tofront(i)
-+int i;
- {
-   for (;;)
-     {
-+      int root = i >= 0x700 ? 0x801 : 0x800;
-       debug1("bring to front: %x\n", i);
-       combchars[combchars[i]->prev]->next = combchars[i]->next;
-       combchars[combchars[i]->next]->prev = combchars[i]->prev;
-@@ -1396,9 +1399,9 @@
-     {
-       /* full, recycle old entry */
-       if (c1 >= 0xd800 && c1 < 0xe000)
--        comb_tofront(root, c1 - 0xd800);
-+        comb_tofront(c1 - 0xd800);
-       i = combchars[root]->prev;
--      if (c1 == i + 0xd800)
-+      if (i == 0x800 || i == 0x801 || c1 == i + 0xd800)
- 	{
- 	  /* completely full, can't recycle */
- 	  debug("utf8_handle_comp: completely full!\n");
-@@ -1422,7 +1425,7 @@
-   mc->font  = (i >> 8) + 0xd8;
-   mc->fontx = 0;
-   debug3("combinig char %x %x -> %x\n", c1, c, i + 0xd800);
--  comb_tofront(root, i);
-+  comb_tofront(i);
- }
- 
- #else /* !UTF8 */
diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index ca74ba8913..a261d3100d 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/screen/screen-4.8.0.tar.gz.sig
-sha256 6e11b13d8489925fde25dfb0935bf6ed71f9eb47eff233a181e078fde5655aa1  screen-4.8.0.tar.gz
+# https://ftp.gnu.org/gnu/screen/screen-4.9.0.tar.gz.sig
+sha256  f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d084271e0289c730f4  screen-4.9.0.tar.gz
 # Locally calculated
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 843c71fc2a..3239a1c1f3 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 4.8.0
+SCREEN_VERSION = 4.9.0
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPL-3.0+
 SCREEN_LICENSE_FILES = COPYING
@@ -16,9 +16,6 @@ SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
 SCREEN_CONF_OPTS = --enable-colors256
 SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
-# 0008_CVE-2021-26937.patch
-SCREEN_IGNORE_CVES += CVE-2021-26937
-
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 SCREEN_DEPENDENCIES += linux-pam
 SCREEN_CONF_OPTS += --enable-pam

--===============4075982504635993482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4075982504635993482==--
