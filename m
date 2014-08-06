From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 19:41:51 +0200
Subject: [Buildroot] [git commit] jack2: add staging installation
Message-ID: <20140806174234.52B1F9D3C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2bd5990744d23cf08dc54a355f4b573c3f55bb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jack2 installs some headers and libraries that can be used by other
applications, so it makes sense to install it to the staging
directory.

Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jack2/jack2.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
