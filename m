From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 May 2012 10:32:31 +0200
Subject: [Buildroot] [git commit] e2fsprogs: bump to 1.42.3
Message-ID: <20120531113259.A5BBB96E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4544589e7c58ff9532e415871997c9b7549a021b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove e2fsprogs-add-missing-dep-of-tst_uuid-o.patch as
the changes are already upstream

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../e2fsprogs-add-missing-dep-of-tst_uuid-o.patch  |   18 ------------------
 package/e2fsprogs/e2fsprogs.mk                     |    2 +-
 2 files changed, 1 insertions(+), 19 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs-add-missing-dep-of-tst_uuid-o.patch b/package/e2fsprogs/e2fsprogs-add-missing-dep-of-tst_uuid-o.patch
deleted file mode 100644
index 3a60e89..0000000
--- a/package/e2fsprogs/e2fsprogs-add-missing-dep-of-tst_uuid-o.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Add missing dependency of tst_uuid.o on uuid.h
-
-The missing dependency used to break parallel builds.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
-diff -Nrup e2fsprogs.orig//lib/uuid/Makefile.in e2fsprogs-1.41.14//lib/uuid/Makefile.in
---- e2fsprogs.orig//lib/uuid/Makefile.in	2010-06-14 05:07:36.000000000 +0200
-+++ e2fsprogs-1.41.14//lib/uuid/Makefile.in	2011-07-18 13:44:58.000000000 +0200
-@@ -76,7 +76,7 @@ uuid.h: $(srcdir)/uuid.h.in
- $(top_builddir)/lib/uuid/uuid_types.h: $(srcdir)/uuid_types.h.in $(top_builddir)/config.status
- 	cd $(top_builddir); CONFIG_FILES=$(my_dir)/uuid_types.h ./config.status
- 
--tst_uuid.o: $(srcdir)/tst_uuid.c
-+tst_uuid.o: $(srcdir)/tst_uuid.c uuid.h
- 	$(E) "	CC $@"
- 	$(Q) $(CC) $(ALL_CFLAGS) -c $(srcdir)/tst_uuid.c -o tst_uuid.o
- 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 5f87b40..db66635 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-E2FSPROGS_VERSION = 1.42.2
+E2FSPROGS_VERSION = 1.42.3
 E2FSPROGS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 
 E2FSPROGS_CONF_OPT = \
