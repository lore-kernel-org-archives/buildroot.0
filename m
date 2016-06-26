From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 22:30:33 +0200
Subject: [Buildroot] [git commit] package/lirc-tools: add optional support
	for alsa-lib
Message-ID: <20160626203108.CB06581785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b51d3eefd0c7330b5b5ce15aaadb92661371c384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lirc-tools has optional support for alsa-lib, see configure.ac,
line 230+.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lirc-tools/lirc-tools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 0c9eaa3..36d749e 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -22,6 +22,10 @@ ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIRC_TOOLS_DEPENDENCIES += udev
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+LIRC_TOOLS_DEPENDENCIES += alsa-lib
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
 LIRC_TOOLS_DEPENDENCIES += libusb-compat
 endif
