From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Feb 2010 12:11:37 +0100
Subject: [Buildroot] [git commit master] fbdump: don't add target program
	prefix
Message-ID: <20100204111215.EFE2D772D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d131dba8b22bdc856a8975102e73a9f4795c5fca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/fbdump/fbdump.mk |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 40b5ae5..088de1f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 
 	Updated/fixed packages: alsa-lib, alsa-utils, at, autoconf, bash,
 	bind, binutils, bootutils, busybox, dbus, directfb, dnsmasq,
-	e2fsprogs, gstreamer, gperf, gst-plugins-bad, gvfs, flex, hal,
+	e2fsprogs, gstreamer, gperf, gst-plugins-bad, gvfs, fbdump, flex, hal,
 	iptables, iw, jpeg, kismet, libfuse, libglib2, libpcap, libungif,
 	libxml2, libxslt, lighttpd, mesa, mpg123, mtd-utils, nbd, neon,
 	netstat-nat, openvpn, pcre, php, qt, readline, rpm, sawman, sdl,
diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index 521b0fd..eb74d8b 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -7,6 +7,7 @@ FBDUMP_VERSION:=0.4.2
 FBDUMP_SOURCE:=fbdump-$(FBDUMP_VERSION).tar.gz
 FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
 FBDUMP_AUTORECONF = NO
+FBDUMP_CONF_OPT = --program-prefix=''
 
 $(eval $(call AUTOTARGETS,package,fbdump))
 
-- 
1.6.3.3
