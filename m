From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 May 2013 13:23:02 +0200
Subject: [Buildroot] [git commit] pptp-linux: needs MMU
Message-ID: <20130525112531.CE9F79A536@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97edb8f629085670a465cf8354575bb93b749b13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/9b8/9b80537d0efb3fefab486abaecd128bd18e0efdb

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pptp-linux/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pptp-linux/Config.in b/package/pptp-linux/Config.in
index 165f79b..e03a906 100644
--- a/package/pptp-linux/Config.in
+++ b/package/pptp-linux/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PPTP_LINUX
 	bool "pptp-linux"
+	depends on BR2_USE_MMU # fork()
 	help
 	  An implementation of the Point-to-point protocol client.
 
