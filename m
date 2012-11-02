From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Nov 2012 20:58:59 +0100
Subject: [Buildroot] [git commit] sconeserver: fix bluetooth module build
	problem
Message-ID: <20121102231429.75DCE999E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90e8ebb2f0852d215d1c04dbaf56c702ea74dc40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a build problem in the sconeserver bluetooth module, as reported
by the Buildroot autobuild system:

  http://autobuild.buildroot.net/results/d1133da3f8d74c58fd271e0cab197a1108000e90/build-end.log

The build problem, due to the use of BDADDR_ANY, has been fixed upstream;
consequently, this patch simply bumps the sconeserver svn revision.

Further details of the underlying problem at the following URL.

  http://stackoverflow.com/questions/9751710/c-c-warning-address-of-temporary-with-bdaddr-any-bluetooth-library

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sconeserver/sconeserver.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 2313cd2..15a1edc 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -5,7 +5,7 @@
 #############################################################
 # Release 0.6.0 doesn't build cleanly, so use a recent
 # Subversion trunk snapshot.
-SCONESERVER_VERSION = 178
+SCONESERVER_VERSION = 180
 SCONESERVER_SITE = \
 	https://sconeserver.svn.sourceforge.net/svnroot/sconeserver/trunk
 SCONESERVER_SITE_METHOD = svn
