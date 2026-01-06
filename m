Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D480CD0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE50F412ED;
	Wed,  7 Jan 2026 18:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCSkKIUzEsoB; Wed,  7 Jan 2026 18:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10BFA40B6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808902;
	bh=LJOFRDFTqd+Ll39azhVSfgJUJpxEQUCngtWgXV6Wb9k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LL4HDoiZpD89r1K01/TJpT01laHbjhoCx37ZEIU7BYRXLOvLdPWSg2xARzynkipYn
	 xpBsF0pdCblu4dQ+W3i8GZNPIJd0fQTlOOnXjNn8w9sw6CJFZMxXGIs5EZ2B3Q7meN
	 C1M0/4ee4FumX6RjSPloA70qtiYE2GJvSHJlWAA2JHrhv3hrhiizeCjl4y4xmREQ21
	 Vo+SrljGJ3gDaI8pkdEVBoRD4Fbino8zdy80z0dGbY3EKS9uMdapelkcJcVt+8WX6e
	 ObusaWDMweNkW+qIyYssMh4UC4QTLXWedr8qyi8k50JvwNd621XUV4Kh8FgfXhBqiA
	 aautlOeL4UNfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10BFA40B6D;
	Wed,  7 Jan 2026 18:01:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3287A25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D2F9607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QRe3dYVC8kL for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72CD760843
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72CD760843
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 723C987C86; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:51:29 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 79b670f497cf1fb6153554f73827a701ae3bc244
X-Git-Newrev: 3a2608c47a889c27e2e8a3be7893c67794b6861c
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.723C987C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libselinux: allow
 pip to use system-provided packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a2608c47a889c27e2e8a3be7893c67794b6861c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since the bump of pip to version 25.3 in commit
285097051d4a7dd821f01d15c705867f7e26c635, the build of the Python
bindings of libselinux is broken for both the host and target
variants.

For the host variant, because "pip install" no longer finds the
system-provided setuptools and tries to download setuptools by itself,
causing build issues because our host-python doesn't have SSL support:

  Could not fetch URL https://pypi.org/simple/setuptools/: There was a problem confirming the ssl certificate: HTTPSConnectionPool(host='pypi.org', port=443): Max retries exceeded with url: /simple/setuptools/ (Caused by SSLError("Can't connect to HTTPS URL because the SSL module is not available.")) - skipping

For the target variant, because "pip install" no longer finds the
sysconfigdata package:

  ModuleNotFoundError: No module named '_sysconfigdata__linux_sparc64-linux-gnu'
  [end of output]

We fix this by taking a patch from Debian, which is slightly tweaked
to also cover our host package (the original Debian patch was passing
--no-build-isolation only when DESTDIR was not empty, but in Buildroot
host packages are built with DESTDIR empty, and we do need
--no-build-isolation).

Fixes:

  https://autobuild.buildroot.net/results/0e9de0c0d8b6ec57eea9f8834f02076b296ba4f1/ (host-libselinux)
  https://autobuild.buildroot.org/results/1b87c659f1901b0bf33fa4a2ff0ed40b13114bba/ (libselinux)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Co-Authored-By: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0e5eef911c9b313fddd9912128bf09d605b5f6ae)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...src-Makefile-build-python-module-without-.patch | 51 ++++++++++++++++++++++
 package/libselinux/libselinux.mk                   |  4 ++
 2 files changed, 55 insertions(+)

diff --git a/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch b/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
new file mode 100644
index 0000000000..7f4a76515b
--- /dev/null
+++ b/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
@@ -0,0 +1,51 @@
+From 8cfe4535f23a7768ee5efa615d11563a8404777c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
+Date: Mon, 27 Oct 2025 22:40:59 +0100
+Subject: [PATCH] libselinux/src/Makefile: build python module without
+ isolation
+
+The "pip install" logic in libselinux/src/Makefile tries to get
+setuptools from the network, which is not correct as during the
+build/installation, there shouldn't be any network access, or
+downloading of arbitrary resources from the network.
+
+This causes build issues in Debian:
+
+  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121121
+
+And in Buildroot:
+
+  https://autobuild.buildroot.net/results/0e9/0e9de0c0d8b6ec57eea9f8834f02076b296ba4f1/build-end.log
+
+To fix this, we use the --no-build-isolation pip install argument so
+that pip install is allowed to use the system-provided setuptools,
+instead of wanting to download this one.
+
+This patch is derived from
+https://sources.debian.org/src/libselinux/3.9-4/debian/patches/Build-python-module-without-isolation-Closes-1119155.patch,
+with the change that --no-build-isolation is passed unconditionally,
+regardless of whether $(DESTDIR) is empty or not.
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://lore.kernel.org/selinux/20251227143911.1630813-1-thomas.petazzoni@bootlin.com/
+---
+ libselinux/src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
+index e9141bb9..9bc10606 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -197,7 +197,7 @@ ifneq ($(DISABLE_SHARED),y)
+ endif
+ 
+ install-pywrap: pywrap
+-	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
++	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --no-build-isolation --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
+ 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
+ 	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
+ 
+-- 
+2.52.0
+
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 405c4a9f21..a77ee7659a 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -35,8 +35,12 @@ LIBSELINUX_DEPENDENCIES += \
 	python3 \
 	python-setuptools \
 	host-python-pip \
+	host-python-setuptools \
 	host-swig
 
+LIBSELINUX_MAKE_ENV += \
+	$(PKG_PYTHON_SETUPTOOLS_ENV)
+
 LIBSELINUX_MAKE_OPTS += \
 	$(PKG_PYTHON_SETUPTOOLS_ENV) \
 	PYTHON=python$(PYTHON3_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
