From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 15 Mar 2011 08:27:08 +0100
Subject: [Buildroot] [PATCH 3 of 3] Update documentation to mention file://
	support
In-Reply-To: <patchbomb.1300174025@localhost6.localdomain6>
References: <patchbomb.1300174025@localhost6.localdomain6>
Message-ID: <772d38fa2a87d5d0ea72.1300174028@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/buildroot.html |  29 +++++++++++++++++------------
 1 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1045,8 +1045,8 @@
       in the package directory inside Buildroot will be applied to the
       package after extraction.</li>
 
-      <li><code>LIBFOO_SITE</code> may contain the Internet location
-      of the package. It can either be the HTTP or FTP location of a
+      <li><code>LIBFOO_SITE</code> may contain the location
+      of the package. It can either be the HTTP, FTP or filesystem location of a
       tarball, or the URL of a Git or Subversion repository
       (see <code>LIBFOO_SITE_METHOD</code>
       below). If <code>HOST_LIBFOO_SITE</code> is not specified, it
@@ -1055,17 +1055,20 @@
       <code>http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/packagename</code>.
       <br/>Examples:<br/>
       <code>LIBFOO_SITE=http://www.libfoosoftware.org/libfoo</code><br/>
-      <code>LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/</code></li>
+      <code>LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/</code><br/>
+      <code>LIBFOO_SITE=file://project/store/</code></li>
 
       <li><code>LIBFOO_SITE_METHOD</code> may contain the method to
       fetch the package source code. It can either
       be <code>wget</code> (for normal FTP/HTTP downloads of
-      tarballs), <code>svn</code>, <code>git</code> or <code>bzr</code>.
+      tarballs), <code>file</code> (for local filesystem copy),
+      <code>svn</code>, <code>git</code> or <code>bzr</code>.
       When not specified, it is guessed from the URL given
-      in <code>LIBFOO_SITE</code>: <code>svn://</code>, <code>git://</code>
-      and <code>bzr://</code> URLs will use the <code>svn</code>,
-      <code>git</code> and <code>bzr</code> methods respectively. All other
-      URL-types will use the <code>wget</code> method. So for example, in the
+      in <code>LIBFOO_SITE</code>: <code>svn://</code>, <code>git://</code>,
+      <code>bzr://</code> and <code>file://</code> URLs will use the
+      <code>svn</code>, <code>git</code>, <code>bzr</code> and
+      <code>file</code> methods respectively. All other URL-types will
+      use the <code>wget</code> method. So for example, in the
       case of a package whose source code is available through
       Subversion repository on HTTP, one <i>must</i>
       specifiy <code>LIBFOO_SITE_METHOD=svn</code>. For <code>svn</code>
@@ -1073,10 +1076,12 @@
       checkout/clone of the repository which is then tarballed and
       stored into the download cache. Next builds will not
       checkout/clone again, but will use the tarball
-      directly. When <code>HOST_LIBFOO_SITE_METHOD</code> is not
-      specified, it defaults to the value
-      of <code>LIBFOO_SITE_METHOD</code>. See <code>package/multimedia/tremor/</code>
-      for an example.</li>
+      directly. Note that the <code>file</code> method is only useful in
+      projects where all developers have access to the same filesystem
+      (which can be an NFS share, of course). When
+      <code>HOST_LIBFOO_SITE_METHOD</code> is not specified, it defaults
+      to the value of <code>LIBFOO_SITE_METHOD</code>.
+      See <code>package/multimedia/tremor/</code> for an example.</li>
 
       <li><code>LIBFOO_DEPENDENCIES</code> lists the dependencies (in terms
       of package name) that are required for the current target package to
