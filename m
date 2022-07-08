Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57919C43334
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 07:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2E9941187;
	Fri,  8 Jul 2022 07:33:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2E9941187
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbztCRGGsGor; Fri,  8 Jul 2022 07:33:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D60040500;
	Fri,  8 Jul 2022 07:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D60040500
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF78B1BF403
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 07:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A817E416C1
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 07:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A817E416C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEOVRgf8drX1 for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 07:33:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 559C94168D
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 07:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 559C94168D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3A22882DB6; Fri,  8 Jul 2022 07:19:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Jul 2022 09:19:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b38fff43a7d54dcddd02114cb32bcb82a061fa64
X-Git-Newrev: b1d6180442412778564f5c7e81ae23c87d19ffa7
X-Patchwork-Hint: ignore
Message-Id: <20220708071958.3A22882DB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/evtest: bump to version 1.35
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
Content-Type: multipart/mixed; boundary="===============5240978563751349021=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5240978563751349021==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b1d6180442412778564f5c7e81ae23c87d19ffa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- host-pkgconf is not needed since
  https://cgit.freedesktop.org/evtest/commit/?id=2cebc0ab5c36c4f81d35677c46b245de849ed062
- Update indentation in hash file (two spaces)

https://lists.freedesktop.org/archives/input-tools/2022-May/001578.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../evtest/0001-Add-missing-limits.h-include.patch | 38 ------------------
 ...x-build-on-32bit-arches-with-64bit-time_t.patch | 46 ----------------------
 package/evtest/evtest.hash                         |  4 +-
 package/evtest/evtest.mk                           |  3 +-
 4 files changed, 3 insertions(+), 88 deletions(-)

diff --git a/package/evtest/0001-Add-missing-limits.h-include.patch b/package/evtest/0001-Add-missing-limits.h-include.patch
deleted file mode 100644
index 6c7fc90482..0000000000
--- a/package/evtest/0001-Add-missing-limits.h-include.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7d7c5a81b0e2f3321d269b7acc450d1eec7a910b Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 18 Aug 2019 09:57:23 +0300
-Subject: [PATCH] Add missing limits.h include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes build with musl libc that does not include limits.h indirectly via
-other headers.
-
-evtest.c: In function ‘scan_devices’:
-evtest.c:886:14: error: ‘PATH_MAX’ undeclared (first use in this function); did you mean  INT8_MAX’?
-   char fname[PATH_MAX];
-              ^~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: sent to input-tools@lists.freedesktop.org (moderated)
-
- evtest.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/evtest.c b/evtest.c
-index 37d4f8540333..548c203564d3 100644
---- a/evtest.c
-+++ b/evtest.c
-@@ -56,6 +56,7 @@
- #include <getopt.h>
- #include <ctype.h>
- #include <signal.h>
-+#include <limits.h>
- #include <sys/time.h>
- #include <sys/types.h>
- #include <unistd.h>
--- 
-2.23.0.rc1
-
diff --git a/package/evtest/0002-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/package/evtest/0002-Fix-build-on-32bit-arches-with-64bit-time_t.patch
deleted file mode 100644
index e39ccb641f..0000000000
--- a/package/evtest/0002-Fix-build-on-32bit-arches-with-64bit-time_t.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 70c5dd9e858ed577a4bbe7ec8920934c89df08fc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Nov 2019 11:58:58 -0800
-Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
-
-time element is deprecated on new input_event structure in kernel's
-input.h [1]
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 648f5c1a9e0
-
- evtest.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/evtest.c b/evtest.c
-index 548c203564d3..8d592f42bdca 100644
---- a/evtest.c
-+++ b/evtest.c
-@@ -61,6 +61,11 @@
- #include <sys/types.h>
- #include <unistd.h>
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- #define BITS_PER_LONG (sizeof(long) * 8)
- #define NBITS(x) ((((x)-1)/BITS_PER_LONG)+1)
- #define OFF(x)  ((x)%BITS_PER_LONG)
-@@ -1140,7 +1145,7 @@ static int print_events(int fd)
- 			type = ev[i].type;
- 			code = ev[i].code;
- 
--			printf("Event: time %ld.%06ld, ", ev[i].time.tv_sec, ev[i].time.tv_usec);
-+			printf("Event: time %ld.%06ld, ", ev[i].input_event_sec, ev[i].input_event_usec);
- 
- 			if (type == EV_SYN) {
- 				if (code == SYN_MT_REPORT)
--- 
-2.25.1
-
diff --git a/package/evtest/evtest.hash b/package/evtest/evtest.hash
index b1ee24371e..0ed51df4e4 100644
--- a/package/evtest/evtest.hash
+++ b/package/evtest/evtest.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256 0e7a2eeff380af796e5e9b21b6f48fd706c58c931162c151c2c1074bdfeb85c6 evtest-evtest-1.34.tar.gz
+sha256  06dfe6b9760b78f3f73aca2120cbcb79339b33e59d5c79a49b4bd5d34844b054  evtest-evtest-1.35.tar.gz
 
 # License files
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index 8b8667e045..65897a41e6 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-EVTEST_VERSION = 1.34
+EVTEST_VERSION = 1.35
 EVTEST_SOURCE = evtest-evtest-$(EVTEST_VERSION).tar.gz
 EVTEST_SITE = https://gitlab.freedesktop.org/libevdev/evtest/-/archive/evtest-$(EVTEST_VERSION)
 EVTEST_LICENSE = GPL-2.0+
 EVTEST_LICENSE_FILES = COPYING
-EVTEST_DEPENDENCIES = host-pkgconf
 # needed because source package contains no generated files
 EVTEST_AUTORECONF = YES
 

--===============5240978563751349021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5240978563751349021==--
