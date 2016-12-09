From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 17:56:52 +0100
Subject: [Buildroot] [git commit] coreutils: bump to version 8.26
Message-ID: <20161209171845.ECE2F80102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccbc1e10223a640d222a9a567023967af1efdf56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass on INSTALL_PROGRAM to configure since starting with version 8.26
when building natively it tries to use the self-built install to
install, and when cross-compiling it expects INSTALL_PROGRAM to point to
a real install, or otherwise fails when recursively trying to expand it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 38d3bb1..37d630b 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	31e67c057a5b32a582f26408c789e11c2e8d676593324849dcf5779296cdce87	coreutils-8.25.tar.xz
+sha256	155e94d748f8e2bc327c66e0cbebdb8d6ab265d2f37c3c928f7bf6c3beba9a8e	coreutils-8.26.tar.xz
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 0d7b782..409089c 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 8.25
+COREUTILS_VERSION = 8.26
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPLv3+
@@ -52,7 +52,8 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	gl_cv_have_proc_uptime=yes \
 	utils_cv_localtime_cache=no \
 	PERL=missing \
-	MAKEINFO=true
+	MAKEINFO=true \
+	INSTALL_PROGRAM=$(INSTALL)
 
 COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false \
 	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
