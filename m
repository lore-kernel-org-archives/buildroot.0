Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36ED606EE9F
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lxXBGsY5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=iUTXU15M
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C076078E;
	Wed,  4 Nov 2026 22:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3j2SLTn9f_Tx; Wed,  4 Nov 2026 22:08:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 69700607A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830111;
	b=Fy3nELR2ZoS7K55iJAOXcP1uGQUSGwAAHSVDEAt7IiOKljDvrPJOAFKhxyM4JhMCT4ol
	 67zttmeBWRsnAEVtzd//QMJ/pdGL4acYGIRqMMs4ZiDcRL2QlvEXEwkwW8TeQv6MI8fj1
	 +5ss03iU3qHm2Q3VUvZ4jSXv1+ry3pS/sGcKJjQtNnSYXat3Sh1DlvhFUgFy2hxotAsCu
	 YlJWtcjk5aGfkJgc4lwK37cKXNoDc3rEeRPrfvhZGoSN/YqKQ19yF8sSIn1BRYuNyPwDm
	 iEun4MyeLQY58yJauXZO+AwtbGQLMZq3mn407W3X1Bt19iASj29Xk0wyRsiB9CrsHEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830111;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CXOofJpfljqfHHncHKT4od9VZP7LhX132msEnW0asE8=;
	b=Ddh9/dW9DgaQll1PuoRfLHqePlvAzHSyXG0aTVWnNx6u5uc8kUcVdNTD7LyHMYTlS06+
	 MARDMdKpM6VefvJfgVgFvuKH6bYKnwOq434URlBq+B3faJ6tsbVM29VwsjDeAaGY375dp
	 GNS5s9KW1XosZI6DxhWy17gevXECsQyAXYO40o56Ddgvd3+i0MPbKxGynpDgffJPmR7UA
	 G7p4riFKA+WLX2fDijB0x9PAeYWzX1YzsjMmuIxqW1QkTT0OOqt1yHD3VfqBNMGKIHaKK
	 zJusn9SRxlZkaG8kHZvLX4Gbo6SQXNNB9PO+IiMEBBUKGHBPVnHUHUeWwBnYGG3MtjA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830111;
	bh=CXOofJpfljqfHHncHKT4od9VZP7LhX132msEnW0asE8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lxXBGsY58IG5kjFEt2IIfWf1yGe95+FGT8jUqo24AwlzcU0Sti6VymugOuZgC+L2o
	 ulRpBscMOzjUF7MwICEJQVFxrKw3QJ4L9MoWgJABOmGIBrF2Cr0/gMan3rBkqzhgMS
	 Alx2pg9qpkIFMTrobmGcoXZxoAoQC6OERm7NTPzBwSolIRSJipgbhhoMtlkpeeFXWq
	 SGhoiwKS7nTs7o/MkWRNEdzP3pZRpmdceKQBiSDA1n1uU9d2XVwgXeAct8VwAS1kGG
	 lEhV2GTlJBV0uij5YBYWlm11Ahl/HP/9lq0gFeBzyfCcWCk+D9IghqRz4cuOHDARFt
	 8L4WvKBRUx+WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69700607A3;
	Wed,  4 Nov 2026 22:08:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4547D37B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42649407FB
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvZXvBDSx4Jy for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5ED97407F5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iUTXU15M
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5ED97407F5
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793830102;
 bh=9ezxp15xUj/+TOo2WhQFoW0IIUhMwZwS8UIGlLtnVP0=;
 h=From:To:Cc:Subject:Date:From;
 b=iUTXU15MwTy4r1gDeomPs7M3UfFWwm4mHZitgnoaplaJ/25XzCbE6LRWcQeRbJ76x
 WPkqdGBqkJcHn8ViLvaURYw05Lva+DabsLT0GZ0DRBqWeH1d1wdH+IIloxUdATYRwk
 FZBAFyjaDoVHEAp0Tx1BZgz7eBWTHtZZO+mouwiX37YL0pGSqlhO1MkNz/EKc4tO9m
 aWg/96/RO3opIIbUDi6gwLTSr1Lba1TETfStBTnnebhP+YqrZPS3ysiU00OcWJj84I
 sLywcAoCybej8bRZSk+kCXk7TP5MdQfPzvFxIo/n5+ZazGg9d3w2+pLXnBxV8y0+3u
 f/gvrlAEAv5NQ==
