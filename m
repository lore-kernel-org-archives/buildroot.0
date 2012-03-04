From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Mar 2012 22:09:20 +0100
Subject: [Buildroot] [git commit] lite: Remove excess slashes from
	pkg-config file.
Message-ID: <20120304210938.C377790CE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d2e77d5cbbded4a365d324c699bfae058bc97ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@imgtec.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lite/lite-pkg-config.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/lite/lite-pkg-config.patch b/package/lite/lite-pkg-config.patch
new file mode 100644
index 0000000..cdd2416
--- /dev/null
+++ b/package/lite/lite-pkg-config.patch
@@ -0,0 +1,22 @@
+From 7982cccbb6ad58f3802bb266467290200d130a48 Mon Sep 17 00:00:00 2001
+From: Ville Syrjala <syrjala@sci.fi>
+Date: Sat, 27 Nov 2010 01:14:25 +0200
+Subject: [PATCH] Too many '\' characters in the .pc file
+
+---
+ lite.pc.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/lite.pc.in b/lite.pc.in
+index 48eb969..3a21eaa 100644
+--- a/lite.pc.in
++++ b/lite.pc.in
+@@ -9,4 +9,4 @@ Description: "LiTE" is a Toolkit Engine
+ Requires: directfb >= @DFB_REQUIRED_VERSION@
+ Version: @VERSION@
+ Libs: -L${libdir} -llite
+-Cflags: -I${includedir} -DLITEFONTDIR=\\\"@LITEFONTDIR@\\\"
++Cflags: -I${includedir} -DLITEFONTDIR=\"@LITEFONTDIR@\"
+--
+1.7.1
+
