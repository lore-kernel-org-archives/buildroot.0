From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] gperf: needs C++ support
Message-ID: <20091123120648.E046177782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d66727128a8f06c57f2217f2ea215b8cf52b7dce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    2 +-
 package/gperf/Config.in |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5defd09..6404f37 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,7 +21,7 @@
 	sdl_sound, swfdec, sysstat
 
 	Updated/fixed packages: alsamixergui, autoconf, bootutils, busybox,
-	gcc, directfb, dnsmasq, e2fsprogs, festival, gamin, gstreamer,
+	gcc, directfb, dnsmasq, e2fsprogs, festival, gamin, gperf, gstreamer,
 	gst-plugins-bad, gst-plugins-base, gst-plugins-good, imagemagick,
 	ipkg, iptables, iw, kernel-headers, kismet, libelf, libevent, libglib2,
 	libidn, liblockfile, libmad, libpcap, libupnp, libuuid, lighttpd,
diff --git a/package/gperf/Config.in b/package/gperf/Config.in
index f5999e7..67b286b 100644
--- a/package/gperf/Config.in
+++ b/package/gperf/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_GPERF
 	bool "gperf"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  A 'perfect hash function' generator
 
 	  http://www.gnu.org/software/gperf/
+
+comment "gperf requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
1.6.3.3
