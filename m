From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Aug 2017 08:34:15 +0300
Subject: [Buildroot] [PATCH next 1/2] lirc-tools: remove useless
	libusb-compat dependnecy
Message-ID: <c21debe1fe36162b182803d45b5e6b0ab4ff575d.1503898456.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The only plugin that uses libusb/libusb-compat is the ftdi plugin. This
plugin needs libftdi1 that already depends on libusb in Buildroot. So in
practice libusb-compat is never actually used; we can safely remove it.
The libusb dependency is implicit in the libftdi1 optional dependency.

Cc: Rhys Williams <github@wilberforce.co.nz>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lirc-tools/lirc-tools.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 9d46c1b1b042..e767d9d7f02c 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -23,10 +23,6 @@ ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIRC_TOOLS_DEPENDENCIES += alsa-lib
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
-LIRC_TOOLS_DEPENDENCIES += libusb-compat
-endif
-
 ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
 LIRC_TOOLS_DEPENDENCIES += portaudio
 endif
-- 
2.14.1
