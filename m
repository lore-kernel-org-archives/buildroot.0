From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:42 -0000
Subject: [Buildroot] [git commit branch/next] docs: update LIBFOO_SITE to
	describe use of filesystem paths
Message-ID: <20120802195247.8B52196EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c62b04ce9a029943185da187b8e6a17a52591cba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Buildroot supports the use of local filesystem paths in LIBFOO_SITE
since the 2011.11 release, but this is not documented in the manual.
Fix this and slightly reword the surrounding doucmentation
accordingly.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-gentargets.txt |   21 ++++++++++++++-------
 1 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index cfcee8c..918580e 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -156,13 +156,18 @@ information is (assuming the package name is +libfoo+) :
   package directory inside Buildroot will be applied to the package
   after extraction.
 
-* +LIBFOO_SITE+ may contain the Internet location of the package. It
-  can either be the HTTP, FTP or SCP location of a tarball, or the URL
-  of a Git, Subversion, Mercurial or Bazaar repository (see
-  +LIBFOO_SITE_METHOD+ below). +
-  SCP URLs should be of the form +scp://[user@]host:filepath+. Note
-  that filepath is relative to the user's home directory, so you may want
-  to prepend the path with a slash for absolute paths:
+* +LIBFOO_SITE+ provides the location of the package, which can be a
+  URL or a local filesystem path. HTTP, FTP and SCP are supported URL
+  types for retrieving package tarballs. Git, Subversion, Mercurial,
+  and Bazaar are supported URL types for retrieving packages directly
+  from source code management systems. A filesystem path may be used
+  to specify either a tarball or a directory containing the package
+  source code. See +LIBFOO_SITE_METHOD+ below for more details on how
+  retrieval works. +
+  Note that SCP URLs should be of the form
+  +scp://[user@]host:filepath+, and that filepath is relative to the
+  user's home directory, so you may want to prepend the path with a
+  slash for absolute paths:
   +scp://[user@]host:/absolutepath+. +
   If +HOST_LIBFOO_SITE+ is not specified, it defaults to
   +LIBFOO_SITE+. If none are specified, then the location is assumed
@@ -172,6 +177,8 @@ information is (assuming the package name is +libfoo+) :
     +LIBFOO_SITE=http://www.libfoosoftware.org/libfoo+ +
     +LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/+ +
     +LIBFOO_SITE=git://github.com/kergoth/tslib.git+
+    +LIBFOO_SITE=/opt/software/libfoo.tar.gz+
+    +LIBFOO_SITE=$(TOPDIR)/../src/libfoo/+
 
 * +LIBFOO_SITE_METHOD+ may contain the method to fetch the package
   source code. It can either be +wget+ (for normal FTP/HTTP downloads
