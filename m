From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 13 Sep 2011 23:44:59 +0200
Subject: [Buildroot] [git commit] samba: fix linking of smbd with avahi
	support
Message-ID: <20110913214740.A02AF8D59E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c71b56b8c1dd6c389be8457d534a04e99cf6bf9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Expliticly link with -lpthread if smbd is compiled with
avahi support. Otherwise the binary will fail to run.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/samba-fix-smbd-libs-avahi.patch |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 package/samba/samba-fix-smbd-libs-avahi.patch

diff --git a/package/samba/samba-fix-smbd-libs-avahi.patch b/package/samba/samba-fix-smbd-libs-avahi.patch
new file mode 100644
index 0000000..d6423de
--- /dev/null
+++ b/package/samba/samba-fix-smbd-libs-avahi.patch
@@ -0,0 +1,15 @@
+Expliticly link with -lpthread if smbd is compiled with
+avahi support. Otherwise the binary will fail to run.
+
+Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
+--- samba-3.5.6-orig/source3/Makefile.in	2010-10-07 18:41:16.000000000 +0200
++++ samba-3.5.6/source3/Makefile.in	2010-10-27 14:52:40.000000000 +0200
+@@ -1552,7 +1552,7 @@
+ 		$(KRB5LIBS) $(DYNEXP) $(PRINT_LIBS) $(AUTH_LIBS) \
+ 		$(ACL_LIBS) $(PASSDB_LIBS) $(LIBS) $(DNSSD_LIBS) $(AVAHI_LIBS) \
+ 		$(POPT_LIBS) @SMBD_LIBS@ $(LIBTALLOC_LIBS) $(LIBTDB_LIBS) \
+-		$(LIBWBCLIENT_LIBS) $(ZLIB_LIBS)
++		$(LIBWBCLIENT_LIBS) $(ZLIB_LIBS) $(PTHREAD_LDFLAGS)
+ 
+ bin/nmbd at EXEEXT@: $(BINARY_PREREQS) $(NMBD_OBJ) @BUILD_POPT@ $(LIBTALLOC) $(LIBTDB) $(LIBWBCLIENT)
+ 	@echo Linking $@
-- 
1.7.3.4
