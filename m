From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Oct 2015 21:12:18 +0100
Subject: [Buildroot] [git commit] docs/manual: FOO_SITE must not have a
	trailing slash
Message-ID: <20151002201233.7B40A818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7ed1243a51352789b8130ebdd692b75b1e8cf07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This has been the best practice since a long time, but it was not
clearly stated in the manual. Now it is mandatory, so mention it
explicitly.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 4c12b42..40798c0 100644
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
