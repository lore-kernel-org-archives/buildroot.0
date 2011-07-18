From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 18 Jul 2011 14:11:39 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: Add missing dependency of tst_uuid.o
	on uuid.h
Message-ID: <1310991099-3829-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The missing dependency used to break parallel builds.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...rogs-1.41.9-add-missing-dep-of-tst_uuid-o.patch |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/e2fsprogs/e2fsprogs-1.41.9-add-missing-dep-of-tst_uuid-o.patch

diff --git a/package/e2fsprogs/e2fsprogs-1.41.9-add-missing-dep-of-tst_uuid-o.patch b/package/e2fsprogs/e2fsprogs-1.41.9-add-missing-dep-of-tst_uuid-o.patch
new file mode 100644
index 0000000..3a60e89
--- /dev/null
+++ b/package/e2fsprogs/e2fsprogs-1.41.9-add-missing-dep-of-tst_uuid-o.patch
@@ -0,0 +1,18 @@
+Add missing dependency of tst_uuid.o on uuid.h
+
+The missing dependency used to break parallel builds.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+diff -Nrup e2fsprogs.orig//lib/uuid/Makefile.in e2fsprogs-1.41.14//lib/uuid/Makefile.in
+--- e2fsprogs.orig//lib/uuid/Makefile.in	2010-06-14 05:07:36.000000000 +0200
++++ e2fsprogs-1.41.14//lib/uuid/Makefile.in	2011-07-18 13:44:58.000000000 +0200
+@@ -76,7 +76,7 @@ uuid.h: $(srcdir)/uuid.h.in
+ $(top_builddir)/lib/uuid/uuid_types.h: $(srcdir)/uuid_types.h.in $(top_builddir)/config.status
+ 	cd $(top_builddir); CONFIG_FILES=$(my_dir)/uuid_types.h ./config.status
+ 
+-tst_uuid.o: $(srcdir)/tst_uuid.c
++tst_uuid.o: $(srcdir)/tst_uuid.c uuid.h
+ 	$(E) "	CC $@"
+ 	$(Q) $(CC) $(ALL_CFLAGS) -c $(srcdir)/tst_uuid.c -o tst_uuid.o
+ 
-- 
1.7.5.4
