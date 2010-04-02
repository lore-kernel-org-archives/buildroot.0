From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Apr 2010 15:13:46 +0200
Subject: [Buildroot] [git commit master] radvd: needs host-flex
Message-ID: <20100402131535.6298C8B48A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a179adef3e6233752d501fe0039496d2b669cd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1369

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    3 ++-
 package/radvd/radvd.mk |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index d963a44..174c73f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,7 +12,7 @@
 	Updated/fixed packages: busybox, dnsmasq, dosfstools, e2fsprogs,
 	freetype, iperf, iptables, iw, less, libgcrypt, libglib2, libpng,
 	libxml2, mdadm, memstat, mtd-utils, nano, openssl, php, pppd,
-	setserial, squashfs, wget, xlib_libX11, xlib_libXfont
+	radvd, setserial, squashfs, wget, xlib_libX11, xlib_libXfont
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -29,6 +29,7 @@
 	#1303: Add librsync package
 	#1327: mtd-utils compile failure due to lack of --sysroot in CFLAGS
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
+	#1369: cannot build radvd (flex problem)
 	#1387: xlib_libX11-1.3.2 can't find libjpeg
 	#1411: [SECURITY] Update openssl package to 0.9.8n
 	#1417: Bump iptables to 1.4.7
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index bf1ac77..defcf4b 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -9,7 +9,7 @@ RADVD_SITE:=http://www.litech.org/radvd/dist/
 RADVD_AUTORECONF:=no
 RADVD_INSTALL_STAGING:=no
 RADVD_INSTALL_TARGET:=YES
-RADVD_DEPENDENCIES:=flex
+RADVD_DEPENDENCIES:=flex host-flex
 RADVD_MAKE:=$(MAKE1)
 RADVD_CONF_OPT:= --program-prefix=''
 
-- 
1.6.3.3
