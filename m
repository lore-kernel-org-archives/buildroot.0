From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jul 2014 13:13:23 +0200
Subject: [Buildroot] [git commit] nano: bump to version 2.3.5
Message-ID: <20140714111336.9B6609D1EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19c2ffa57bda2725507bfc66fc495c0d1f59f67d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to the full-blown install when tiny is not selected, we really
want all of it in that case.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nano/nano.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 2b6df3a..3a17e7f 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.3
-NANO_VERSION = $(NANO_VERSION_MAJOR).2
+NANO_VERSION = $(NANO_VERSION_MAJOR).5
 NANO_SITE = http://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
@@ -22,10 +22,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_NANO_TINY),y)
 	NANO_CONF_OPT += --enable-tiny
-endif
-
 define NANO_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
 endef
+endif
 
 $(eval $(autotools-package))
