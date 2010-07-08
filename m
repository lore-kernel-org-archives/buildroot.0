From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Jul 2010 13:57:12 +0200
Subject: [Buildroot] [git commit master 1/1] libcgi: fix target install if
	usr/include doesn't exist
Message-ID: <20100708115827.306C28269B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bd747b77b7702a2827635044e8f6648f167004ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                     |    2 +-
 package/libcgi/libcgi.patch |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9f3d1a4..da62f13 100644
--- a/CHANGES
+++ b/CHANGES
@@ -17,7 +17,7 @@
 	Updated/fixed packages: berkeleydb, bash, blackbox, busybox,
 	bzip2, cdrkit, dash, dialog, diffutils, distcc, dmalloc,
 	dnsmasq, dropbear, e2fsprogs, fbv, file, gawk, gstreamer,
-	gzip, intltool, ipsec-tools, iptables, libart, libfuse,
+	gzip, intltool, ipsec-tools, iptables, libart, libcgi, libfuse,
 	libgpg-error, libidn, liblockfile, links, lmbench, lrzsz,
 	make, module-init-tools, nbd, ncurses, netperf, ntfsprogs,
 	openssl, php, qt, quagga, sqlite, sdl, sdl_mixer, sdl_sound,
diff --git a/package/libcgi/libcgi.patch b/package/libcgi/libcgi.patch
index 5cf4915..716d83c 100644
--- a/package/libcgi/libcgi.patch
+++ b/package/libcgi/libcgi.patch
@@ -71,7 +71,7 @@
 -	cp src/session.h $(INCDIR)
 +	cp src/libcgi.a $(DESTDIR)/$(LIBDIR)
 +	cp src/libcgi.so $(DESTDIR)/$(LIBDIR)
-+	[ -d $(DESTDIR)/$(INCDIR) ] || mkdir $(DESTDIR)/$(INCDIR)
++	[ -d $(DESTDIR)/$(INCDIR) ] || mkdir -p $(DESTDIR)/$(INCDIR)
 +	cp src/cgi.h $(DESTDIR)/$(INCDIR)
 +	cp src/session.h $(DESTDIR)/$(INCDIR)
  
-- 
1.7.1
