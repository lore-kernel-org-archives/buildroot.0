From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 12:09:56 +0100
Subject: [Buildroot] [git commit] xenomai: bump to version 2.6.3
Message-ID: <20131229111620.683CB9C226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5831a8bae2394ba872ec68b9b48c35c2172d6f45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add --disable-doc-install to configure script.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/xenomai.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 786bdfd..2dd1bf6 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -6,7 +6,7 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 2.6.2.1
+XENOMAI_VERSION = 2.6.3
 endif
 
 XENOMAI_SITE = http://download.gna.org/xenomai/stable/
@@ -19,7 +19,7 @@ XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-user
 XENOMAI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-user
 
-XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/
+XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/ --disable-doc-install
 
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