X-KAS-Sym: v3:f51bdf72230551df:NsgrzN4pnQATX6U2GdDHNf5KDGiTm1OCWmRfDUQHGubi2
 D/D5aDH9DRew9y8fCAQdCQaNj/OgUa/E9yPw3evzzW4JVmSQrMF6eZzkir9+bEMfeh3/j6wntBS
 KnzkeJYUUn4OByWjNXzK0lZlbAKg0ZZ5JX4f86rk3yHCoX3FzJcxfzW8mg+hZoMhoHGb432V9Xi
 JWoy11XVbOCFoZ7aoc7Rxx43na3VOS8UzPiNtZemHxMirXpHioxXKqd1gDSr+7e4MkrFPuJ1JJ9
 AgKH7BALFK8p1fADMjQwvDFk1jWoP2qkCoWmaQpbn6uQw6A9A9PffW8k7M4tX3ATr3ab3gRA==:
 RxPaVREUVcGxlVmQwFfqjHFP564C7Kl+6ojdrqLkhnjwq0QreDcxirEW0nzAR2aa88ICGBb9hgp
 2gs8fghm5tilLtTKn33/BjKXOvB68gYsSNqxNUcWG1enYgNUtrYeDA4ZjNssIyva7krwA85BLfX
 iAy68sn1G4951U4u/kcp5sfD+MRMb4FlvRYW8Y9LA+vwZuG6h48IqV2NDUbmt+nu+JxEBLvE2HT
 dC7btqq3nyYlxVTK6qwxiDufrnL5Y4VubrsYtSsjnN//AwnhUXY/hdXaHYMc+hHhJDJs6zYCquU
 Wev9X/bntUOxK3VRrJvgWPHQuKYpFojfCSH8v8hu53wd/vJR8gvTb33iwMqO4P8Ufj96LVWHeUs
 1YbCkskdJv6FGU9cxlnh+/BadWi/oHOfw6eE6PpR6WzST1du6eTsl1g1BWzpyni0Orgl9Mj2LmI
 HyE8pbcIKuUVH/vSMRxi1/aTRZfCJVsSL/qIJ2KKl09gHKajdqRUr5xLdcXr1WR6Fe4qxUsiOwc
 M1kL0jP9GMdTPu+mEpFONqCip0oYMmKgV9GOfEZTT5qrZ5LwPpzo1Hitw/r4gv/wG9lvnVHogq8
 Ls2hRRNtaIRgsa3bAv57kPE8s9j3n2/rG5KLjOXKo9g1tKS6jZ/CDFwznrCdl05FiqtDyEAG+wI
 BAVdy+kt8EVOgG/hnH19aPJ6rj/xOA400BSq+i+hFZ/hDj4evCq5RgP+seA==
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1DFCAA4C2EE8;
 Wed,  4 Nov 2026 23:08:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48558)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xOj9Z-000000004uT-1zQP;
 Wed, 04 Nov 2026 22:08:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Nov 2026 23:08:20 +0100
Message-ID: <20261104220820.3290296-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 1/1] package/python3: bump version to 3.15.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://www.python.org/downloads/release/python-3150/
https://www.python.org/downloads/release/python-3151/
https://www.python.org/downloads/release/python-3152/

Rebased patches using --zero-commit option.

Added new configure option --enable-static-libpython-for-interpreter
https://docs.python.org/3/using/configure.html#cmdoption-enable-static-libpython-for-interpreter
as proposed by Vincent:
https://lists.buildroot.org/pipermail/buildroot/2026-October/815406.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
v2:
- added --enable-static-libpython-for-interpreter to CONF_OPTS (Vincent)

Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/689ce1dc03f743056f44873d30f674e536d3e6d9

