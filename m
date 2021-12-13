Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36E2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A66A81351;
	Mon, 13 Dec 2021 21:18:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1aQmxolJu7S3; Mon, 13 Dec 2021 21:18:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C158181365;
	Mon, 13 Dec 2021 21:18:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCA6E1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EC4281322
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KO8V7MiByrLu for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8823C81365
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AE0EB83825; Mon, 13 Dec 2021 21:09:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 20:28:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 027a12de4d824da4c972e67d3b1270d674886353
X-Git-Newrev: 4b5947b05be94f340dbb6faf784b9837b51b8eb8
X-Patchwork-Hint: ignore
Message-Id: <20211213210951.AE0EB83825@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/iwd: bump version
 to 1.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b5947b05be94f340dbb6faf784b9837b51b8eb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- remove 0001-configure.ac-fix-static-build-with-readline.patch
  (upstream [1])

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=62d31539d6e31a40d7d33c73637e37b50c59ef40

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 542097b11a4a98a279079ac93f4e549cf8a3f991)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nfigure.ac-fix-static-build-with-readline.patch | 61 ----------------------
 package/iwd/iwd.hash                               |  2 +-
 package/iwd/iwd.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 63 deletions(-)

diff --git a/package/iwd/0001-configure.ac-fix-static-build-with-readline.patch b/package/iwd/0001-configure.ac-fix-static-build-with-readline.patch
deleted file mode 100644
index 37dbdb18e5..0000000000
--- a/package/iwd/0001-configure.ac-fix-static-build-with-readline.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 358e0755c3a434d7a815519b8c10ae5d347caad0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 16 Dec 2020 07:51:04 +0100
-Subject: [PATCH] configure.ac: fix static build with readline
-
-Retrieve the dependencies of readline through pkg-config (and fallback
-to -lreadline) to avoid the following build failure:
-
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /nvme/rc-buildroot-test/scripts/instance-0/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libreadline.a(display.o): in function `cr':
-display.c:(.text+0x1ab): undefined reference to `tputs'
-
-Fixes:
- - http://autobuild.buildroot.org/results/8fb1341f2f5094c346456b43b4fc04996c2e1485
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://lists.01.org/hyperkitty/list/iwd@lists.01.org/thread/NFI4P52Y65T6XX7S7DGIVDMZISNQWUUC/]
----
- Makefile.am  | 4 ++--
- configure.ac | 3 +++
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 3cd7eaa6..493d06cc 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -288,7 +288,7 @@ client_iwctl_SOURCES = client/main.c \
- 			client/network.h client/network.c \
- 			client/properties.h client/properties.c \
- 			client/wsc.c client/station.c
--client_iwctl_LDADD = $(ell_ldadd) -lreadline
-+client_iwctl_LDADD = $(ell_ldadd) $(READLINE_LIBS)
- 
- if MANUAL_PAGES
- man_MANS += client/iwctl.1
-@@ -504,7 +504,7 @@ unit_test_client_SOURCES = unit/test-client.c \
- 				client/display.h client/display.c \
- 				client/network.h client/network.c \
- 				client/properties.h client/properties.c
--unit_test_client_LDADD = $(ell_ldadd) -lreadline
-+unit_test_client_LDADD = $(ell_ldadd) $(READLINE_LIBS)
- endif
- 
- unit_test_sae_SOURCES = unit/test-sae.c \
-diff --git a/configure.ac b/configure.ac
-index 7bd917a4..52f27ed9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -154,6 +154,9 @@ AC_ARG_ENABLE([client], AC_HELP_STRING([--disable-client],
- if (test "${enable_client}" != "no"); then
- 	AC_CHECK_HEADERS(readline/readline.h, enable_readline=yes,
- 			AC_MSG_ERROR(readline header files are required))
-+	PKG_CHECK_MODULES(READLINE, readline, dummy=yes, READLINE_LIBS=-lreadline)
-+	AC_SUBST(READLINE_CFLAGS)
-+	AC_SUBST(READLINE_LIBS)
- fi
- AM_CONDITIONAL(CLIENT, test "${enable_client}" != "no")
- 
--- 
-2.29.2
-
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index f1ee23dc5d..b043af745d 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c3ea43eccf27bb92d4e4482ff407cdabd2d1a1e4647d646241de87f2774e9a20  iwd-1.10-br1.tar.gz
+sha256  c0d827f446012cd14e63d174d52b69b0806ae23f0708933d50c57fea64af9c8a  iwd-1.12-br1.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 652beb838f..f38552de99 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.10
+IWD_VERSION = 1.12
 IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
 IWD_SITE_METHOD = git
 IWD_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
