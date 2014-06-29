From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:34:23 +0200
Subject: [Buildroot] [git commit] radvd: bump to version 1.14
Message-ID: <20140629083649.0022E9D090@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0092e0046ca936a99f62e173ab532275bd41b945
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump reverts e92fb1f90f1b51cd111105d86c058fdca6f3434a (radvd: fix
build against older glibc) since Gustavo has contributed a fix
upstream, which was merged in the 1.14 release of radvd.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/radvd/radvd.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index a42d858..ecca879 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-RADVD_VERSION = 1.13
+RADVD_VERSION = 1.14
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
-# clock_gettime() requires -lrt when linking against glibc older than 2.17
-RADVD_CONF_ENV = LIBS=-lrt
 
 define RADVD_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
