Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B131C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 07:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 032326135D;
	Fri,  8 Jul 2022 07:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 032326135D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxEXwVC-dYGU; Fri,  8 Jul 2022 07:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1D8860B12;
	Fri,  8 Jul 2022 07:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1D8860B12
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE1731BF403
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 07:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9725423C4
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 07:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9725423C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPWRLtBVvDWu for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 07:38:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8BF541A07
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 07:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8BF541A07
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 988E281F75; Fri,  8 Jul 2022 07:25:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Jul 2022 09:37:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 227b162728782ff501085984afe6be9ec69d013c
X-Git-Newrev: 3ad7ba90c0e87212b710376dcf61eeabbe4470f5
X-Patchwork-Hint: ignore
Message-Id: <20220708072529.988E281F75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libstrophe: bump to version 0.12.1
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
Content-Type: multipart/mixed; boundary="===============2427852161624040587=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2427852161624040587==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3ad7ba90c0e87212b710376dcf61eeabbe4470f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patch 0001-fix-ssize_t.patch

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libstrophe/0001-fix-ssize_t.patch | 49 -------------------------------
 package/libstrophe/libstrophe.hash        |  2 +-
 package/libstrophe/libstrophe.mk          |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/package/libstrophe/0001-fix-ssize_t.patch b/package/libstrophe/0001-fix-ssize_t.patch
deleted file mode 100644
index 39b456de57..0000000000
--- a/package/libstrophe/0001-fix-ssize_t.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From f31ef9c35c9bba831510777d551c4179295b208f Mon Sep 17 00:00:00 2001
-From: Michael Vetter <jubalh@iodoru.org>
-Date: Mon, 30 May 2022 14:47:44 +0200
-Subject: [PATCH] Include sys/types.h for ssize_t
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When compiling on buildroot I get:
-`src/tls.c:235:28: error: ‘ssize_t’ undeclared (first use in this
-function); did you mean ‘size_t’? `
-
-To have this POSIX type available we will need to include
-`sys/types.h` on Linux. Unsure about other systems.
-
-Upstream: https://github.com/strophe/libstrophe/pull/207
-Signed-off-by: Michael Vetter <jubalh@iodoru.org>
----
- src/rand.c | 1 +
- src/tls.c  | 4 ++++
- 2 files changed, 5 insertions(+)
-
-diff --git a/src/rand.c b/src/rand.c
-index 061e85ee..25e4614a 100644
---- a/src/rand.c
-+++ b/src/rand.c
-@@ -28,6 +28,7 @@
- #if __GLIBC_PREREQ(2, 25)
- #define USE_GETRANDOM
- #include <sys/random.h>
-+#include <sys/types.h>
- #include <errno.h>
- #endif
- #endif
-diff --git a/src/tls.c b/src/tls.c
-index 17d85dda..54746baa 100644
---- a/src/tls.c
-+++ b/src/tls.c
-@@ -21,6 +21,10 @@
- #include <stdarg.h>
- #include <string.h>
- 
-+#if defined(__linux__)
-+#include <sys/types.h>
-+#endif
-+
- #include "strophe.h"
- 
- #include "common.h"
diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index 66ff0e7e7e..fa9148ed0f 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8e44acb26018816f9856626bd5ff924a36cc612d2b3747ee634d626326b72df7  libstrophe-0.12.0.tar.xz
+sha256  5da0a4e12e383393614376f8b47f8b91703c8fc5a564aacfc9db6b98d6a6a9bf  libstrophe-0.12.1.tar.xz
 sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index f48d073770..ce99c9fe48 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.12.0
+LIBSTROPHE_VERSION = 0.12.1
 LIBSTROPHE_SOURCE = libstrophe-$(LIBSTROPHE_VERSION).tar.xz
 LIBSTROPHE_SITE = https://github.com/strophe/libstrophe/releases/download/$(LIBSTROPHE_VERSION)
 LIBSTROPHE_DEPENDENCIES = host-pkgconf

--===============2427852161624040587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2427852161624040587==--
