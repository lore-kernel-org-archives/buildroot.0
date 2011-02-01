From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Tue,  1 Feb 2011 23:22:39 +0100
Subject: [Buildroot] [PATCH 1/2] docs: fix $(PKG)_SITE_METHOD names (UPPER
	CASE => lower case)
Message-ID: <1296598960-356-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the documentation says $(PKG)_SITE_METHOD should have upper
case names such as SVN or GIT, but the implementation only accepts lower
case svn or git. This fixes the documentation.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 docs/buildroot.html |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 36297e0..de6b1d7 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1060,17 +1060,17 @@ $(eval $(call GENTARGETS,package,libfoo,host))
 
       <li><code>LIBFOO_SITE_METHOD</code> may contain the method to
       fetch the package source code. It can either
-      be <code>WGET</code> (for normal FTP/HTTP downloads of
-      tarballs), <code>SVN</code> or <code>GIT</code>. When not
+      be <code>wget</code> (for normal FTP/HTTP downloads of
+      tarballs), <code>svn</code> or <code>git</code>. When not
       specified, it is guessed from the URL given
       in <code>LIBFOO_SITE</code>: <code>git://</code>
-      and <code>svn://</code> URLs will use the <code>GIT</code>
-      and <code>SVN</code> methods respectively. All other URL-types
-      will use the <code>WGET</code> method. So for example, in the
+      and <code>svn://</code> URLs will use the <code>git</code>
+      and <code>svn</code> methods respectively. All other URL-types
+      will use the <code>wget</code> method. So for example, in the
       case of a package whose source code is available through
       Subversion repository on HTTP, one <i>must</i>
-      specifiy <code>LIBFOO_SITE_METHOD=SVN</code>. For <code>SVN</code>
-      and <code>GIT</code> methods, what Buildroot does is a
+      specifiy <code>LIBFOO_SITE_METHOD=svn</code>. For <code>svn</code>
+      and <code>git</code> methods, what Buildroot does is a
       checkout/clone of the repository which is then tarballed and
       stored into the download cache. Next builds will not
       checkout/clone again, but will use the tarball
-- 
1.7.1
