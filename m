From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 23:08:28 +0200
Subject: [Buildroot] [git commit] e2fsprogs: add fuse2fs libintl fix patch
Message-ID: <20160626210833.DC937801D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fedaff21305dfc35a75914670cc81ebae3668eca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ab5/ab5c5b0e234f3d9db78c968334a61a7aef206b7a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/0003-fuse2fs-needs-SYSLIBS.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/e2fsprogs/0003-fuse2fs-needs-SYSLIBS.patch b/package/e2fsprogs/0003-fuse2fs-needs-SYSLIBS.patch
new file mode 100644
index 0000000..61c6965
--- /dev/null
+++ b/package/e2fsprogs/0003-fuse2fs-needs-SYSLIBS.patch
@@ -0,0 +1,30 @@
+From ff6147dd7197519e561e796d56545c4e11eb43fa Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 22 Jun 2016 20:55:35 -0300
+Subject: [PATCH e2fsprogs] fuse2fs: needs SYSLIBS
+
+It otherwise leads to build failure when using an unbundled libintl.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: sent to ML http://marc.info/?l=linux-ext4&m=146664003825136&w=2
+
+ misc/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/misc/Makefile.in b/misc/Makefile.in
+index f67c9c7..e487692 100644
+--- a/misc/Makefile.in
++++ b/misc/Makefile.in
+@@ -389,7 +389,7 @@ fuse2fs: $(FUSE2FS_OBJS) $(DEPLIBS) $(DEPLIBBLKID) $(DEPLIBUUID) \
+ 	$(E) "	LD $@"
+ 	$(Q) $(CC) $(ALL_LDFLAGS) -o fuse2fs $(FUSE2FS_OBJS) $(LIBS) \
+ 		$(LIBFUSE) $(LIBBLKID) $(LIBUUID) $(LIBEXT2FS) $(LIBINTL) \
+-		$(CLOCK_GETTIME_LIB)
++		$(CLOCK_GETTIME_LIB) $(SYSLIBS)
+ 
+ journal.o: $(srcdir)/../debugfs/journal.c
+ 	$(E) "	CC $@"
+-- 
+2.7.3
+
