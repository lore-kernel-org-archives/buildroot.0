Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DCDEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6496941E3C;
	Fri, 13 Feb 2026 19:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPSK8fdP5Kfx; Fri, 13 Feb 2026 19:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59F4941E58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011348;
	bh=Z+ySVfoaLQPl9DyI2UCA4PqOO3GN9mmuXcdpY/dnlyQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fn8/55TzlhCDjUOKj4HxvgL71TdX7uszpzVXOS4DOqxbG6/THDRNw4ZOiWjVcmT1n
	 lCJIIjnWI+xTWBps7hX3Q3ByIJDqGPtCy4chOHPqNg02XyUfAFSsATseSbF1xxBSNX
	 owu2Z6+FlXXWo8UfdhbkL5HrF/GmM+JYYcGuedVJGsDfJV+w18fYLM3oYjDhU0tOVu
	 LJvepFQI7DfL4mbi8QXmuDw4JymmmA5x6WCWRfToUy70+jiQwEL/PV6aSGF6NehAB0
	 ybjY5FVxManUFpL5mz8e4ImHJE8og6HD5nasxcH6IW3r7kvGpRjQwz/bvXUeqdQmwB
	 euvV9DrM2DSTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59F4941E58;
	Fri, 13 Feb 2026 19:35:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 104CC283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD0A084558
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6rAbdcGBNUO for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BD0E844B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BD0E844B9
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EBB386D67; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 12:13:28 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 29bec887165e149114b9e854c099ee86b3056a20
X-Git-Newrev: ae7e57a9622474534f5e67af7750c1b0ccb9ff4f
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.2EBB386D67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libselinux:
 revert "allow pip to use system-provided packages"
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ae7e57a9622474534f5e67af7750c1b0ccb9ff4f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This reverts commit [1] which fails on the autobuilder because the patch
don't apply. This was incorrectly applied as it is specific for a
libselinux not part of 2025.02.x and fixes an error introduced by a pip
version not present in 2025.02.x [2].

[1] 32d1d7c367 package/libselinux: allow pip to use system-provided packages
[2] 285097051d package/python-pip: bumpp version to 25.3

Fixes: https://autobuild.buildroot.org/results/068/06854beaf880378da1b9ef75123de76465e5950f
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...src-Makefile-build-python-module-without-.patch | 51 ----------------------
 package/libselinux/libselinux.mk                   |  4 --
 2 files changed, 55 deletions(-)

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
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 7bc33392d5..360ab063ca 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -35,12 +35,8 @@ LIBSELINUX_DEPENDENCIES += \
 	python3 \
 	python-setuptools \
 	host-python-pip \
-	host-python-setuptools \
 	host-swig
 
-LIBSELINUX_MAKE_ENV += \
-	$(PKG_PYTHON_SETUPTOOLS_ENV)
-
 LIBSELINUX_MAKE_OPTS += \
 	$(PKG_PYTHON_SETUPTOOLS_ENV) \
 	PYTHON=python$(PYTHON3_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
