From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 21:31:07 +0100
Subject: [Buildroot] [git commit] docs/manual: update to mention the
	multiple patches support
Message-ID: <20130107212530.25B4C9A691@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6009b94ca5721b0601b689fc350e1713f342239
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After the modification of the <pkg>_PATCH semantic, let's update the
documentation accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-generic.txt |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 0759d4f..7b8561a 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -156,14 +156,17 @@ information is (assuming the package name is +libfoo+) :
   +packagename-$(LIBFOO_VERSION).tar.gz+. +
   Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
 
-* +LIBFOO_PATCH+ may contain the name of a patch, that will be
-  downloaded from the same location as the tarball indicated in
-  +LIBFOO_SOURCE+. If +HOST_LIBFOO_PATCH+ is not specified, it
-  defaults to +LIBFOO_PATCH+. Note that patches that are included
-  in Buildroot itself use a different mechanism: all files of the
-  form +<packagename>-*.patch+ present in the package directory inside
+* +LIBFOO_PATCH+ may contain a space-separated list of patch file
+  names, that will be downloaded from the same location as the tarball
+  indicated in +LIBFOO_SOURCE+, and then applied to the package source
+  code. If +HOST_LIBFOO_PATCH+ is not specified, it defaults to
+  +LIBFOO_PATCH+. Note that patches that are included in Buildroot
+  itself use a different mechanism: all files of the form
+  +<packagename>-*.patch+ present in the package directory inside
   Buildroot will be applied to the package after extraction (see
-  xref:patch-policy[patching a package]).
+  xref:patch-policy[patching a package]). Finally, patches listed in
+  the +LIBFOO_PATCH+ variable are applied _before_ the patches stored
+  in the Buildroot package directory.
 
 * +LIBFOO_SITE+ provides the location of the package, which can be a
   URL or a local filesystem path. HTTP, FTP and SCP are supported URL
