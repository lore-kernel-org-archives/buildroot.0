From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 06:33:51 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20150621043444.4D3BA8068B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=505b2338742ba23077191cde2baee404bef1a692
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-gettext is needed since
https://github.com/tvheadend/tvheadend/commit/bad281a9f5bbb8e7f968d400f8096908dfd798b9#diff-e2d5a00791bce9a01f99bc6fd613a39d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/0001-no-check_config.patch |    4 ++--
 package/tvheadend/tvheadend.mk               |    8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/tvheadend/0001-no-check_config.patch b/package/tvheadend/0001-no-check_config.patch
index b55cbfc..bc724db 100644
--- a/package/tvheadend/0001-no-check_config.patch
+++ b/package/tvheadend/0001-no-check_config.patch
@@ -16,8 +16,8 @@ diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvhe
  	$(ROOTDIR)/configure $(CONFIGURE_ARGS)
  
  # Binary
--${PROG}: check_config $(OBJS) $(ALLDEPS)
-+${PROG}: $(OBJS) $(ALLDEPS)
+-${PROG}: check_config make_webui $(MO-FILES) $(OBJS)
++${PROG}: make_webui $(MO-FILES) $(OBJS)
  	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)
  
  # Object
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 2a0019e..7ad725b 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 14f03b8efbc40b840eda8e203a6002d6c3f24250
+TVHEADEND_VERSION = 8d561f11d6e3678f801803d7c69cf32d5b915ec2
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-TVHEADEND_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) openssl
+TVHEADEND_DEPENDENCIES = \
+	host-gettext \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
+	openssl
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