package/python-dbus-next should be removed due to runtime errors:
https://patchwork.buildroot.org/project/buildroot/patch/20261104210728.3839438-1-bernd@kuhls.net/

This bump was tested by Vincent:
https://lists.buildroot.org/pipermail/buildroot/2026-November/815912.html

 ...e-the-build-of-pyc-files-conditional.patch | 14 ++---
 .../0002-Add-an-option-to-disable-pydoc.patch | 24 ++++----
 .../0003-Add-an-option-to-disable-IDLE.patch  | 18 +++---
 ...move-PY_STDLIB_MOD_SET_NA-further-up.patch | 10 ++--
 ...option-to-disable-the-sqlite3-module.patch | 16 +++---
 ...d-an-option-to-disable-the-tk-module.patch | 18 +++---
 ...-option-to-disable-the-curses-module.patch | 14 ++---
 .../0008-Add-an-option-to-disable-expat.patch | 14 ++---
 ...ac-detect-unusable-termio-operations.patch | 18 +++---
 ...mpilation-of-Modules-_remote_debuggi.patch | 55 -------------------
 package/python3/python3.hash                  |  4 +-
 package/python3/python3.mk                    |  6 +-
 12 files changed, 79 insertions(+), 132 deletions(-)
 delete mode 100644 package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index dbc3c60d87..8c0d1821d7 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 52bb6f2a3ef352cda16d95a588a0356da562de8e Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -15,7 +15,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 2 ++
@@ -23,10 +23,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 9 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 08ad5f4921d..486a35ed99b 100644
+index 95fefcc3a75..ee1f8b0c125 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2812,6 +2812,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2923,6 +2923,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		patch --force --reject-file "$(abs_builddir)/app-store-compliance.rej" --strip 2 --directory "$(DESTDIR)$(LIBDEST)" --input "$(abs_srcdir)/$(APP_STORE_COMPLIANCE_PATCH)" || true ; \
  	fi
  	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
@@ -34,7 +34,7 @@ index 08ad5f4921d..486a35ed99b 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
-@@ -2821,6 +2822,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2932,6 +2933,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -43,10 +43,10 @@ index 08ad5f4921d..486a35ed99b 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index bd4446e9488..ad0781f9ee6 100644
+index 99238054b9a..6ba882a7fe5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1533,6 +1533,13 @@ fi
+@@ -1573,6 +1573,13 @@ fi
  
  AC_MSG_CHECKING([LDLIBRARY])
  
diff --git a/package/python3/0002-Add-an-option-to-disable-pydoc.patch b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
index 294520f815..2116894daf 100644
--- a/package/python3/0002-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From 8ba9dc9a12687d37454dd949409599f108f1ce44 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -18,7 +18,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 9 ++++++++-
@@ -26,10 +26,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 486a35ed99b..c3732bedb30 100644
+index ee1f8b0c125..f0a14641a10 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2513,7 +2513,9 @@ bininstall: commoninstall altbininstall
+@@ -2590,7 +2590,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -39,15 +39,15 @@ index 486a35ed99b..c3732bedb30 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -2564,7 +2566,6 @@ LIBSUBDIRS=	asyncio \
- 		logging \
- 		multiprocessing multiprocessing/dummy \
- 		pathlib \
+@@ -2650,7 +2652,6 @@ LIBSUBDIRS=	asyncio \
+ 		profiling/sampling/live_collector \
+ 		profiling/sampling/_vendor/d3/7.8.5 \
+ 		profiling/sampling/_vendor/d3-flame-graph/4.1.3 \
 -		pydoc_data \
  		re \
  		site-packages \
  		sqlite3 \
-@@ -2731,6 +2732,10 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2842,6 +2843,10 @@ TESTSUBDIRS=	idlelib/idle_test \
  
  COMPILEALL_OPTS=-j0
  
@@ -58,7 +58,7 @@ index 486a35ed99b..c3732bedb30 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2959,7 +2964,9 @@ libainstall: all scripts
+@@ -3073,7 +3078,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
  	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
@@ -69,10 +69,10 @@ index 486a35ed99b..c3732bedb30 100644
  		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
  		echo; echo "Installing support files for building shared extension modules on AIX:"; \
 diff --git a/configure.ac b/configure.ac
