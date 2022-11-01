Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA113FA373D
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 07:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68F98400FE;
	Tue,  1 Nov 2022 07:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68F98400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcpCiz_-O-ja; Tue,  1 Nov 2022 07:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76F0940439;
	Tue,  1 Nov 2022 07:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76F0940439
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 805C71BF2BE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 07:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B0FA81351
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 07:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B0FA81351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9UiY1i4V08M for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 07:42:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A358081354
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A358081354
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 07:42:09 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id A125944091D;
 Tue,  1 Nov 2022 09:39:47 +0200 (IST)
To: buildroot@busybox.net
Date: Tue,  1 Nov 2022 09:41:56 +0200
Message-Id: <d4ae10088b558134556415794a4c07d0567f4f01.1667288516.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
References: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1667288387;
 bh=tbXDdw8cJ0J7e4lksy0YEam8zXgFh4u57W9I1VOWhDE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Osz8HEIHqWjiAerxuTw5/vvgRKM/4TtCHG12Ptt/PK+uG5d2FBX2gptVjBCgPm2yI
 m6YGYjwMDH4sEpbFWQv1hFdoFxk2BzFBUWaxUfXqXTsZklCytwj04SV0EvnHnaUd3+
 kU3C0fsC+IJMcq2ucLVB6ulzvQ5mgmG2zcf6qN0upbphCj4tGeHk/kGQVx11ShcxfY
 li1F0Uz1Tkjzglsrju/NDJTNtMExkYTBc/M8txaKlKvPkNwY+dNbItuX7q6LVVvvPO
 X3r5htZeOIHoNaO1Kvvndrra/k0CFgZdmYp6685AuHjkg8V2mcpQSzr+IN27SHsAOf
 0wyUIcDTB1Mtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=Osz8HEIH
Subject: [Buildroot] [PATCH 3/3] package/socat: bump to version 1.7.4.4
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

Drop upstream patch.

Update README hash for changes not related to licensing.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...-correct-the-getprotobynumber_r-test.patch | 43 -------------------
 package/socat/socat.hash                      |  6 +--
 package/socat/socat.mk                        |  2 +-
 3 files changed, 4 insertions(+), 47 deletions(-)
 delete mode 100644 package/socat/0003-configure.ac-correct-the-getprotobynumber_r-test.patch

diff --git a/package/socat/0003-configure.ac-correct-the-getprotobynumber_r-test.patch b/package/socat/0003-configure.ac-correct-the-getprotobynumber_r-test.patch
deleted file mode 100644
index de9540553191..000000000000
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
index 4f7ff5328e28..2113e1b3a485 100644
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
index bfccd020312d..1e378ab0691e 100644
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
