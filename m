Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EC9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 21:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A52F8856E2;
	Sat, 11 Dec 2021 21:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMcXHy7S8gHK; Sat, 11 Dec 2021 21:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FC29856DE;
	Sat, 11 Dec 2021 21:10:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C76231BF3A0
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C43396111B
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMI88w1jBdWB for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 21:10:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ACFC61114
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 21:10:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E52F182977; Sat, 11 Dec 2021 21:05:04 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 22:09:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e13c9ccf436cf13b53bec6933e5be4bb071cfad9
X-Git-Newrev: 6066557ace0f85805b00883ae9aeb1f2248ea185
X-Patchwork-Hint: ignore
Message-Id: <20211211210504.E52F182977@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ply: bump to version 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6066557ace0f85805b00883ae9aeb1f2248ea185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patches which are now included in version 2.2.0 and no longer
needed.

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...onfigure.ac-fix-error-with-version-string.patch | 29 ----------------------
 .../0002-printxf.h-add-stdarg.h-in-include.patch   | 27 --------------------
 package/ply/ply.hash                               |  2 +-
 package/ply/ply.mk                                 |  2 +-
 4 files changed, 2 insertions(+), 58 deletions(-)

diff --git a/package/ply/0001-configure.ac-fix-error-with-version-string.patch b/package/ply/0001-configure.ac-fix-error-with-version-string.patch
deleted file mode 100644
index e80599c649..0000000000
--- a/package/ply/0001-configure.ac-fix-error-with-version-string.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 684bae6043fa2242a5c6551c3f260c9db0cf7dc8 Mon Sep 17 00:00:00 2001
-From: Andreas Klinger <ak@it-klinger.de>
-Date: Mon, 4 Jan 2021 08:40:50 +0100
-Subject: [PATCH] configure.ac: fix error with version string
-
-When autoreconfiguring there's an error: "configure.ac:6: error: AC_INIT
-should be called with package and version arguments".
-
-Put version string in square brackets to satisfy autoconfigure.
-
-Signed-off-by: Andreas Klinger <ak@it-klinger.de>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 65387d6..7a0054e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,5 +1,5 @@
- AC_PREREQ(2.61)
--AC_INIT(ply, m4_esyscmd_s(git describe --always --dirty),
-+AC_INIT(ply, [2.1.1],
- 	     https://github.com/wkz/ply/issues)
- 
- AC_GNU_SOURCE
--- 
-2.20.1
-
diff --git a/package/ply/0002-printxf.h-add-stdarg.h-in-include.patch b/package/ply/0002-printxf.h-add-stdarg.h-in-include.patch
deleted file mode 100644
index f56e9a8e72..0000000000
--- a/package/ply/0002-printxf.h-add-stdarg.h-in-include.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3fb3cb779c535ec28cbba80573bbea42435108c0 Mon Sep 17 00:00:00 2001
-From: Andreas Klinger <ak@it-klinger.de>
-Date: Mon, 4 Jan 2021 20:48:41 +0100
-Subject: [PATCH] printxf.h: add stdarg.h in include
-
-Include of <stdarg.h> is needed for va_list.
-
-Signed-off-by: Andreas Klinger <ak@it-klinger.de>
----
- include/ply/printxf.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/ply/printxf.h b/include/ply/printxf.h
-index a59f0d2..e985936 100644
---- a/include/ply/printxf.h
-+++ b/include/ply/printxf.h
-@@ -8,6 +8,7 @@
- #define _PRINTXF_H
- 
- #include <stdio.h>
-+#include <stdarg.h>
- 
- struct printxf;
- 
--- 
-2.20.1
-
diff --git a/package/ply/ply.hash b/package/ply/ply.hash
index 0ee2709b30..df01ae08e0 100644
--- a/package/ply/ply.hash
+++ b/package/ply/ply.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cecf0913c65027750ac3272e936110c9f843435938f9ca2edbc34e99ba6c00e2  ply-2.1.1.tar.gz
+sha256  8cd92fc8784873fb0507bc11f3f62a31d0345c64914ddaadb958d8b2d6de0100  ply-2.2.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ply/ply.mk b/package/ply/ply.mk
index b72b29f315..b3c56bd9a5 100644
--- a/package/ply/ply.mk
+++ b/package/ply/ply.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PLY_VERSION = 2.1.1
+PLY_VERSION = 2.2.0
 PLY_SITE = $(call github,wkz,ply,$(PLY_VERSION))
 PLY_AUTORECONF = YES
 PLY_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
