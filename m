From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Apr 2010 17:44:28 +0200
Subject: [Buildroot] [git commit master] dnsmasq: fix CFLAGS
Message-ID: <20100401154536.3CFEE7FB82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ac5c5fd6ff9a2ad22ff197206eeead0bfc93c475
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1459

dnsmasq takes CFLAGS on make opt rather than env.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    5 +++--
 package/dnsmasq/dnsmasq.mk |    4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index a5406c3..1215a5c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,8 +7,8 @@
 
 	New packages: librsync, lmbench, netperf, squid
 
-	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
-	freetype, iperf, iptables, less, libgcrypt, libglib2, libpng,
+	Updated/fixed packages: busybox, dnsmasq, dosfstools, e2fsprogs,
+	freetype, iperf, iptables, iw, less, libgcrypt, libglib2, libpng,
 	libxml2, mdadm, memstat, mtd-utils, nano, openssl, php, pppd,
 	setserial, squashfs, wget, xlib_libX11, xlib_libXfont
 
@@ -34,6 +34,7 @@
 	#1429: [SECURITY] Update php to 5.2.13
 	#1441: Add binutils 2.20.1
 	#1447: Package installation on target with debug symbols is broken
+	#1459: Misc QA fixes
 
 2010.02, Release February 26th, 2010:
 
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 86b3eef..d32b794 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -7,8 +7,8 @@
 DNSMASQ_VERSION = 2.52
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_AUTORECONF = NO
-DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
-DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr
+DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)"
+DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
 DNSMASQ_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) PREFIX=/usr install
 
 ifneq ($(BR2_INET_IPV6),y)
-- 
1.6.3.3
