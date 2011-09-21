From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 08:42:14 +0200
Subject: [Buildroot] [PATCH 3 of 3] Update documentation for scp and
	Mercurial support
In-Reply-To: <patchbomb.1316587331@localhost6.localdomain6>
References: <patchbomb.1316587331@localhost6.localdomain6>
Message-ID: <9335ce845b0c9955d055.1316587334@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update documentation for scp and Mercurial support.
Along with the documentation update, a few typos were fixed as well.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 docs/buildroot.html |  29 +++++++++++++++++------------
 1 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1025,8 +1025,8 @@
       version of the package. Note that
       if <code>HOST_LIBFOO_VERSION</code> doesn't exist, it is assumed
       to be the same as <code>LIBFOO_VERSION</code>. It can also be a
-      Subversion or Git branch or tag, for packages that are fetched
-      directly from their revision control system.<br/>
+      Subversion, Git, Bazaar or Mercurial branch or tag, for packages
+      that are fetched directly from their revision control system.<br/>
       Example: <code>LIBFOO_VERSION = 0.1.2</code></li>
 
       <li><code>LIBFOO_SOURCE</code> may contain the name of the tarball of
@@ -1047,7 +1047,8 @@
 
       <li><code>LIBFOO_SITE</code> may contain the Internet location
       of the package. It can either be the HTTP or FTP location of a
-      tarball, or the URL of a Git or Subversion repository
+      tarball, an SCP URI of a tarball accessible with Secure Copy, or
+      the URL of a Git, Subversion, Bazaar or Mercurial repository.
       (see <code>LIBFOO_SITE_METHOD</code>
       below). If <code>HOST_LIBFOO_SITE</code> is not specified, it
       defaults to <code>LIBFOO_SITE</code>. If none are specified,
@@ -1055,22 +1056,26 @@
       <code>http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/packagename</code>.
       <br/>Examples:<br/>
       <code>LIBFOO_SITE=http://www.libfoosoftware.org/libfoo</code><br/>
-      <code>LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/</code></li>
+      <code>LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/</code><br/>
+      <code>LIBFOO_SITE=scp://machinename:/path/to/tarball</code><br/>
+      <code>LIBFOO_SITE=git://github.com/user/test.git</code></li>
 
       <li><code>LIBFOO_SITE_METHOD</code> may contain the method to
       fetch the package source code. It can either
       be <code>wget</code> (for normal FTP/HTTP downloads of
-      tarballs), <code>svn</code>, <code>git</code> or <code>bzr</code>.
+      tarballs), <code>scp</code>, <code>svn</code>, <code>git</code>,
+      <code>bzr</code> or <code>hg</code>.
       When not specified, it is guessed from the URL given
       in <code>LIBFOO_SITE</code>: <code>svn://</code>, <code>git://</code>
-      and <code>bzr://</code> URLs will use the <code>svn</code>,
-      <code>git</code> and <code>bzr</code> methods respectively. All other
+      <code>bzr://</code> and <code>scp://</code> URLs will use the
+      <code>svn</code>, <code>git</code>, <code>bzr</code> and
+      <code>scp</code>methods respectively. All other
       URL-types will use the <code>wget</code> method. So for example, in the
       case of a package whose source code is available through
       Subversion repository on HTTP, one <i>must</i>
-      specifiy <code>LIBFOO_SITE_METHOD=svn</code>. For <code>svn</code>
-      and <code>git</code> methods, what Buildroot does is a
-      checkout/clone of the repository which is then tarballed and
+      specify <code>LIBFOO_SITE_METHOD=svn</code>. For <code>svn</code>,
+      <code>git</code>, <code>bzr</code> and <code>hg</code> methods, what
+      Buildroot does is a checkout/clone of the repository which is then tarballed and
       stored into the download cache. Next builds will not
       checkout/clone again, but will use the tarball
       directly. When <code>HOST_LIBFOO_SITE_METHOD</code> is not
@@ -1184,7 +1189,7 @@
     However, since they are provided by the generic infrastructure, they are
     documented here. The exception is <code>LIBFOO_POST_PATCH_HOOKS</code>.
     Patching the package is not user definable, so
-    <code>LIBFOO_POST_PATCH_HOOKS</code> will be userful for generic packages.
+    <code>LIBFOO_POST_PATCH_HOOKS</code> will be useful for generic packages.
     </p>
 
     <p>The following hook points are available:</p>
@@ -1776,7 +1781,7 @@
     network...</code></h3>
 
     <p>If the boot process seems to hang after the following messages
-    (messages not necessarly exactly similar, depending on the list of
+    (messages not necessarily exactly similar, depending on the list of
     packages selected):</p>
 
     <pre>Freeing init memory: 3972K
