From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Jun 2011 08:50:25 +0200
Subject: [Buildroot] [git commit] synergy: ensure cross X11 headers /
	libraries are used
Message-ID: <20110614065041.9BD078733C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3790e3ceed72f13767cdc41f8c05188d487c3a5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise configure would check for Xtst support on the host.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/synergy/synergy.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index ce3f214..d56bd3e 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -7,9 +7,8 @@
 SYNERGY_VERSION = 1.3.1
 SYNERGY_SOURCE = synergy-$(SYNERGY_VERSION).tar.gz
 SYNERGY_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/synergy2/
-SYNERGY_AUTORECONF = NO
-SYNERGY_INSTALL_STAGING = NO
-SYNERGY_INSTALL_TARGET = YES
+SYNERGY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
+                   --x-libraries=$(STAGING_DIR)/usr/lib
 
 SYNERGY_DEPENDENCIES = xserver_xorg-server xlib_libXtst
 
-- 
1.7.3.4
