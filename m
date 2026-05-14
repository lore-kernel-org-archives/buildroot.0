Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394BDCD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C9D38558A;
	Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CO8Y2J-aVBvV; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E098E8556F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010085;
	bh=HtdIN+S2sIeXpmQkv4Ckb01bHFskGP5oWC4oIiFqBnA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OBOVbsvIGqqN1It5yofIn06zLjpYvJZfVayzcDTO+lm/ki4/WEuInxyD5ZmtZCh3x
	 uXlKBBA2zhP8bGca/2fds4/fshOwTBJ9WAwomrfLvU1lxY8OUPoqjqX0Vk77MB4fzW
	 XttuOvwhW+O27r/RYpG9fL7DwfjkosfGFeGnpZwAZCTRvOp8eZsk63ySo7b1qUTKiY
	 8e0SzbIRhgFNS/VuSvksFLK99JaBjdB5a7c6tNpJZu/4H3Pky7CPpXhi5Pss43XblL
	 YIwDlHrkkf6nK9ASDpseV+OuLK2KZ2W2bHLtP13GhWSwmHm27nYi4wYaRRGNV7RFBt
	 DMm2XkfcHLjUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E098E8556F;
	Tue,  9 Jun 2026 13:01:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10040196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 948908550A
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TiAnbCm52YWy for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 052468551E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 052468551E
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 324D087E8B; Tue,  9 Jun 2026 13:00:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 15:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11e5c1ffdff1bfb8609caeb769ef23c4a269dd30
X-Git-Newrev: 768f16502ad42b0b4496c8df1605173deeb50ff9
X-Patchwork-Hint: ignore
Message-Id: <20260609130055.324D087E8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: bump version to 3.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/768f16502ad42b0b4496c8df1605173deeb50ff9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Rebased patch 0001 due to inclusion of patch 0003 in this release.
Removed patch 0003 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...PYCEXT-and-rely-on-the-installed-file-nam.patch |  4 +-
 ...src-Makefile-build-python-module-without-.patch | 51 ----------------------
 package/libselinux/libselinux.hash                 |  2 +-
 package/libselinux/libselinux.mk                   |  2 +-
 4 files changed, 5 insertions(+), 54 deletions(-)

diff --git a/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
index 0d6db785ec..c2b6480af1 100644
--- a/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
+++ b/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
@@ -20,6 +20,8 @@ Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [Refreshed for 3.5]
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+[Refreshed for 3.10]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/Makefile | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
@@ -38,7 +40,7 @@ index 190016e2af34..7ee22fd35da3 100644
  RUBYINSTALL ?= $(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
 @@ -195,7 +194,7 @@ install: all
  install-pywrap: pywrap
- 	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
+ 	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --no-build-isolation --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
  	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
 -	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
 +	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
diff --git a/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch b/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
deleted file mode 100644
index 7f4a76515b..0000000000
--- a/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 8cfe4535f23a7768ee5efa615d11563a8404777c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
-Date: Mon, 27 Oct 2025 22:40:59 +0100
-Subject: [PATCH] libselinux/src/Makefile: build python module without
- isolation
-
-The "pip install" logic in libselinux/src/Makefile tries to get
-setuptools from the network, which is not correct as during the
-build/installation, there shouldn't be any network access, or
-downloading of arbitrary resources from the network.
-
-This causes build issues in Debian:
-
-  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121121
-
-And in Buildroot:
-
-  https://autobuild.buildroot.net/results/0e9/0e9de0c0d8b6ec57eea9f8834f02076b296ba4f1/build-end.log
-
-To fix this, we use the --no-build-isolation pip install argument so
-that pip install is allowed to use the system-provided setuptools,
-instead of wanting to download this one.
-
-This patch is derived from
-https://sources.debian.org/src/libselinux/3.9-4/debian/patches/Build-python-module-without-isolation-Closes-1119155.patch,
-with the change that --no-build-isolation is passed unconditionally,
-regardless of whether $(DESTDIR) is empty or not.
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://lore.kernel.org/selinux/20251227143911.1630813-1-thomas.petazzoni@bootlin.com/
----
- libselinux/src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
-index e9141bb9..9bc10606 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -197,7 +197,7 @@ ifneq ($(DISABLE_SHARED),y)
- endif
- 
- install-pywrap: pywrap
--	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
-+	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --no-build-isolation --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
- 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
- 	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
- 
--- 
-2.52.0
-
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 2f897e1287..f346297894 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  e7ee2c01dba64a0c35c9d7c9c0e06209d8186b325b0638a0d83f915cc3c101e8  libselinux-3.9.tar.gz
+sha256  1ef216c5b56fb7e0a51cd2909787a175a17ee391e0467894807873539ebe766b  libselinux-3.10.tar.gz
 
 # Hash for license file
 sha256  86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364  LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index a77ee7659a..bcd130ac72 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 3.9
+LIBSELINUX_VERSION = 3.10
 LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
