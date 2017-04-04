From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Apr 2017 23:44:32 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libsoc: add host-pkgconf
	dependency
Message-ID: <20170404214919.31DE9826D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eeec31f2a05b72c5616cbdd775b326a481ecdb39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Without pkg-config PKG_CHECK_MODULES won't be expanded
and ./configure script produces following error message:

./configure: line 12237: syntax error near unexpected token `PYTHON,'
./configure: line 12237: `	PKG_CHECK_MODULES(PYTHON, python-"$PYTHON_VERSION")'

Fixes:

http://autobuild.buildroot.net/results/86e/86e04bd2b10527130306451e56a7693ed4b4befd

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 8975e9f2c77c6861964906e6b5ebd894cdccf45f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsoc/libsoc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 03bef04..9bc2a9b 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -10,6 +10,7 @@ LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = LICENCE
 LIBSOC_AUTORECONF = YES
 LIBSOC_INSTALL_STAGING = YES
+LIBSOC_DEPENDENCIES = host-pkgconf
 
 # Install Python 2 bindings
 ifeq ($(BR2_PACKAGE_PYTHON),y)
