From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 27 Sep 2015 11:39:24 +0200
Subject: [Buildroot] [PATCH v2 4/4] docs/manual: FOO_SITE must not have a
	trailing slash
In-Reply-To: <1443346764-7433-1-git-send-email-luca@lucaceresoli.net>
References: <1443346764-7433-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1443346764-7433-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This has been the best practice since a long time, but it was not clearly
stated in the manual. Now it is considered an error, so mention it
explicitly.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/adding-packages-generic.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 4c12b42da862..40798c0283ff 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -227,7 +227,9 @@ information is (assuming the package name is +libfoo+) :
 
 * +LIBFOO_SITE+ provides the location of the package, which can be a
   URL or a local filesystem path. HTTP, FTP and SCP are supported URL
-  types for retrieving package tarballs. Git, Subversion, Mercurial,
+  types for retrieving package tarballs. In these cases don't include a
+  trailing slash: it will be added by Buildroot between the directory
+  and the filename as appropriate. Git, Subversion, Mercurial,
   and Bazaar are supported URL types for retrieving packages directly
   from source code management systems. There is a helper function to make
   it easier to download source tarballs from GitHub (refer to
@@ -246,7 +248,7 @@ information is (assuming the package name is +libfoo+) :
     +LIBFOO_SITE=http://www.libfoosoftware.org/libfoo+ +
     +LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor+ +
     +LIBFOO_SITE=/opt/software/libfoo.tar.gz+ +
-    +LIBFOO_SITE=$(TOPDIR)/../src/libfoo/+
+    +LIBFOO_SITE=$(TOPDIR)/../src/libfoo+
 
 * +LIBFOO_EXTRA_DOWNLOADS+ is a space-separated list of additional
   files that Buildroot should download. If an entry contains +://+
-- 
1.9.1
