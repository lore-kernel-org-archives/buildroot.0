From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 23 Nov 2012 10:47:38 +0100
Subject: [Buildroot] [git commit] Revert "libhid: disable on avr32"
Message-ID: <20121123094843.900C69032D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf5d51717ba4988d41c2e86157b95b08b26f379b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 2424cc6783bbfb542f08cf1985b8c9ef18282161.

Now that we have a timerfd fix for libusb, this can be reverted.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libhid/Config.in |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libhid/Config.in b/package/libhid/Config.in
index bd1cfcb..093b98f 100644
--- a/package/libhid/Config.in
+++ b/package/libhid/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBHID
 	bool "libhid"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	depends on !BR2_avr32 # timerfd not in uClibc-0.9.31
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -10,4 +9,4 @@ config BR2_PACKAGE_LIBHID
 	  http://libhid.alioth.debian.org
 
 comment "libhid needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
