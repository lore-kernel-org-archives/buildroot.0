From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 22:24:40 +0200
Subject: [Buildroot] [git commit] package/jemalloc: drop obsolete valgrind
 dependency
Message-ID: <20190420202042.D67AC8E185@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a721018e0de59d79ad8e6802d10d39e63a0c9e3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

valgrind support has been removed since version 5.0.0 and
https://github.com/jemalloc/jemalloc/commit/9a8add1510456464bc496320990ec234798bd381

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jemalloc/jemalloc.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index 2424eb54c7..1b193189b4 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -11,14 +11,5 @@ JEMALLOC_LICENSE = BSD-2-Clause
 JEMALLOC_LICENSE_FILES = COPYING
 JEMALLOC_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_VALGRIND),y)
-JEMALLOC_DEPENDENCIES += valgrind
-JEMALLOC_CONF_OPTS += --enable-valgrind
-else
-JEMALLOC_CONF_OPTS += --disable-valgrind
-endif
-
-HOST_JEMALLOC_CONF_OPTS += --disable-valgrind
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
