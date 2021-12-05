Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45A6C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 22:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F6FC400AF;
	Sun,  5 Dec 2021 22:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ji6fxMYpvdf; Sun,  5 Dec 2021 22:07:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A08340428;
	Sun,  5 Dec 2021 22:07:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E7111BF3AD
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 22:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D71D6072D
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 22:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4QLQHxa5T6od for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 22:07:10 +0000 (UTC)
X-Greylist: delayed 00:12:41 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FEA4605C4
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 22:07:09 +0000 (UTC)
Received: from localhost ([31.220.119.62]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MpDRp-1mDSaF4AVr-00qmaS; Sun, 05 Dec 2021 22:54:25 +0100
Date: Sun, 5 Dec 2021 22:54:24 +0100
From: Andreas Klinger <ak@it-klinger.de>
To: buildroot@buildroot.org
Message-ID: <20211205215423.GA13259@arbad>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:rd2QfT+xPzozWbiLhYkXeHpuUlnJq87OkIu0AaNjSBOvvm1Pw5f
 H/BU3NRyYX8/ZX9XeBuI7LaKVMjOeFPmMgmZ6dJwKqLvm58aJ6+Kb/YEPW94/w+yJn63uDx
 rshO68HCXe9Z1LiMfaMnMCpPar8l6hjtO5t2hMAcTek3P1X4Q0mNB1qe7h7QSqyN44appLR
 43FfZ0Wlm9ZPYfMjmYSPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tJTd05UO6nc=:NtjwsgT2d/htc90oYAhuFA
 OHzR6M/WtiJ1ymAy+kqXopdXBSJ8qPAhMosKQhyLs8E/GjHCJBkmjFVK/T1E433Q9EOWCmqiA
 8TE/pJiGR2FFhB86d5tQlBKSlo8YEiuqDgLqAkyBA/5wtqCwqoodMMQxEgyaiObw0aQGlAuXx
 W2UQTXIQgBdIMrY6UKMF4Gs6gOrXCUAvB6PtJHCt1g/stH8rGdry9tIwPI9WcpurHUAJ2IGGx
 wv3UWIw19HEy3Upf1AK6RjOfN3UIRggIQLSJuD99TS94QxorK62w/sd4dFGFAIuU9gUqemMht
 f7KIhS6rgPuyFSxK95BfFh8DV4mkqPJYpj8Nbg+pJyUdcDYUZMlE+v3iZXkyqpAdduEx+pDC8
 CkxYsy3lnrTRfvgKBXx48zvUKtVbC/2qulOOJcOdukhpTC2UXhbdyiT5/biaqYfqnLW3hqTfl
 2nu8yBWK/pympkNwQtA43lshmJH3dK8x74ECU3qtRliZUF+zQvPNL/9aYq7MgXOMxmUZ2Nmiq
 +eGwKsb0xVXs0zEMreY9dcfoe6o5ru0Xsk3FHvy8F/XNnfz3nrBNXgARsKrEPgYOaTB96JvBS
 8EIWGzvPkSMbVR7lhCWlsd5LW1cUliLPB3Ho+57ggEs3p/nI072DzSCzcQZOr3pig9ceknx17
 BZ5zqffq9m1KDV6eirBWO2Oc2upazGPLU3AFvk8naaRzLBXAio64Bt8OorKs400dbDFI=
Subject: [Buildroot] [PATCH 1/1] package/ply: bump to version 2.2.0
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
Cc: Andreas Klinger <ak@it-klinger.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove patches which are now included in version 2.2.0 and no longer
needed.

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 ...ure.ac-fix-error-with-version-string.patch | 29 -------------------
 ...02-printxf.h-add-stdarg.h-in-include.patch | 27 -----------------
 package/ply/ply.hash                          |  2 +-
 package/ply/ply.mk                            |  2 +-
 4 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 package/ply/0001-configure.ac-fix-error-with-version-string.patch
 delete mode 100644 package/ply/0002-printxf.h-add-stdarg.h-in-include.patch

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
-- 
2.20.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
