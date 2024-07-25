Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CE8C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 15:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C151C60AD4;
	Thu, 25 Jul 2024 15:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u41sk66iMltA; Thu, 25 Jul 2024 15:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 661F960AF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 661F960AF0;
	Thu, 25 Jul 2024 15:30:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 159F41BF983
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 124A7605C8
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHqioe2lftOv for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 15:30:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE30860093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE30860093
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE30860093
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 15:30:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X0QJsTikQxmtuX0QJshxcw; Thu, 25 Jul 2024 17:30:32 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 17:30:27 +0200
Message-Id: <20240725153029.613254-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEpr23CZfrKbxUOYnQ03WTr9m6uG1j4ipyCKoj5Y62dZbdKIifE0iW6R881r71xnDQ9S7YIvPiLmUgg22GPuRwDoAJmMfw+4Lq3Pk+cbko+12ZrcWUNw
 GdFRPaAdFXCXCHk1EjpZIx1/J9Fpj+fZWNwoMEFUS8rFkXZPEyeuPs0obPWn5RA5fEH8UqsEOUi+JBdXwY7XGTB5AW7ZuS+HIzQtibystpQNxk/PZMtd6Nyc
 WG65JiqSuDlk2QeGKrhiM2RkCXngpY3xLeLFM3DgwSo8uNXYSAy1eF84ib9iidVCKIjEtfkz5S9QcBXGpjHS90Vp5n1/zspBuVfGKPJnqRQsuSVFN0F2mVAF
 z8/TimFn
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1721921432; bh=eBw5EvEG9Zq/G2ynnHwKxafpSbKywIOdXhSOtEY2Els=;
 h=From:To:Subject:Date:MIME-Version;
 b=BZTGsD8Tag9gk6KFmnxfUt62/I8OQWvL73FpCakrnVC6ihQWSw9Utx8iNmGOlSCff
 yWUsSP1SlgA/oNW+gG7/2t0zHtUsCWAN7j1YNy00x1tocE55nwGmvSJu6fr6GfQAcI
 V/Fvfcbbn18OZ5Lkwf7KZtjpNM76nxwsbS274M7j0WzorIxZSt2Fg194dkLW/jpPhz
 FqLbrycMSp2dmsnc5+bAD2imlrSRremEgzATsfvm1BHS9nOMEuEsqDmjgJu9g6r2ne
 vZhPAYx/gT5xVFpaBTdo9gqiB+hCwDs7RmWgnYHVmmbCncTYbzt1Z1pOO8JH+vAxhZ
 U72py1nWxELgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=BZTGsD8T
Subject: [Buildroot] [PATCH] package/libtracefs: bump to version 1.8.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's drop local patches since they have been committed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-meson-build-tracefs-mmap-by-default.patch | 34 ----------------
 ...ATH_MAX-if-it-is-not-already-defined.patch | 40 -------------------
 package/libtracefs/libtracefs.hash            |  2 +-
 package/libtracefs/libtracefs.mk              |  2 +-
 4 files changed, 2 insertions(+), 76 deletions(-)
 delete mode 100644 package/libtracefs/0001-libtracefs-meson-build-tracefs-mmap-by-default.patch
 delete mode 100644 package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch

diff --git a/package/libtracefs/0001-libtracefs-meson-build-tracefs-mmap-by-default.patch b/package/libtracefs/0001-libtracefs-meson-build-tracefs-mmap-by-default.patch
deleted file mode 100644
index 4a462aab66..0000000000
--- a/package/libtracefs/0001-libtracefs-meson-build-tracefs-mmap-by-default.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7d15d7744d957b1721d8e202bd5095b7c449570f Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 10 Jan 2024 21:39:25 +0100
-Subject: [PATCH] libtracefs meson: build tracefs-mmap by default
-
-Accordingly to Makefile let's add tracefs-mmap.c to build, this is needed
-for linking by other object files.
-
-Link: https://lore.kernel.org/linux-trace-devel/20240110203925.266999-1-giulio.benetti@benettiengineering.com
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
-Upstream: https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/commit/?id=7d15d7744d957b1721d8e202bd5095b7c449570f
-[yann.morin.1998@free.fr: do an actual backport]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- src/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/meson.build b/src/meson.build
-index 5b76554..f7a98b9 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -11,6 +11,7 @@ sources= [
-    'tracefs-instance.c',
-    'tracefs-kprobes.c',
-    'tracefs-marker.c',
-+   'tracefs-mmap.c',
-    'tracefs-record.c',
-    'tracefs-sqlhist.c',
-    'tracefs-tools.c',
---
-2.43.0
-
diff --git a/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch b/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch
deleted file mode 100644
index 121fee5adf..0000000000
--- a/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ba750812f68f0f3314494558496c23f934f8faff Mon Sep 17 00:00:00 2001
-From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
-Date: Thu, 22 Feb 2024 11:02:46 -0500
-Subject: libtracefs utest: Add PATH_MAX if it is not already defined
-
-In some setups PATH_MAX may not be defined (it is usually defined in
-linux/limits.h), but we just use PATH_MAX as something to hold the paths
-to the tracing files. In that case, just define it to 1024 if it's not
-already defined.
-
-Link: https://lore.kernel.org/linux-trace-devel/20240222-utest-fixes-v2-1-7b8ee8dca0b7@gmail.com/
-
-Fixes: 845f16976929 ("libtracefs: Add unit tests")
-Reported-by: Miko Larsson <mikoxyzzz@gmail.com>
-Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
-
-Upstream: https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/commit/?id=ba750812f68f0f3314494558496c23f934f8faff
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- utest/tracefs-utest.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/utest/tracefs-utest.c b/utest/tracefs-utest.c
-index 963fac7..07ecd32 100644
---- a/utest/tracefs-utest.c
-+++ b/utest/tracefs-utest.c
-@@ -26,6 +26,10 @@
- 
- #define gettid() syscall(__NR_gettid)
- 
-+#ifndef PATH_MAX
-+#define PATH_MAX 1024
-+#endif
-+
- #define TRACEFS_SUITE		"tracefs library"
- #define TEST_INSTANCE_NAME	"cunit_test_iter"
- #define TEST_TRACE_DIR		"/tmp/trace_utest.XXXXXX"
--- 
-cgit 1.2.3-korg
-
diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
index ebc562eb40..e728e6431f 100644
--- a/package/libtracefs/libtracefs.hash
+++ b/package/libtracefs/libtracefs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f92475d5c4cb509983697fb359ee615bef4f08ed8bdc9c690f6118ba68886de0  libtracefs-1.8.0.tar.gz
+sha256  d295aa20d711c313a9e229dbd15ba14026f0c1a50d57ae8b0823cc561b23745f  libtracefs-1.8.1.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index ed45fcbc50..86baa5d9cd 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEFS_VERSION = 1.8.0
+LIBTRACEFS_VERSION = 1.8.1
 LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
 LIBTRACEFS_INSTALL_STAGING = YES
 LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
