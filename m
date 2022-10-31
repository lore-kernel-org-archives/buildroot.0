Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A982FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7C398135D;
	Mon, 31 Oct 2022 10:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7C398135D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3WnXms-_pK_s; Mon, 31 Oct 2022 10:36:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D45BD81261;
	Mon, 31 Oct 2022 10:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D45BD81261
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F00031BF3EC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBE3581261
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBE3581261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wNesOMlrV2gO for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:36:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3551F80F3D
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3551F80F3D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CAD287891; Mon, 31 Oct 2022 10:36:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 11:32:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8369ff62db68ad911e8fac55881006c75af8b86e
X-Git-Newrev: e3975ec7d4b478ec6c1ba56b63cbb5bccfb9dd09
X-Patchwork-Hint: ignore
Message-Id: <20221031103651.1CAD287891@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/catatonit: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e3975ec7d4b478ec6c1ba56b63cbb5bccfb9dd09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

catatonit is a simple but valid init binary to act as PID 1 for containers.

https://github.com/openSUSE/catatonit

Dependency of podman.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...figure.ac-call-AM_INIT_AUTOMAKE-only-once.patch | 41 ++++++++++++++++++++++
 package/catatonit/Config.in                        |  8 +++++
 package/catatonit/catatonit.hash                   |  3 ++
 package/catatonit/catatonit.mk                     | 14 ++++++++
 6 files changed, 68 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 82776cc14d..5939361ba8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -533,6 +533,7 @@ F:	package/python-pylibftdi/
 
 N:	Christian Stewart <christian@paral.in>
 F:	package/batman-adv/
+F:	package/catatonit/
 F:	package/containerd/
 F:	package/crun/
 F:	package/delve/
diff --git a/package/Config.in b/package/Config.in
index 7ae354d6eb..cbdaed2279 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2531,6 +2531,7 @@ comment "Utilities"
 	source "package/apg/Config.in"
 	source "package/at/Config.in"
 	source "package/bash-completion/Config.in"
+	source "package/catatonit/Config.in"
 	source "package/ccrypt/Config.in"
 	source "package/crudini/Config.in"
 	source "package/dialog/Config.in"
diff --git a/package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch b/package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
new file mode 100644
index 0000000000..b978a827a1
--- /dev/null
+++ b/package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
@@ -0,0 +1,41 @@
+From 99bb9048f532257f3a2c3856cfa19fe957ab6cec Mon Sep 17 00:00:00 2001
+From: Antonio Terceiro <terceiro@debian.org>
+Date: Thu, 4 Nov 2021 07:37:13 -0300
+Subject: [PATCH] configure.ac: call AM_INIT_AUTOMAKE only once
+
+That second call seems to be there since the beginning, and autoconf
+2.69 was fine with it. autoconf 2.71 doesn't allow it anymore:
+
+    $ ./autogen.sh
+    autoreconf: export WARNINGS=
+    autoreconf: Entering directory '.'
+    autoreconf: configure.ac: not using Gettext
+    autoreconf: running: aclocal --force
+    configure.ac:34: error: AM_INIT_AUTOMAKE expanded multiple times
+    /usr/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
+    configure.ac:19: the top level
+    /usr/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
+    configure.ac:34: the top level
+    autom4te: error: /usr/bin/m4 failed with exit status: 1
+    aclocal: error: /usr/bin/autom4te failed with exit status: 1
+    autoreconf: error: aclocal failed with exit status: 1
+
+Signed-off-by: Antonio Terceiro <terceiro@debian.org>
+Upstream: https://github.com/openSUSE/catatonit/commit/99bb9048f532257f3a2c3856cfa19fe957ab6cec
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 12c9186..94c5c84 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -31,4 +31,3 @@ AC_FUNC_FORK
+ 
+ AC_CONFIG_FILES([Makefile config.h])
+ AC_OUTPUT
+-AM_INIT_AUTOMAKE
+-- 
+2.37.2
+
diff --git a/package/catatonit/Config.in b/package/catatonit/Config.in
new file mode 100644
index 0000000000..2bd3ab6717
--- /dev/null
+++ b/package/catatonit/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CATATONIT
+	bool "catatonit"
+	depends on BR2_USE_MMU
+	help
+	  catatonit is a simple but valid init binary to act as
+	  PID 1 for containers.
+
+	  https://github.com/openSUSE/catatonit
diff --git a/package/catatonit/catatonit.hash b/package/catatonit/catatonit.hash
new file mode 100644
index 0000000000..9b7420cdb7
--- /dev/null
+++ b/package/catatonit/catatonit.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e22bc72ebc23762dad8f5d2ed9d5ab1aaad567bdd54422f1d1da775277a93296  catatonit-0.1.7.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/catatonit/catatonit.mk b/package/catatonit/catatonit.mk
new file mode 100644
index 0000000000..3dd58eff1d
--- /dev/null
+++ b/package/catatonit/catatonit.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# catatonit
+#
+################################################################################
+
+CATATONIT_VERSION = 0.1.7
+CATATONIT_SITE = $(call github,openSUSE,catatonit,v$(CATATONIT_VERSION))
+CATATONIT_LICENSE = GPL-3.0+
+CATATONIT_LICENSE_FILES = COPYING
+
+CATATONIT_AUTORECONF = YES
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
