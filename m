From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:14:12 +0200
Subject: [Buildroot] [git commit branch/next] package/oprofile: bump to
 version 1.3.0
Message-ID: <20190601131616.845808E7A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2888bd1592a2737ec7a446d60b1da27247d262ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove second patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...archive-replace-basename-with-op_basename.patch | 34 ----------------------
 package/oprofile/oprofile.hash                     |  6 ++--
 package/oprofile/oprofile.mk                       |  2 +-
 3 files changed, 4 insertions(+), 38 deletions(-)

diff --git a/package/oprofile/0002-oparchive-replace-basename-with-op_basename.patch b/package/oprofile/0002-oparchive-replace-basename-with-op_basename.patch
deleted file mode 100644
index a2b580dad7..0000000000
--- a/package/oprofile/0002-oparchive-replace-basename-with-op_basename.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5da92e18a538c630cb06a3dbb2affd9bfc128901 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 5 Jun 2018 13:31:34 +0200
-Subject: [PATCH] oparchive: replace basename with op_basename
-
-Use op_basename instead of basename in oparchive function.
-This seems to be the intended use as there is no include on libgen.h for
-the standard basename and the argument is a const char* instead of a
-char*.
-
-Fixes:
- - http://autobuild.buildroot.net/results/06fbff267063e09f7bc06adb08c896f861ecdb1d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- pp/oparchive.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pp/oparchive.cpp b/pp/oparchive.cpp
-index 6221e148..274152ba 100644
---- a/pp/oparchive.cpp
-+++ b/pp/oparchive.cpp
-@@ -261,7 +261,7 @@ int oparchive(options::spec const & spec)
- 		/* determine the session name of sample file */
- 		int offset = sample_name.find('{');
- 		string base_samples_dir = sample_name.substr(0, offset-1);
--		string session = basename(base_samples_dir.c_str());
-+		string session = op_basename(base_samples_dir.c_str());
- 		/* Get rid of the the archive_path from the name */
- 		string sample_base = sample_name.substr(offset);
- 		string sample_archive_file = dest_samples_dir + "/" + session + "/" + sample_base;
--- 
-2.14.1
-
diff --git a/package/oprofile/oprofile.hash b/package/oprofile/oprofile.hash
index 737137e0dd..d1d96c6232 100644
--- a/package/oprofile/oprofile.hash
+++ b/package/oprofile/oprofile.hash
@@ -1,6 +1,6 @@
-# From http://sourceforge.net/projects/oprofile/files/oprofile/oprofile-1.2.0/
-sha1	7bf28b74953bd042ff23dc53c399be96d37f144c	oprofile-1.2.0.tar.gz
-md5	4fcd3920984dcb607314b2e225086c3a		oprofile-1.2.0.tar.gz
+# From http://sourceforge.net/projects/oprofile/files/oprofile/oprofile-1.3.0/
+sha1	7daa0cca8587e399cb3df9eb817c6a39ffea2082	oprofile-1.3.0.tar.gz
+md5	bd998df5521ebedae31e71cd3fb6200b		oprofile-1.3.0.tar.gz
 
 # Hash for license file:
 sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 2b82194406..cc41e5c6da 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPROFILE_VERSION = 1.2.0
+OPROFILE_VERSION = 1.3.0
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
 OPROFILE_LICENSE = GPL-2.0+
 OPROFILE_LICENSE_FILES = COPYING
