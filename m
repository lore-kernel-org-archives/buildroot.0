Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B98C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B842E4048F;
	Mon,  5 Dec 2022 12:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B842E4048F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AFxOCcHSGY6y; Mon,  5 Dec 2022 12:10:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 999AB40A00;
	Mon,  5 Dec 2022 12:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 999AB40A00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E406B1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 882D8408C3
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 882D8408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXzgwVruYdiM for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05CC340613
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05CC340613
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED9A585BA2; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:48:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2d8f146a9f0ed3b66c4dd470bb76efdbb630a75
X-Git-Newrev: 1459b7a86324b7d444fa3be635533c62341b7031
X-Patchwork-Hint: ignore
Message-Id: <20221205112607.ED9A585BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/socat: bump to version 1.7.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=1459b7a86324b7d444fa3be635533c62341b7031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Update README hash for changes not related to licensing.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...re.ac-correct-the-getprotobynumber_r-test.patch | 43 ----------------------
 package/socat/socat.hash                           |  6 +--
 package/socat/socat.mk                             |  2 +-
 3 files changed, 4 insertions(+), 47 deletions(-)

diff --git a/package/socat/0003-configure.ac-correct-the-getprotobynumber_r-test.patch b/package/socat/0003-configure.ac-correct-the-getprotobynumber_r-test.patch
deleted file mode 100644
index de95405531..0000000000
--- a/package/socat/0003-configure.ac-correct-the-getprotobynumber_r-test.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d56a11beb9b181fd91a70a6d703dfbdfe887122a Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 13 Jan 2022 17:56:10 +0200
-Subject: [PATCH] configure.ac: correct the getprotobynumber_r test
-
-The AC_TRY_COMPILE test succeeds even when libc does not provide the
-tested symbol. The compiler produces a warning, but exits successfully.
-Use AC_TRY_LINK that will only succeeds if libc provides the symbol.
-
-This fixes build with musl libc that does not support
-getprotobynumber_r().
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: sent to socat@dest-unreach.org
-
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d4acc9e7e6f5..973a7f2218c9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -137,13 +137,13 @@ AC_MSG_RESULT($sc_cv_have_prototype_hstrerror)
- # getprotobynumber_r() is not standardized
- AC_MSG_CHECKING(for getprotobynumber_r() variant)
- AC_CACHE_VAL(sc_cv_getprotobynumber_r,
--[AC_TRY_COMPILE([#include <stddef.h>
-+[AC_TRY_LINK([#include <stddef.h>
- #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL,1024,NULL);],
- [sc_cv_getprotobynumber_r=1; tmp_bynum_variant=Linux],
-- [AC_TRY_COMPILE([#include <stddef.h>
-+ [AC_TRY_LINK([#include <stddef.h>
-  #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL,1024);],
-  [sc_cv_getprotobynumber_r=2; tmp_bynum_variant=Solaris],
--  [AC_TRY_COMPILE([#include <stddef.h>
-+  [AC_TRY_LINK([#include <stddef.h>
-   #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL);],
-   [sc_cv_getprotobynumber_r=3; tmp_bynum_variant=AIX],
- 
--- 
-2.34.1
-
diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 4f7ff5328e..2113e1b3a4 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  5c28dd258ba928326d0716fcb4895cc2  socat-1.7.4.3.tar.bz2
+md5  a605d3779465f42c07fc507cfbfb08f9  socat-1.7.4.4.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  d47318104415077635119dfee44bcfb41de3497374a9a001b1aff6e2f0858007  socat-1.7.4.3.tar.bz2
+sha256  fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac  socat-1.7.4.4.tar.bz2
 # Locally calculated
-sha256  432aebfec164bedcaada7cdf2849e1f003fa00a91a0a1ed34d7cf4abe980f5fb  README
+sha256  3555c6bc2779ff0f9a7145d1e3cd1d8fde59548bcd3364a23b907de21eec5aa8  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index e20577492d..0414c8adc8 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.7.4.3
+SOCAT_VERSION = 1.7.4.4
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