-index ad0781f9ee6..00d2b54ead5 100644
+index 6ba882a7fe5..4a7a6670554 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4789,6 +4789,12 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4980,6 +4980,12 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
diff --git a/package/python3/0003-Add-an-option-to-disable-IDLE.patch b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
index 3a386b7a29..42c4b670fe 100644
--- a/package/python3/0003-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From 463c64020b288b8ddfd32a63c4a23ab7369b9669 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -17,7 +17,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 9 ++++++++-
@@ -25,10 +25,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c3732bedb30..2197bb18434 100644
+index f0a14641a10..c994e44f46e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2511,7 +2511,9 @@ bininstall: commoninstall altbininstall
+@@ -2588,7 +2588,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -38,7 +38,7 @@ index c3732bedb30..2197bb18434 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -2560,7 +2562,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2637,7 +2639,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
@@ -46,7 +46,7 @@ index c3732bedb30..2197bb18434 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2736,6 +2737,10 @@ ifeq (@PYDOC@,yes)
+@@ -2847,6 +2848,10 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -57,7 +57,7 @@ index c3732bedb30..2197bb18434 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2963,7 +2968,9 @@ libainstall: all scripts
+@@ -3077,7 +3082,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
@@ -68,10 +68,10 @@ index c3732bedb30..2197bb18434 100644
  	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
  endif
 diff --git a/configure.ac b/configure.ac
-index 00d2b54ead5..5395e82384b 100644
+index 4a7a6670554..e5c6ef48f7e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -8189,6 +8189,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_d
+@@ -8657,6 +8657,12 @@ AC_SUBST([JIT_SHIM_BUILD_O])
  # substitute multiline block, must come after last PY_STDLIB_MOD()
  AC_SUBST([MODULE_BLOCK])
  
diff --git a/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
index faf990430c..8978239298 100644
--- a/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
+++ b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
@@ -1,4 +1,4 @@
-From 930c4763ac46d180880615eceeb68698e9b35e85 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 6 Feb 2024 22:46:59 +0100
 Subject: [PATCH] configure.ac: move PY_STDLIB_MOD_SET_NA further up
@@ -11,17 +11,17 @@ Upstream: N/A
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac | 13 ++++++-------
  1 file changed, 6 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5395e82384b..ec9a24c5311 100644
