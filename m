Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92676C3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 09:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 126F583D9B;
	Sat, 17 May 2025 09:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8eOx4ORX5uS; Sat, 17 May 2025 09:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54F9C83D4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54F9C83D4C;
	Sat, 17 May 2025 09:09:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07521D89
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC0F3412C2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfNCJ1zQECSb for <buildroot@buildroot.org>;
 Sat, 17 May 2025 09:09:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4727440DED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4727440DED
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:09:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3848986DF0; Sat, 17 May 2025 09:09:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 10:11:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a7823a7fe2a1859ff8cab2d92a22a69003d62db
X-Git-Newrev: 1ae3ad4e878e1f4217ba3276ff0c9e584234afa4
X-Patchwork-Hint: ignore
Message-Id: <20250517090936.3848986DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: bump to version 3.8.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ae3ad4e878e1f4217ba3276ff0c9e584234afa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .../0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch     | 2 +-
 package/libselinux/libselinux.hash                                      | 2 +-
 package/libselinux/libselinux.mk                                        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
index 3bdb1d0f46..0d6db785ec 100644
--- a/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
+++ b/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
@@ -36,7 +36,7 @@ index 190016e2af34..7ee22fd35da3 100644
  RUBYINC ?= $(shell $(RUBY) -e 'puts "-I" + RbConfig::CONFIG["rubyarchhdrdir"] + " -I" + RbConfig::CONFIG["rubyhdrdir"]')
  RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
  RUBYINSTALL ?= $(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
-@@ -193,7 +192,7 @@ install: all
+@@ -195,7 +194,7 @@ install: all
  install-pywrap: pywrap
  	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
  	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index fac9d3cef2..0933398f1e 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  ea03f42d13a4f95757997dba8cf0b26321fac5d2f164418b4cc856a92d2b17bd  libselinux-3.7.tar.gz
+sha256  ec2d2789f931152d21c1db1eb4bc202ce4eccede34d9be9e360e3b45243cee2c  libselinux-3.8.1.tar.gz
 
 # Hash for license file
 sha256  86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364  LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 360ab063ca..e19bb4dd2d 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 3.7
+LIBSELINUX_VERSION = 3.8.1
 LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
