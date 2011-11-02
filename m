From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Nov 2011 12:00:52 +0100
Subject: [Buildroot] [git commit] mtd: make sure that dest dir exists before
	installing mtd files
Message-ID: <20111102114939.800158F415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6473f6c035863ee846f3b1ebc239cabdcb497301
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #4387

Signed-off-by: Danomi Mocelopolis <d_mo1234@yahoo.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    3 ++-
 package/mtd/mtd.mk |    4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 74ec64f..0043126 100644
--- a/CHANGES
+++ b/CHANGES
@@ -33,7 +33,7 @@
 	libglib2, libiconv, libmpd, libreplaygain, libroxml,
 	libsamplerate, libsndfile, libsoup, libsvgtiny, libtool,
 	lighttpd, links, linux-fusion, lite, lrzsz, lsof, lzo, lzop,
-	makedevs, mcookie, mpg123, mpd, mpfr, musepack, mutt,
+	makedevs, mcookie, mpg123, mpd, mpfr, mtd, musepack, mutt,
 	mysql_client, ncftp, ncurses, neon, netcat, netsnmp, ntfs-3g,
 	ntfsprogs, ntp, openntpd, openssh, openssl, orc, pciutils,
 	psmisc, python, qt, quagga, radvd, rpm, rsync, samba, sawman,
@@ -70,6 +70,7 @@
 	#4183: Codesourcery toolchain download site has changed
 	#4231: libneon.so: undefined reference to `SSL_SESSION_cmp'
 	#4381: Add option to lighttpd to enable Lua support
+	#4387: Make sure that dest dir exists before installing mtd files
 
 2011.08, Released August 31th, 2011:
 
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index ef876e2..1b23e83 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -91,10 +91,10 @@ endef
 
 define MTD_INSTALL_TARGET_CMDS
  for f in $(MTD_TARGETS_y) ; do \
-  install -m 0755 $(@D)/$$f $(TARGET_DIR)/usr/sbin/$$f ; \
+  install -D -m 0755 $(@D)/$$f $(TARGET_DIR)/usr/sbin/$$f ; \
  done ; \
  for f in $(MTD_TARGETS_UBI_y) ; do \
-  install -m 0755 $(@D)/ubi-utils/$$f $(TARGET_DIR)/usr/sbin/$$f ; \
+  install -D -m 0755 $(@D)/ubi-utils/$$f $(TARGET_DIR)/usr/sbin/$$f ; \
  done
 endef
 
