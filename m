From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Sep 2019 22:22:07 +0200
Subject: [Buildroot] [git commit] package/pulseaudio: bump version to 13.0
Message-ID: <20190921205013.2E8BD8F06D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b77a371c4c8dc2a44f960c67837faeeffefd74f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/13.0/

Support for bluez4 was removed upstream:
https://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=3b1093c0ad882640ef7cf2b88088d77988be7610

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseaudio/pulseaudio.hash | 4 ++--
 package/pulseaudio/pulseaudio.mk   | 9 +--------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index 7e1ea1606e..11d9a275c8 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2018-July/030280.html
-sha256 809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055  pulseaudio-12.2.tar.xz
+# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2019-September/031373.html
+sha256 961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057  pulseaudio-13.0.tar.xz
 # Locally computed
 sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  GPL
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index c91af22935..53e10429ad 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 12.2
+PULSEAUDIO_VERSION = 13.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
@@ -82,13 +82,6 @@ else
 PULSEAUDIO_CONF_OPTS += --without-soxr
 endif
 
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS)$(BR2_PACKAGE_SBC),yy)
-PULSEAUDIO_CONF_OPTS += --enable-bluez4
-PULSEAUDIO_DEPENDENCIES += bluez_utils sbc
-else
-PULSEAUDIO_CONF_OPTS += --disable-bluez4
-endif
-
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC),yy)
 PULSEAUDIO_CONF_OPTS += --enable-bluez5
 PULSEAUDIO_DEPENDENCIES += bluez5_utils sbc
