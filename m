From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Sep 2011 08:26:08 +0200
Subject: [Buildroot] [git commit] package: normalize output of 'make
	external-deps'
Message-ID: <20110930063213.1FAE78DC07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=767ad6900a68fe92f4d725ecb1e6dfa248ab53f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For wget-downloaded packages, only the tarball name was displayed,
while for svn/git/bzr packages, the complete repository URL was
shown. As discussed on the list, what we want for 'make external-deps'
is only the tarball name even for git/svn/bzr downloads.

For local packages, we of course keep the full path since it's the
only information that we can provide.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 1021206..353ba72 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -141,7 +141,7 @@ define SOURCE_CHECK_GIT
 endef
 
 define SHOW_EXTERNAL_DEPS_GIT
-  echo "$($(PKG)_SITE) [git: $($(PKG)_DL_VERSION)]"
+	echo $($(PKG)_SOURCE)
 endef
 
 
@@ -155,7 +155,7 @@ define SOURCE_CHECK_BZR
 endef
 
 define SHOW_EXTERNAL_DEPS_BZR
-	echo "$($(PKG)_SITE) [bzr: $($(PKG)_DL_VERSION)]"
+	echo $($(PKG)_SOURCE)
 endef
 
 
@@ -173,7 +173,7 @@ define SOURCE_CHECK_SVN
 endef
 
 define SHOW_EXTERNAL_DEPS_SVN
-  echo "$($(PKG)_SITE) [svn: $($(PKG)_DL_VERSION)]"
+  echo $($(PKG)_SOURCE)
 endef
 
 
