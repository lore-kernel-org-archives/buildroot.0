From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:40:39 +0200
Subject: [Buildroot] [git commit] package/gnuplot: add patch to fix
 'undefined reference to gp_read_history'
Message-ID: <20200919193229.B05488364F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=587925d55e0ec72f351070c74348be9327063b1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/e09087f0afd323a220889e2c7827fd73c9025673

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuplot/0002-without-history.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/gnuplot/0002-without-history.patch b/package/gnuplot/0002-without-history.patch
new file mode 100644
index 0000000000..6091da8415
--- /dev/null
+++ b/package/gnuplot/0002-without-history.patch
@@ -0,0 +1,17 @@
+history.c: Patch to solve the 'undefined reference to gp_read_history'
+
+Signed-off-by: Michael Fischer <mf@go-sys.de>
+
+diff -purN gnuplot-5.4.0.org/src/history.c gnuplot-5.4.0/src/history.c
+--- gnuplot-5.4.0.org/src/history.c	2019-12-10 07:22:32.000000000 +0100
++++ gnuplot-5.4.0/src/history.c	2020-09-14 10:07:36.525441702 +0200
+@@ -91,7 +91,9 @@ write_history(char *filename)
+ void
+ read_history(char *filename)
+ {
+-    gp_read_history(filename);
++#ifdef GNUPLOT_HISTORY
++    	gp_read_history(filename);
++#endif	
+ }
+ 
