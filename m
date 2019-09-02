From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 12:38:32 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/pcmanfm: fix
 build with NLS
Message-ID: <20190902103425.CB76E88F23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f05e6445db70590d929cf6d689e4ec7e560ffdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/f6dfad52aa7f3528472a33a0fe4f5e35932541d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 36418cb159cdf7fd893527337ff3b73557295092)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcmanfm/pcmanfm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 6dadfaeebd..5d8730984c 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -7,9 +7,10 @@
 PCMANFM_VERSION = 1.3.0
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.xz
 PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
-PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm
+PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm $(TARGET_NLS_DEPENDENCIES)
 PCMANFM_LICENSE = GPL-2.0+
 PCMANFM_LICENSE_FILES = COPYING
+PCMANFM_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 PCMANFM_CONF_OPTS += --with-gtk=3
