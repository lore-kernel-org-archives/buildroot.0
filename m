Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97010C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 10:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 198436117E;
	Thu, 21 Apr 2022 10:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0eQaaxb66tJM; Thu, 21 Apr 2022 10:24:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 472DC61177;
	Thu, 21 Apr 2022 10:24:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AADAA1BF487
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 10:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9885041B57
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 10:24:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A0h9VfinLol0 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 10:24:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-36.italiaonline.it [213.209.10.36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81FD741B51
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 10:24:18 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([87.0.15.73])
 by smtp-36.iol.local with ESMTPA
 id hTywnlopMc2f5hTywn9mRc; Thu, 21 Apr 2022 12:24:15 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1650536655; bh=FJhr9YoAEsFKnx/qNjZqqusg1TXxCZKlr3GZ0PQmqhA=;
 h=From;
 b=dEsAu/yDA8hGc8eCPBdc9QCPpC6NjCWg17WT0ucwbJW16ujzx7+sfUqk0SFofQRzM
 lznMDa87k9S5SyXPv8N2ARc5Ba0OEnh3ih0GUbjgbMrFhu5ljTPm3P34HDuSuQH9uy
 KWFwbSToyKR6JO13aNrRkSkhK9zSgvcxiUz3znaMTrrCmz+I/295jWHGkVEx8FHTm+
 E0FeH6KHcJp3cc012kzJxWUyt6RxF4NIB0vSt1ruePUjVkvvD8aWfgTtp1zOb8ekR0
 EsMzBBhPUBsnMf2S1vL+3QpTGkpes6rHmP5y5V4i1EcLFEZFlNpYk3PMGY7lJcR0sa
 WkeAyMjkKr7Cg==
X-CNFS-Analysis: v=2.4 cv=Z6kpoFdA c=1 sm=1 tr=0 ts=626130cf cx=a_exe
 a=h5x6SpL9bzIPZN26QICeQA==:117 a=h5x6SpL9bzIPZN26QICeQA==:17 a=CCpqsmhAAAAA:8
 a=iP-xVBlJAAAA:8 a=Vt2AcnKqAAAA:8 a=FP58Ms26AAAA:8 a=3__m8vwM-3jtNlyLe8sA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=lHLH-nfn2y1bM_0xSXwp:22 a=v10HlyRyNeVhbzM4Lqgd:22
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 12:24:10 +0200
Message-Id: <20220421102410.3794-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfJ5ZBQ+nLfJIUoyOhKsdCZnvYHVUEToxIlD5doY+3jRtpLrg+1QwS5XxRTXo2Re8KQI4mOiivqp99vKAAyExg4ak1d8yj8EHY4XyaxkDrDsXsjYvMZsp
 J+lIBze6ADbg5JvnYfLL9ZHtjwPbd5r3i+OkqRKQS+PGgQLzIvUvaZprxt1Vtz4Y5sgksEdUDtQ+MghZEEgkUceZbcjZZS0di11iGxi4IqSNBSreM4vMKqm9
 4+P0K61B4OL2pf3iLEFKP0gCN8+zGfAcKS+o/aryEjU1LinjUpM7IU0MclrX4k0FJBrFRntu9I1K5NH1weTssH2NhIV94X8PTj6aNTqhVRzLkyoOCQu7iW6u
 6gkAlE19
Subject: [Buildroot] [PATCH 1/1] package/valgrind: fix compilation for uclibc
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Add upstream patch ([1]) to fix compilation for uclibc

- Add autoreconf as the patch touches configure.ac

[1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=9c9fd9ae24b45f915f0759d32f662835c26d37c3

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...coregrind-fix-compilation-for-uclibc.patch | 65 +++++++++++++++++++
 package/valgrind/valgrind.mk                  |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch

diff --git a/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch b/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch
new file mode 100644
index 0000000000..ff8dc974d8
--- /dev/null
+++ b/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch
@@ -0,0 +1,65 @@
+From 9c9fd9ae24b45f915f0759d32f662835c26d37c3 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Fri, 8 Apr 2022 12:36:33 +0200
+Subject: [PATCH] coregrind: fix compilation for uclibc
+
+It fixes a known iusse whose details are described at [1] and more
+generally it guarantees that Valgrind is properly compiled for ulibc.
+
+[1] https://www.mail-archive.com/valgrind-users@lists.sourceforge.net/msg05295.html
+
+Suggested-by Michael Trimarchi <michael@amarulasolutions.com>
+Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ configure.ac                        | 2 ++
+ coregrind/m_debuginfo/minilzo-inl.c | 4 ++++
+ coregrind/vg_preloaded.c            | 4 ++++
+ 3 files changed, 10 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 6f51dfd9f8fb..c627a9c17a4a 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -1204,6 +1204,8 @@ AC_SUBST(DEFAULT_SUPP)
+ AC_CHECK_HEADER([features.h])
+ 
+ if test x$ac_cv_header_features_h = xyes; then
++  AC_DEFINE([HAVE_HEADER_FEATURES_H], 1,
++          [Define to 1 if you have the `features.h' header.])
+   rm -f conftest.$ac_ext
+   cat <<_ACEOF >conftest.$ac_ext
+ #include <features.h>
+diff --git a/coregrind/m_debuginfo/minilzo-inl.c b/coregrind/m_debuginfo/minilzo-inl.c
+index 153d008fd44f..b45ec92eaa85 100644
+--- a/coregrind/m_debuginfo/minilzo-inl.c
++++ b/coregrind/m_debuginfo/minilzo-inl.c
+@@ -1875,6 +1875,10 @@ extern "C" {
+ 
+ #endif
+ 
++#ifdef HAVE_HEADER_FEATURES_H
++#include <features.h>
++#endif
++
+ #undef LZO_HAVE_CONFIG_H
+ #include "minilzo.h"
+ 
+diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
+index 5e2098390847..3809811aede7 100644
+--- a/coregrind/vg_preloaded.c
++++ b/coregrind/vg_preloaded.c
+@@ -45,6 +45,10 @@
+ #include "pub_core_debuginfo.h"  // Needed for pub_core_redir.h
+ #include "pub_core_redir.h"      // For VG_NOTIFY_ON_LOAD
+ 
++#ifdef HAVE_HEADER_FEATURES_H
++#include <features.h>
++#endif
++
+ #if defined(VGO_linux) || defined(VGO_solaris) || defined(VGO_freebsd)
+ 
+ /* ---------------------------------------------------------------------
+-- 
+2.32.0
+
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 52f2a04ffa..a5600a81b8 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -14,6 +14,7 @@ VALGRIND_CONF_OPTS = \
 	--disable-ubsan \
 	--without-mpicc
 VALGRIND_INSTALL_STAGING = YES
+VALGRIND_AUTORECONF=YES
 
 # Valgrind must be compiled with no stack protection, so forcefully
 # pass -fno-stack-protector to override what Buildroot may have in
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
