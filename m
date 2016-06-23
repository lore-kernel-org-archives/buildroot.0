From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jun 2016 21:09:34 -0300
Subject: [Buildroot] [PATCH] e2fsprogs: add fuse2fs libintl fix patch
Message-ID: <1466640574-12773-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/ab5/ab5c5b0e234f3d9db78c968334a61a7aef206b7a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/e2fsprogs/0003-fuse2fs-needs-SYSLIBS.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/e2fsprogs/0003-fuse2fs-needs-SYSLIBS.patch

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
-- 
2.7.3
