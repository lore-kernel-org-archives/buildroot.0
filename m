From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 21:05:47 +0100
Subject: [Buildroot] [git commit] openocd: fix libftdi dependency if _FT2XXX
	option is selected
Message-ID: <20120202201521.C94369099F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b81a500f923a97e7a27c5c50466c23438fd5527
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openocd/openocd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index d79b33b..a12ba6c 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -19,6 +19,7 @@ OPENOCD_DEPENDENCIES = libusb-compat
 # Adapters
 ifeq ($(BR2_PACKAGE_OPENOCD_FT2XXX),y)
 OPENOCD_CONF_OPT += --enable-ft2232_libftdi
+OPENOCD_DEPENDENCIES += libftdi
 endif
 
 ifeq ($(BR2_PACKAGE_OPENOCD_JLINK),y)
