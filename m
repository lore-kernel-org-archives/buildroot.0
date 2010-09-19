From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 18 Sep 2010 19:53:30 -0700
Subject: [Buildroot] [PATCH 08/21] genext2fs: bump to 1.4.1
In-Reply-To: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284864823-18993-9-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/genext2fs/genext2fs-1.4-nosquash.patch     |   14 -------------
 .../genext2fs-1.4-remove_ugly_warnings.patch       |   21 --------------------
 package/genext2fs/genext2fs-1.4.1-nosquash.patch   |   14 +++++++++++++
 .../genext2fs-1.4.1-remove_ugly_warnings.patch     |   21 ++++++++++++++++++++
 package/genext2fs/genext2fs.mk                     |    2 +-
 5 files changed, 36 insertions(+), 36 deletions(-)
 delete mode 100644 package/genext2fs/genext2fs-1.4-nosquash.patch
 delete mode 100644 package/genext2fs/genext2fs-1.4-remove_ugly_warnings.patch
 create mode 100644 package/genext2fs/genext2fs-1.4.1-nosquash.patch
 create mode 100644 package/genext2fs/genext2fs-1.4.1-remove_ugly_warnings.patch

diff --git a/package/genext2fs/genext2fs-1.4-nosquash.patch b/package/genext2fs/genext2fs-1.4-nosquash.patch
deleted file mode 100644
index 236dfcc..0000000
--- a/package/genext2fs/genext2fs-1.4-nosquash.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff -ru genext2fs-1.4/genext2fs.c genext2fs-1.4-nosquash/genext2fs.c
---- genext2fs-1.4/genext2fs.c	2006-12-19 17:45:31.000000000 +0100
-+++ genext2fs-1.4-nosquash/genext2fs.c	2007-02-09 10:47:05.000000000 +0100
-@@ -1629,10 +1629,6 @@
- 		mtime = st.st_mtime;
- 		name = dent->d_name;
- 		mode = get_mode(&st);
--		if(squash_uids)
--			uid = gid = 0;
--		if(squash_perms)
--			mode &= ~(FM_IRWXG | FM_IRWXO);
- 		if(stats)
- 			switch(st.st_mode & S_IFMT)
- 			{
diff --git a/package/genext2fs/genext2fs-1.4-remove_ugly_warnings.patch b/package/genext2fs/genext2fs-1.4-remove_ugly_warnings.patch
deleted file mode 100644
index ef23dfb..0000000
--- a/package/genext2fs/genext2fs-1.4-remove_ugly_warnings.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -ru genext2fs-1.4/genext2fs.c genext2fs-1.4-remove_ugly_warnings/genext2fs.c
---- genext2fs-1.4/genext2fs.c	2007-02-09 10:54:56.000000000 +0100
-+++ genext2fs-1.4-remove_ugly_warnings/genext2fs.c	2007-02-09 10:54:30.000000000 +0100
-@@ -1606,7 +1606,7 @@
- static void
- add2fs_from_dir(filesystem *fs, uint32 this_nod, int squash_uids, int squash_perms, uint32 fs_timestamp, struct stats *stats)
- {
--	uint32 nod;
-+	uint32 nod = 0;
- 	uint32 uid, gid, mode, ctime, mtime;
- 	const char *name;
- 	FILE *fh;
-@@ -2056,7 +2056,7 @@
- static filesystem *
- load_fs(FILE * fh, int swapit)
- {
--	size_t fssize;
-+	size_t fssize = 0;
- 	filesystem *fs;
- 	if((fseek(fh, 0, SEEK_END) < 0) || ((ssize_t)(fssize = ftell(fh)) == -1))
- 		perror_msg_and_die("input filesystem image");
diff --git a/package/genext2fs/genext2fs-1.4.1-nosquash.patch b/package/genext2fs/genext2fs-1.4.1-nosquash.patch
new file mode 100644
index 0000000..236dfcc
--- /dev/null
+++ b/package/genext2fs/genext2fs-1.4.1-nosquash.patch
@@ -0,0 +1,14 @@
+diff -ru genext2fs-1.4/genext2fs.c genext2fs-1.4-nosquash/genext2fs.c
+--- genext2fs-1.4/genext2fs.c	2006-12-19 17:45:31.000000000 +0100
++++ genext2fs-1.4-nosquash/genext2fs.c	2007-02-09 10:47:05.000000000 +0100
+@@ -1629,10 +1629,6 @@
+ 		mtime = st.st_mtime;
+ 		name = dent->d_name;
+ 		mode = get_mode(&st);
+-		if(squash_uids)
+-			uid = gid = 0;
+-		if(squash_perms)
+-			mode &= ~(FM_IRWXG | FM_IRWXO);
+ 		if(stats)
+ 			switch(st.st_mode & S_IFMT)
+ 			{
diff --git a/package/genext2fs/genext2fs-1.4.1-remove_ugly_warnings.patch b/package/genext2fs/genext2fs-1.4.1-remove_ugly_warnings.patch
new file mode 100644
index 0000000..ef23dfb
--- /dev/null
+++ b/package/genext2fs/genext2fs-1.4.1-remove_ugly_warnings.patch
@@ -0,0 +1,21 @@
+diff -ru genext2fs-1.4/genext2fs.c genext2fs-1.4-remove_ugly_warnings/genext2fs.c
+--- genext2fs-1.4/genext2fs.c	2007-02-09 10:54:56.000000000 +0100
++++ genext2fs-1.4-remove_ugly_warnings/genext2fs.c	2007-02-09 10:54:30.000000000 +0100
+@@ -1606,7 +1606,7 @@
+ static void
+ add2fs_from_dir(filesystem *fs, uint32 this_nod, int squash_uids, int squash_perms, uint32 fs_timestamp, struct stats *stats)
+ {
+-	uint32 nod;
++	uint32 nod = 0;
+ 	uint32 uid, gid, mode, ctime, mtime;
+ 	const char *name;
+ 	FILE *fh;
+@@ -2056,7 +2056,7 @@
+ static filesystem *
+ load_fs(FILE * fh, int swapit)
+ {
+-	size_t fssize;
++	size_t fssize = 0;
+ 	filesystem *fs;
+ 	if((fseek(fh, 0, SEEK_END) < 0) || ((ssize_t)(fssize = ftell(fh)) == -1))
+ 		perror_msg_and_die("input filesystem image");
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index 8c4981e..b4a8e70 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GENEXT2FS_VERSION=1.4
+GENEXT2FS_VERSION=1.4.1
 GENEXT2FS_SOURCE=genext2fs-$(GENEXT2FS_VERSION).tar.gz
 GENEXT2FS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/genext2fs
 
-- 
1.7.2.3
