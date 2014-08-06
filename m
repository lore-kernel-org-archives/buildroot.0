From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Wed,  6 Aug 2014 13:40:36 +0200
Subject: [Buildroot] [PATCHv2 1/1] jack2: Added staging
Message-ID: <1407325236-9823-1-git-send-email-pieter.degendt@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
---
Use waf build system to copy staging files iso doing it manually.

 package/jack2/jack2.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 68f6e42..3f52ff4 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -8,6 +8,7 @@ JACK2_VERSION = ab409a65df95bc261ff72b52d6b3f4a65cf3266a
 JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
 JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
+JACK2_INSTALL_STAGING = YES
 
 define JACK2_CONFIGURE_CMDS
 	(cd $(@D); \
@@ -27,4 +28,9 @@ define JACK2_INSTALL_TARGET_CMDS
 		install)
 endef
 
+define JACK2_INSTALL_STAGING_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) \
+		install)
+endef
+
 $(eval $(generic-package))
-- 
1.7.9.5
