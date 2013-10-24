From: Arnaud Aujon <arnaud.aujon@gmail.com>
Date: Thu, 24 Oct 2013 13:58:43 +0200
Subject: [Buildroot]  [PATCH] openobex: use sourceforge repository
Message-ID: <1382615923-16924-1-git-send-email-arnaud.aujon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
---
 package/openobex/openobex.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index 7195a26..4f383c8 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-OPENOBEX_VERSION = 1.5
-OPENOBEX_SITE = http://ftp.osuosl.org/pub/linux/bluetooth
+OPENOBEX_VERSION_MAJOR = 1.5
+OPENOBEX_VERSION = $(OPENOBEX_VERSION_MAJOR).0
+OPENOBEX_SOURCE = openobex-$(OPENOBEX_VERSION)-Source.zip
+OPENOBEX_SITE = http://downloads.sourceforge.net/project/openobex/openobex/$(OPENOBEX_VERSION_MAJOR)
 # Libraries seems to be released under LGPLv2.1+,
 # while other material is under GPLv2+.
 OPENOBEX_LICENSE = GPLv2+/LGPLv2.1+
@@ -15,6 +17,12 @@ OPENOBEX_DEPENDENCIES = host-pkgconf
 OPENOBEX_AUTORECONF = YES
 OPENOBEX_INSTALL_STAGING = YES
 
+define OPENOBEX_EXTRACT_CMDS
++       unzip -d $(@D) $(DL_DIR)/$(OPENOBEX_SOURCE)
++       mv $(@D)/openobex-$(OPENOBEX_VERSION)-Source/* $(@D)
++       $(RM) -r $(@D)/openobex-$(OPENOBEX_VERSION)-Source
+endef
+
 OPENOBEX_CONF_OPT += \
 	$(if $(BR2_ENABLE_DEBUG),--enable-debug) \
 	$(if $(BR2_PACKAGE_OPENOBEX_APPS),--enable-apps) \
-- 
1.8.3.1
