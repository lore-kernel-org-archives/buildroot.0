From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Sep 2011 08:26:07 +0200
Subject: [Buildroot] [git commit] Makefile.package.in: SVN/BZR/GIT: don't
	append $(QUIET)
Message-ID: <20110930063211.CF65B8DC07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=069203887856f85b39aba2d54fbeace6ebb0bbc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

svn/bzr/git commands don't accept the -q option for quiet operation.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 4fb16e8..1021206 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -89,9 +89,9 @@ TERM_RESET := $(shell tput rmso)
 
 # Download method commands
 WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
-SVN:=$(call qstrip,$(BR2_SVN)) $(QUIET)
-BZR:=$(call qstrip,$(BR2_BZR)) $(QUIET)
-GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
+SVN:=$(call qstrip,$(BR2_SVN))
+BZR:=$(call qstrip,$(BR2_BZR))
+GIT:=$(call qstrip,$(BR2_GIT))
 LOCALFILES:=$(call qstrip,$(BR2_LOCALFILES))
 
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
