Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D61FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 16:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 990B960AE2;
	Thu, 13 Jan 2022 16:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OaAoBXvKSBnh; Thu, 13 Jan 2022 16:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5319F60E8A;
	Thu, 13 Jan 2022 16:37:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D0191BF4DB
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 16:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79F938322E
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 16:37:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VTElrpqVqEfP for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 16:37:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6F77831A9
 for <buildroot@busybox.net>; Thu, 13 Jan 2022 16:37:06 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 41E73440A0A;
 Thu, 13 Jan 2022 18:36:59 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1642091819;
 bh=9wbpWOd3N8jBHcuOlBYgc3mUxDJKq70OI9C9DeDf720=;
 h=From:To:Cc:Subject:Date:From;
 b=rsbdo2ZKhDfo+X4gFdkhpxogmuo6Yn/0dqTQAwt71s0MPuHnp6q3QgEK+3SWKADB8
 5VztlZVX99m/GR2wLtGbjB77trBqObFRp5BKz3Rj/o63IM74UT+Rh2crmjXwN73y7s
 vJ1RlGWOQ9rqprDOBC3jLeRvztcBurGLMWbQdkGilXSGiSGpu91tmMLUif97n0d+y9
 C9r9fpwjZRHM078Ybz/F2xJ5NKwhFx/+XBnfVVCjrXWDFuhKuxsevlQxDQ24tgQshr
 1gQ53U5iNw+MWklJ11TOoUPZ79+9SJ5oAaB7nZmwDbRBaKLG2q2iMglTV6mMop0MUi
 qFSiQ/xyBuGig==
To: buildroot@busybox.net
Date: Thu, 13 Jan 2022 18:36:58 +0200
Message-Id: <541525e413f6b72c67b8602fc88e916486931d5f.1642091818.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/socat: bump to version 1.7.4.3
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update README hash for version number change.

Add a patch fixing build with musl.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...-correct-the-getprotobynumber_r-test.patch | 43 +++++++++++++++++++
 package/socat/socat.hash                      |  6 +--
 package/socat/socat.mk                        |  2 +-
 3 files changed, 47 insertions(+), 4 deletions(-)
 create mode 100644 package/socat/0003-configure.ac-correct-the-getprotobynumber_r-test.patch

diff --git a/package/socat/0003-configure.ac-correct-the-getprotobynumber_r-test.patch b/package/socat/0003-configure.ac-correct-the-getprotobynumber_r-test.patch
new file mode 100644
index 000000000000..de9540553191
--- /dev/null
+++ b/package/socat/0003-configure.ac-correct-the-getprotobynumber_r-test.patch
@@ -0,0 +1,43 @@
+From d56a11beb9b181fd91a70a6d703dfbdfe887122a Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 13 Jan 2022 17:56:10 +0200
+Subject: [PATCH] configure.ac: correct the getprotobynumber_r test
+
+The AC_TRY_COMPILE test succeeds even when libc does not provide the
+tested symbol. The compiler produces a warning, but exits successfully.
+Use AC_TRY_LINK that will only succeeds if libc provides the symbol.
+
+This fixes build with musl libc that does not support
+getprotobynumber_r().
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: sent to socat@dest-unreach.org
+
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d4acc9e7e6f5..973a7f2218c9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -137,13 +137,13 @@ AC_MSG_RESULT($sc_cv_have_prototype_hstrerror)
+ # getprotobynumber_r() is not standardized
+ AC_MSG_CHECKING(for getprotobynumber_r() variant)
+ AC_CACHE_VAL(sc_cv_getprotobynumber_r,
+-[AC_TRY_COMPILE([#include <stddef.h>
++[AC_TRY_LINK([#include <stddef.h>
+ #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL,1024,NULL);],
+ [sc_cv_getprotobynumber_r=1; tmp_bynum_variant=Linux],
+- [AC_TRY_COMPILE([#include <stddef.h>
++ [AC_TRY_LINK([#include <stddef.h>
+  #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL,1024);],
+  [sc_cv_getprotobynumber_r=2; tmp_bynum_variant=Solaris],
+-  [AC_TRY_COMPILE([#include <stddef.h>
++  [AC_TRY_LINK([#include <stddef.h>
+   #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL);],
+   [sc_cv_getprotobynumber_r=3; tmp_bynum_variant=AIX],
+ 
+-- 
+2.34.1
+
diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 0d9d0ba76c9d..4f7ff5328e28 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  003686f80d820072649660b85f80c58f  socat-1.7.4.2.tar.bz2
+md5  5c28dd258ba928326d0716fcb4895cc2  socat-1.7.4.3.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  6690a9f9990457b505097a272bbf2cbf4cc35576176f76646e3524b0e91c1763  socat-1.7.4.2.tar.bz2
+sha256  d47318104415077635119dfee44bcfb41de3497374a9a001b1aff6e2f0858007  socat-1.7.4.3.tar.bz2
 # Locally calculated
-sha256  062e425b43da6b3df6d8657639b5e2c781781572b5d8867444fd6d2487ac7644  README
+sha256  432aebfec164bedcaada7cdf2849e1f003fa00a91a0a1ed34d7cf4abe980f5fb  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index cf2a31b0969c..e20577492d86 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.7.4.2
+SOCAT_VERSION = 1.7.4.3
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
