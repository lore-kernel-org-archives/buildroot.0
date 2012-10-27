From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat, 27 Oct 2012 09:33:55 +0100
Subject: [Buildroot] [PATCH] sconeserver: fix bluetooth module build problem
Message-ID: <1351326835-9339-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

This fixes a build problem in the sconeserver bluetooth module, as reported
by the Buildroot autobuild system:

  http://autobuild.buildroot.net/results/d1133da3f8d74c58fd271e0cab197a1108000e90/build-end.log

The build problem, due to the use of BDADDR_ANY, has been fixed upstream;
consequently, this patch simply bumps the sconeserver svn revision.

Further details of the underlying problem at the following URL.

  http://stackoverflow.com/questions/9751710/c-c-warning-address-of-temporary-with-bdaddr-any-bluetooth-library

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/sconeserver/sconeserver.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.10.4
