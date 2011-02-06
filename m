From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 6 Feb 2011 21:08:38 +0100
Subject: [Buildroot] [git commit master 1/1] docs: fix $(PKG)_SITE_METHOD
	names (UPPER CASE => lower case)
Message-ID: <20110206200904.7A1C68F347@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f210ab4e2f332daff3cdbb148c5c2331f05e33ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the documentation says $(PKG)_SITE_METHOD should have upper
case names such as SVN or GIT, but the implementation only accepts lower
case svn or git. This fixes the documentation.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index b755922..b766e41 100644
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
1.7.3.4