+index e5c6ef48f7e..1ad30f4a929 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -95,6 +95,12 @@ AC_DEFUN([PY_CHECK_EMSCRIPTEN_PORT], [
+@@ -101,6 +101,12 @@ AC_DEFUN([PY_CHECK_EMSCRIPTEN_PORT], [
    AS_VAR_POPDEF([py_libs])
  ])
  
@@ -34,7 +34,7 @@ index 5395e82384b..ec9a24c5311 100644
  AC_SUBST([BASECPPFLAGS])
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -7701,13 +7707,6 @@ if test -n "$_PYTHREAD_NAME_MAXLEN"; then
+@@ -8105,13 +8111,6 @@ if test -n "$_PYTHREAD_NAME_MAXLEN"; then
  fi
  AC_SUBST([_PYTHREAD_NAME_MAXLEN])
  
diff --git a/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
index 77c2f22bc5..4a0aee7daf 100644
--- a/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From 8f6beca556599479705444af7cc7c49b2b964af8 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 6 Feb 2024 22:12:20 +0100
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -14,7 +14,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 5 ++++-
@@ -22,18 +22,18 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2197bb18434..c8f7ab1e6a9 100644
+index c994e44f46e..6ddced5a68d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2569,7 +2569,6 @@ LIBSUBDIRS=	asyncio \
- 		pathlib \
+@@ -2655,7 +2655,6 @@ LIBSUBDIRS=	asyncio \
+ 		profiling/sampling/_vendor/d3-flame-graph/4.1.3 \
  		re \
  		site-packages \
 -		sqlite3 \
  		string \
  		sysconfig \
  		tkinter \
-@@ -2741,6 +2740,10 @@ ifeq (@IDLE@,yes)
+@@ -2852,6 +2851,10 @@ ifeq (@IDLE@,yes)
  LIBSUBDIRS += idlelib idlelib/Icons
  endif
  
@@ -45,10 +45,10 @@ index 2197bb18434..c8f7ab1e6a9 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index ec9a24c5311..e8e201206bc 100644
+index 1ad30f4a929..f9381b83b37 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4795,6 +4795,13 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4986,6 +4986,13 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
diff --git a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
index b928cd9435..60e6b95463 100644
--- a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From b53a2758ac431bc2493a460e6c886561e2397518 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -11,7 +11,7 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [ Adam Duskett: ported to Python 3.12.1 ]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
@@ -25,10 +25,10 @@ Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
  2 files changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c8f7ab1e6a9..2c91d0dda71 100644
+index 6ddced5a68d..c1e78f2a3dc 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2571,7 +2571,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2657,7 +2657,6 @@ LIBSUBDIRS=	asyncio \
  		site-packages \
  		string \
  		sysconfig \
@@ -36,7 +36,7 @@ index c8f7ab1e6a9..2c91d0dda71 100644
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2681,7 +2680,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2791,7 +2790,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_pyrepl \
  		test/test_string \
  		test/test_sqlite3 \
@@ -44,7 +44,7 @@ index c8f7ab1e6a9..2c91d0dda71 100644
  		test/test_tomllib \
  		test/test_tomllib/data \
  		test/test_tomllib/data/invalid \
-@@ -2703,7 +2701,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2814,7 +2812,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_tools \
  		test/test_tools/i18n_data \
  		test/test_tools/msgfmt_data \
@@ -52,7 +52,7 @@ index c8f7ab1e6a9..2c91d0dda71 100644
  		test/test_unittest \
  		test/test_unittest/namespace_test_pkg \
  		test/test_unittest/namespace_test_pkg/bar \
-@@ -2730,6 +2727,11 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2841,6 +2838,11 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/xmltestdata/c14n-20 \
  		test/zipimport_data
  
@@ -65,10 +65,10 @@ index c8f7ab1e6a9..2c91d0dda71 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index e8e201206bc..840976ec1bd 100644
+index f9381b83b37..fa4b3492987 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4808,6 +4808,13 @@ AC_ARG_ENABLE(pydoc,
+@@ -4999,6 +4999,13 @@ AC_ARG_ENABLE(pydoc,
  	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
  	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
diff --git a/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
index 729cb5d624..60f4bd4a5b 100644
--- a/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From baef276faa676d1b0faf64a91fa627b5f8fcc5e0 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -13,7 +13,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 5 ++++-
@@ -21,10 +21,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2c91d0dda71..fb11e416731 100644
+index c1e78f2a3dc..55c9ca5f02c 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2555,7 +2555,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2632,7 +2632,6 @@ LIBSUBDIRS=	asyncio \
  		concurrent concurrent/futures concurrent/interpreters \
  		csv \
  		ctypes ctypes/macholib \
@@ -32,7 +32,7 @@ index 2c91d0dda71..fb11e416731 100644
  		dbm \
  		email email/mime \
  		encodings \
-@@ -2732,6 +2731,10 @@ LIBSUBDIRS += tkinter
+@@ -2843,6 +2842,10 @@ LIBSUBDIRS += tkinter
  TESTSUBDIRS += test/test_tkinter test/test_ttk
  endif
  
@@ -44,10 +44,10 @@ index 2c91d0dda71..fb11e416731 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index 840976ec1bd..1d7ba91ccc9 100644
+index fa4b3492987..3c88f407672 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4802,6 +4802,13 @@ AC_ARG_ENABLE(sqlite3,
+@@ -4993,6 +4993,13 @@ AC_ARG_ENABLE(sqlite3,
  AS_IF([test "$SQLITE3" = "no"],
        [PY_STDLIB_MOD_SET_NA([_sqlite3])])
  
diff --git a/package/python3/0008-Add-an-option-to-disable-expat.patch b/package/python3/0008-Add-an-option-to-disable-expat.patch
index 4093d6fa76..14c8360790 100644
--- a/package/python3/0008-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0008-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From 2a7412e43554830ffbc831454de8df903e765b73 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -19,7 +19,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in |  5 ++++-
@@ -27,10 +27,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 17 insertions(+), 12 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index fb11e416731..c261b3f9cd7 100644
+index 55c9ca5f02c..40ae1c38076 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2576,7 +2576,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2662,7 +2662,6 @@ LIBSUBDIRS=	asyncio \
  		urllib \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		wsgiref \
@@ -38,7 +38,7 @@ index fb11e416731..c261b3f9cd7 100644
  		xmlrpc \
  		zipfile zipfile/_path \
  		zoneinfo \
-@@ -2749,6 +2748,10 @@ ifeq (@SQLITE3@,yes)
+@@ -2860,6 +2859,10 @@ ifeq (@SQLITE3@,yes)
  LIBSUBDIRS += sqlite3
  endif
  
@@ -50,10 +50,10 @@ index fb11e416731..c261b3f9cd7 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 1d7ba91ccc9..3980548b253 100644
+index 3c88f407672..1e4c14b9e15 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4065,17 +4065,19 @@ LIBS="$withval $LIBS"
+@@ -4265,17 +4265,19 @@ LIBS="$withval $LIBS"
  [AC_MSG_RESULT([no])])
  
  # Check for use of the system expat library
diff --git a/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch b/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
index 78c0fe057c..0833eff46f 100644
--- a/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
+++ b/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
@@ -1,4 +1,4 @@
-From 2d336d1fedb692350a1e4f131246f60a1195cd93 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 7 Dec 2025 13:57:06 +0100
 Subject: [PATCH] configure.ac: detect unusable termio operations
@@ -15,7 +15,7 @@ done using a new m4 macro PY_CHECK_IOCTL.
 
 Upstream: https://github.com/python/cpython/pull/142380
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Modules/termios.c |  8 ++++----
@@ -23,10 +23,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 30 insertions(+), 4 deletions(-)
 
 diff --git a/Modules/termios.c b/Modules/termios.c
-index efb5fcc17fa..3177cb0747a 100644
+index 38743e176f0..a2defe4b270 100644
 --- a/Modules/termios.c
 +++ b/Modules/termios.c
-@@ -1115,7 +1115,7 @@ static struct constant {
+@@ -1122,7 +1122,7 @@ static struct constant {
  #ifdef TCFLSH
      {"TCFLSH", TCFLSH},
  #endif
@@ -35,7 +35,7 @@ index efb5fcc17fa..3177cb0747a 100644
      {"TCGETA", TCGETA},
  #endif
  #ifdef TCGETS
-@@ -1127,13 +1127,13 @@ static struct constant {
+@@ -1134,13 +1134,13 @@ static struct constant {
  #ifdef TCSBRKP
      {"TCSBRKP", TCSBRKP},
  #endif
@@ -53,10 +53,10 @@ index efb5fcc17fa..3177cb0747a 100644
  #endif
  #ifdef TCSETS
 diff --git a/configure.ac b/configure.ac
-index 3980548b253..48604024fcf 100644
+index 1e4c14b9e15..f3048cda3c6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -101,6 +101,26 @@ AC_DEFUN([PY_STDLIB_MOD_SET_NA], [
+@@ -107,6 +107,26 @@ AC_DEFUN([PY_STDLIB_MOD_SET_NA], [
      AS_VAR_SET([py_cv_module_]mod, [n/a])])
  ])
  
@@ -83,7 +83,7 @@ index 3980548b253..48604024fcf 100644
  AC_SUBST([BASECPPFLAGS])
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -8217,6 +8237,12 @@ AC_ARG_ENABLE(idle3,
+@@ -8685,6 +8705,12 @@ AC_ARG_ENABLE(idle3,
  	AS_HELP_STRING([--disable-idle3], [disable idle3 IDE]),
  	[ IDLE="${enableval}" ], [ IDLE=yes ])
  
@@ -97,5 +97,5 @@ index 3980548b253..48604024fcf 100644
  AC_CONFIG_FILES(m4_normalize([
    Makefile.pre
 -- 
-2.51.1
+2.47.3
 
diff --git a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
deleted file mode 100644
index 833bcc9cc8..0000000000
--- a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 528429e329047ee572248da0e1212f7cc1ef7d11 Mon Sep 17 00:00:00 2001
-From: Pablo Galindo Salgado <Pablogsal@gmail.com>
-Date: Thu, 25 Sep 2025 00:16:44 +0100
-Subject: [PATCH] gh-139275: Fix compilation of
- Modules/_remote_debugging_module.c when the system doesn't have
- process_vm_readv (#139307)
-
-Upstream: https://github.com/python/cpython/commit/1963e701001839389cfb1b11d803b0743f4705d7
-
-[ Bernd Kuhls: ported to Python 3.14.7]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- .../2025-09-24-17-32-52.gh-issue-139275.novrqf.rst              | 2 ++
- Modules/_remote_debugging_module.c                              | 2 +-
- Python/remote_debug.h                                           | 2 +-
- 3 files changed, 4 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst
-
-diff --git a/Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst b/Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst
-new file mode 100644
-index 00000000000..8cb4b972ad6
---- /dev/null
-+++ b/Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst
-@@ -0,0 +1,2 @@
-+Fix compilation problems in ``_remote_debugging_module.c`` when the system
-+doesn't have ``process_vm_readv``. Patch by Pablo Galindo
-diff --git a/Modules/_remote_debugging_module.c b/Modules/_remote_debugging_module.c
-index b46538b76df..e86a27d5812 100644
---- a/Modules/_remote_debugging_module.c
-+++ b/Modules/_remote_debugging_module.c
-@@ -1329,7 +1329,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
-             _PyErr_ChainExceptions1(exc);
-         }
-     }
--#elif defined(__linux__)
-+#elif defined(__linux__) && HAVE_PROCESS_VM_READV
-     // On Linux, search for asyncio debug in executable or DLL
-     address = search_linux_map_for_section(handle, "AsyncioDebug", "_asyncio.cpython", NULL);
-     if (address == 0) {
-diff --git a/Python/remote_debug.h b/Python/remote_debug.h
-index 8f9b6cd4c49..b7d17a0f345 100644
---- a/Python/remote_debug.h
-+++ b/Python/remote_debug.h
-@@ -1174,7 +1174,7 @@
-             _PyErr_ChainExceptions1(exc);
-         }
-     }
--#elif defined(__linux__)
-+#elif defined(__linux__) && HAVE_PROCESS_VM_READV
-     // On Linux, search for 'python' in executable or DLL
-     address = search_linux_map_for_section(handle, "PyRuntime", "python",
-                                            _Py_RemoteDebug_ValidatePyRuntimeCookie);
--- 
-2.47.3
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 7272555258..89e7ba06e7 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-31410/
-sha256  de414a57119abef52784d8993e341d53aed635fc2b05c2607d9f98a2c5b72032  Python-3.14.10.tar.xz
+# From https://www.python.org/downloads/release/python-3152/
+sha256  8b5536d280142ecf6cdfe15d12a21ba1c65e300bbf7b28a8d0cdb849575797de  Python-3.15.2.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index c24020af9b..d68353763c 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
+PYTHON3_VERSION_MAJOR = 3.15
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
@@ -17,6 +17,7 @@ PYTHON3_CPE_ID_PRODUCT = python
 # cross-compiling third-party Python modules.
 
 HOST_PYTHON3_CONF_OPTS += \
+	--enable-static-libpython-for-interpreter \
 	--without-ensurepip \
 	--disable-sqlite3 \
 	--disable-tk \
@@ -194,6 +195,7 @@ PYTHON3_DEPENDENCIES += gettext
 endif
 
 PYTHON3_CONF_OPTS += \
+	--enable-static-libpython-for-interpreter \
 	--without-ensurepip \
 	--with-build-python=$(HOST_DIR)/bin/python3 \
 	--disable-pydoc \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
