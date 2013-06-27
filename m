From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 14:23:33 +0200
Subject: [Buildroot] [git commit] samba: bump to version 3.6.16
Message-ID: <20130627122815.923779B22B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97c0a64aa3dbf4a5e68f35fcf7c08fa571c28d15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/samba-fix-smbd-libs-avahi.patch |   14 ++++++++------
 package/samba/samba.mk                        |    2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/samba/samba-fix-smbd-libs-avahi.patch b/package/samba/samba-fix-smbd-libs-avahi.patch
index d6423de..6624f57 100644
--- a/package/samba/samba-fix-smbd-libs-avahi.patch
+++ b/package/samba/samba-fix-smbd-libs-avahi.patch
@@ -2,14 +2,16 @@ Expliticly link with -lpthread if smbd is compiled with
 avahi support. Otherwise the binary will fail to run.
 
 Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---- samba-3.5.6-orig/source3/Makefile.in	2010-10-07 18:41:16.000000000 +0200
-+++ samba-3.5.6/source3/Makefile.in	2010-10-27 14:52:40.000000000 +0200
-@@ -1552,7 +1552,7 @@
+
+diff -Nura samba-3.6.16.orig/source3/Makefile.in samba-3.6.16/source3/Makefile.in
+--- samba-3.6.16.orig/source3/Makefile.in	2013-06-21 08:12:39.995871935 -0300
++++ samba-3.6.16/source3/Makefile.in	2013-06-21 08:13:17.778103805 -0300
+@@ -1783,7 +1783,7 @@
  		$(KRB5LIBS) $(DYNEXP) $(PRINT_LIBS) $(AUTH_LIBS) \
  		$(ACL_LIBS) $(PASSDB_LIBS) $(LIBS) $(DNSSD_LIBS) $(AVAHI_LIBS) \
- 		$(POPT_LIBS) @SMBD_LIBS@ $(LIBTALLOC_LIBS) $(LIBTDB_LIBS) \
+ 		$(POPT_LIBS) @SMBD_LIBS@ $(LIBTALLOC_LIBS) $(LIBTEVENT_LIBS) $(LIBTDB_LIBS) \
 -		$(LIBWBCLIENT_LIBS) $(ZLIB_LIBS)
 +		$(LIBWBCLIENT_LIBS) $(ZLIB_LIBS) $(PTHREAD_LDFLAGS)
- 
- bin/nmbd at EXEEXT@: $(BINARY_PREREQS) $(NMBD_OBJ) @BUILD_POPT@ $(LIBTALLOC) $(LIBTDB) $(LIBWBCLIENT)
+
+ bin/nmbd at EXEEXT@: $(BINARY_PREREQS) $(NMBD_OBJ) @BUILD_POPT@ $(LIBTALLOC) $(LIBTEVENT) $(LIBTDB) $(LIBWBCLIENT)
  	@echo Linking $@
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 528e29c..fd90d96 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA_VERSION = 3.6.15
+SAMBA_VERSION = 3.6.16
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
