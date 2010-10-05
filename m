From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Oct 2010 12:08:55 +0200
Subject: [Buildroot] [git commit master 1/1] ipsec-tools: breaks with
	parallel builds
Message-ID: <20101005101042.7292F8B865@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f40cb9cb5474ffe06bf05371593c6a9a8ef0d330
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                            |   10 +++++-----
 package/ipsec-tools/ipsec-tools.mk |    1 +
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4a382a2..9ca8a29 100644
--- a/CHANGES
+++ b/CHANGES
@@ -29,11 +29,11 @@
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
 	fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk, gperf,
 	gtk2-themes, gtkperf, gvfs, haserl, hdparm, hostapd, hwdata,
-	ifplugd, imagemagick, iperf, iproute2, iptables, iw, jpeg,
-	kexec, kismet, less, libcgi, libcurl, libdaemon, libdnet,
-	liberation, libevent, libeXosip2, libglade, libgtk2, libiconv,
-	libidn, libmms, libnl, liboil, libosip2, libpcap, libpng,
-	libtool, libungif, libxml2, libxslt, lighttpd, lite,
+	ifplugd, imagemagick, iperf, ipsec-tools, iproute2, iptables,
+	iw, jpeg, kexec, kismet, less, libcgi, libcurl, libdaemon,
+	libdnet, liberation, libevent, libeXosip2, libglade, libgtk2,
+	libiconv, libidn, libmms, libnl, liboil, libosip2, libpcap,
+	libpng, libtool, libungif, libxml2, libxslt, lighttpd, lite,
 	lm-sensors, lockfile-progs, logrotate, m4, mdadm, mesa3d,
 	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
 	netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd,
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index eddc7ce..0861a05 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -8,6 +8,7 @@ IPSEC_TOOLS_VERSION = 0.7.3
 IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
 IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/0.7/
 IPSEC_TOOLS_INSTALL_STAGING = YES
+IPSEC_TOOLS_MAKE = $(MAKE1)
 IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
 
 # configure hardcodes -Werror, so override CFLAGS on make invocation
-- 
1.7.1
