From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Oct 2011 09:11:21 +0200
Subject: [Buildroot] [git commit] neon: bump version
Message-ID: <20111011075631.CDB958E2F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ece8e2775cb189874a0e490934cea2f39dbb734
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #4321

Old neon version wasn't compatible with our openssl version, so bump
the version. This also fixes some security related bugs.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    3 ++-
 package/neon/neon.mk |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6345210..cac5053 100644
--- a/CHANGES
+++ b/CHANGES
@@ -32,7 +32,7 @@
 	libevent, libglib2, libiconv, libreplaygain, libroxml,
 	libsamplerate, libsndfile, libsoup, libsvgtiny, libtool,
 	lighttpd, linux-fusion, lite, lsof, lzo, lzop, mcookie,
-	mpg123, mpd, mpfr, musepack, mysql_client, ncurses, netcat,
+	mpg123, mpd, mpfr, musepack, mysql_client, ncurses, neon, netcat,
 	netsnmp, ntfs-3g, ntfsprogs, openssh, openssl, python, qt,
 	radvd, rsync, samba, sawman, sdl_sound, smartmontools, sqlite,
 	squid, sylpheed, taglib, tar, tcpreplay, tslib, usbutils,
@@ -63,6 +63,7 @@
 	#4165: lrzsz-fix-symlink-at-rebuild.patch
 	#4171: makedevs-unused-but-set-variable.patch
 	#4183: Codesourcery toolchain download site has changed
+	#4231: libneon.so: undefined reference to `SSL_SESSION_cmp'
 
 2011.08, Released August 31th, 2011:
 
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 4e17188..95664d7 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -3,7 +3,7 @@
 # neon
 #
 #############################################################
-NEON_VERSION:=0.28.3
+NEON_VERSION:=0.29.6
 NEON_SITE:=http://www.webdav.org/neon/
 NEON_INSTALL_STAGING:=YES
 NEON_CONF_OPT:=--without-gssapi --disable-rpath
