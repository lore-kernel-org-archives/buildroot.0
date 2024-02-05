Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A498CC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5305D4176A;
	Mon,  5 Feb 2024 09:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5305D4176A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INm02jwtJ6qM; Mon,  5 Feb 2024 09:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63D664176C;
	Mon,  5 Feb 2024 09:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63D664176C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D14C1BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 748DB40A06
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 748DB40A06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3tvWJsJxL2J for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:46:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EC0C40204
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EC0C40204
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29EFA8699D; Mon,  5 Feb 2024 09:46:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 10:46:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b90ef61784d314147ace4972f9bdc0cb4fcce77
X-Git-Newrev: 7794fa4c4e1d19a245bb0367cde94560432a2bc5
X-Patchwork-Hint: ignore
Message-Id: <20240205094651.29EFA8699D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] packge/linux-pam: bump to version 1.6.0
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
Content-Type: multipart/mixed; boundary="===============0062796006643343876=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0062796006643343876==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7794fa4c4e1d19a245bb0367cde94560432a2bc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://github.com/linux-pam/linux-pam/releases/tag/v1.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-examples-tty_conv-fix-build-on-musl.patch | 40 ----------------------
 ...0002-Fix-build-if-crypt_r-isn-t-available.patch | 37 --------------------
 package/linux-pam/linux-pam.hash                   |  4 +--
 package/linux-pam/linux-pam.mk                     |  2 +-
 4 files changed, 3 insertions(+), 80 deletions(-)

diff --git a/package/linux-pam/0001-examples-tty_conv-fix-build-on-musl.patch b/package/linux-pam/0001-examples-tty_conv-fix-build-on-musl.patch
deleted file mode 100644
index c1257d64da..0000000000
--- a/package/linux-pam/0001-examples-tty_conv-fix-build-on-musl.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5374f677e4cae669eb9accf2449178b602e8a40a Mon Sep 17 00:00:00 2001
-From: Violet Purcell <vimproved@inventati.org>
-Date: Thu, 11 May 2023 12:50:34 -0400
-Subject: [PATCH] examples/tty_conv: fix build on musl
-
-termio.h is the old System V version of the interface header, and is
-only provided in glibc and dietlibc as far as I can tell.
-This fixes it to use the POSIX termios.h instead.
-
-Upstream: https://github.com/linux-pam/linux-pam/commit/5374f677e4cae669eb9accf2449178b602e8a40a
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- examples/tty_conv.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/examples/tty_conv.c b/examples/tty_conv.c
-index 23f0684cc..9a0e1ad99 100644
---- a/examples/tty_conv.c
-+++ b/examples/tty_conv.c
-@@ -6,8 +6,9 @@
- #include <string.h>
- #include <errno.h>
- #include <unistd.h>
--#include <termio.h>
-+#include <termios.h>
- #include <security/pam_appl.h>
-+#include <sys/ioctl.h>
- 
- /***************************************
-  * @brief echo off/on
-@@ -16,7 +17,7 @@
-  ***************************************/
- static void echoOff(int fd, int off)
- {
--    struct termio tty;
-+    struct termios tty;
-     if (ioctl(fd, TCGETA, &tty) < 0)
-     {
-         fprintf(stderr, "TCGETA failed: %s\n", strerror(errno));
diff --git a/package/linux-pam/0002-Fix-build-if-crypt_r-isn-t-available.patch b/package/linux-pam/0002-Fix-build-if-crypt_r-isn-t-available.patch
deleted file mode 100644
index c7fdd8be36..0000000000
--- a/package/linux-pam/0002-Fix-build-if-crypt_r-isn-t-available.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b82acc21f1e2f76d4cb0c75bb4958751562039ab Mon Sep 17 00:00:00 2001
-From: Bernhard Rosenkränzer <bero@lindev.ch>
-Date: Wed, 7 Jun 2023 19:49:01 +0200
-Subject: [PATCH] Fix build if crypt_r isn't available
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-retval was being defined only in #ifdef HAVE_CRYPT_R, but used
-unconditionally.
-
-Signed-off-by: Bernhard Rosenkränzer <bero@lindev.ch>
-Fixes: bcba17939e1b ("modules: make use of secure memory erasure")
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://github.com/linux-pam/linux-pam/commit/b82acc21f1e2f76d4cb0c75bb4958751562039ab
----
- modules/pam_pwhistory/opasswd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/pam_pwhistory/opasswd.c b/modules/pam_pwhistory/opasswd.c
-index 479e3fc4..fc610e2f 100644
---- a/modules/pam_pwhistory/opasswd.c
-+++ b/modules/pam_pwhistory/opasswd.c
-@@ -128,9 +128,9 @@ static int
- compare_password(const char *newpass, const char *oldpass)
- {
-   char *outval;
-+  int retval;
- #ifdef HAVE_CRYPT_R
-   struct crypt_data output;
--  int retval;
- 
-   output.initialized = 0;
- 
--- 
-2.39.2
-
diff --git a/package/linux-pam/linux-pam.hash b/package/linux-pam/linux-pam.hash
index 97acbd7adc..cd882715cb 100644
--- a/package/linux-pam/linux-pam.hash
+++ b/package/linux-pam/linux-pam.hash
@@ -1,6 +1,6 @@
 # Locally computed hashes after checking signature at
-# https://github.com/linux-pam/linux-pam/releases/download/v1.5.3/Linux-PAM-1.5.3.tar.xz.asc
+# https://github.com/linux-pam/linux-pam/releases/download/v1.6.0/Linux-PAM-1.6.0.tar.xz.asc
 # signed with the key 8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB
-sha256  7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283  Linux-PAM-1.5.3.tar.xz
+sha256  fff4a34e5bbee77e2e8f1992f27631e2329bcbf8a0563ddeb5c3389b4e3169ad  Linux-PAM-1.6.0.tar.xz
 # Locally computed
 sha256  133d98e7a2ab3ffd330b4debb0bfc10fea21e4b2b5a5b09de2e924293be5ff08  Copyright
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 92d8c952ac..89a46e81df 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_PAM_VERSION = 1.5.3
+LINUX_PAM_VERSION = 1.6.0
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.xz
 LINUX_PAM_SITE = https://github.com/linux-pam/linux-pam/releases/download/v$(LINUX_PAM_VERSION)
 LINUX_PAM_INSTALL_STAGING = YES

--===============0062796006643343876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0062796006643343876==--
