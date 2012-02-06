From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 06 Feb 2012 21:41:08 +0100
Subject: [Buildroot] [PATCH] manual: update download helper information
Message-ID: <a19551b34f1bdd74cc65.1328560868@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-gentargets.txt |  44 ++++++++++++++++++++++++++++----------------
 1 files changed, 28 insertions(+), 16 deletions(-)

Note: when I generate manuals, the newlines forced by '+' are not respected in
the text nor html version. They are in the pdf and epub versions. Do you also
have this problem? You can check e.g. in the examples of LIBFOO_VERSION.

diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -133,9 +133,12 @@ information is (assuming the package nam
 * +LIBFOO_VERSION+, mandatory, must contain the version of the
   package. Note that if +HOST_LIBFOO_VERSION+ doesn't exist, it is
   assumed to be the same as +LIBFOO_VERSION+. It can also be a
-  Subversion or Git branch or tag, for packages that are fetched
+  revision number, branch or tag for packages that are fetched
   directly from their revision control system. +
-  Example: +LIBFOO_VERSION = 0.1.2+
+  Examples: +
+    +LIBFOO_VERSION = 0.1.2+ +
+    +LIBFOO_VERSION = cb9d6aa9429e838f0e54faa3d455bcbab5eef057+ +
+    +LIBFOO_VERSION = stable+
 
 * +LIBFOO_SOURCE+ may contain the name of the tarball of
   the package. If +HOST_LIBFOO_SOURCE+ is not specified, it
@@ -154,28 +157,37 @@ information is (assuming the package nam
   after extraction.
 
 * +LIBFOO_SITE+ may contain the Internet location of the package. It
-  can either be the HTTP or FTP location of a tarball, or the URL of a
-  Git or Subversion repository (see +LIBFOO_SITE_METHOD+ below). If
-  +HOST_LIBFOO_SITE+ is not specified, it defaults to
+  can either be the HTTP, FTP or SCP location of a tarball, or the URL
+  of a Git, Subversion, Mercurial or Bazaar repository (see
+  +LIBFOO_SITE_METHOD+ below). +
+  SCP URLs should be of the form +scp://[user@]host:filepath+. Note
+  that filepath is relative to the user's home directory, so you may want
+  to prepend the path with a slash for absolute paths:
+  +scp://[user@]host:/absolutepath+. +
+  If +HOST_LIBFOO_SITE+ is not specified, it defaults to
   +LIBFOO_SITE+. If none are specified, then the location is assumed
   to be
   +http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/packagename+. +
-  Examples: +LIBFOO_SITE=http://www.libfoosoftware.org/libfoo+ +
-  +LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/+
+  Examples: +
+    +LIBFOO_SITE=http://www.libfoosoftware.org/libfoo+ +
+    +LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/+ +
+    +LIBFOO_SITE=git://github.com/kergoth/tslib.git+
 
 * +LIBFOO_SITE_METHOD+ may contain the method to fetch the package
   source code. It can either be +wget+ (for normal FTP/HTTP downloads
-  of tarballs), +svn+, +git+ or +bzr+.  When not specified, it is
-  guessed from the URL given in +LIBFOO_SITE+: +svn://+, +git://+ and
-  +bzr://+ URLs will use the +svn+, +git+ and +bzr+ methods
+  of tarballs), +scp+ (for downloads over SSH with scp), +svn+, +git+,
+  +hg+ or +bzr+.  When not specified, it is guessed from the URL given
+  in +LIBFOO_SITE+: +scp://+, +svn://+, +git://+ and
+  +bzr://+ URLs will use the +scp+, +svn+, +git+ and +bzr+ methods
   respectively. All other URL-types will use the +wget+ method. So for
   example, in the case of a package whose source code is available
-  through Subversion repository on HTTP, one 'must' specifiy
-  +LIBFOO_SITE_METHOD=svn+. For +svn+ and +git+ methods, what
-  Buildroot does is a checkout/clone of the repository which is then
-  tarballed and stored into the download cache. Next builds will not
-  checkout/clone again, but will use the tarball directly. When
-  +HOST_LIBFOO_SITE_METHOD+ is not specified, it defaults to the value
+  through a Subversion repository on HTTP, one 'must' specifiy
+  +LIBFOO_SITE_METHOD=svn+. Similarly, for Mercurial repositories, one
+  'must' specify +LIBFOO_SITE_METHOD=hg+. For +svn+, +git+, +hg+ and
+  +bzr+ methods, what Buildroot does is a checkout/clone of the repository
+  which is then tarballed and stored into the download cache. Next
+  builds will not checkout/clone again, but will use the tarball directly.
+  When +HOST_LIBFOO_SITE_METHOD+ is not specified, it defaults to the value
   of +LIBFOO_SITE_METHOD+. See +package/multimedia/tremor/+ for an
   example.
 
