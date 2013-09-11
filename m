From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Sep 2013 13:00:58 +0200
Subject: [Buildroot] [git commit] pkg-stats: update set of files to skip
Message-ID: <20130911110611.F27B181DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c403fedbc72438866e8acacf6c1b1d7204a40e1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In BR sub-directory boot/ linux/ and package/ there are a few .mk files which
aren't <package>.mk files. These files shouldn't be taken into account
in package statistics.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/pkg-stats |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index a65a6ae..4effa59 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -87,18 +87,21 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	$i = "boot/common.mk" -o \
 	$i = "linux/linux-ext-xenomai.mk" -o \
 	$i = "linux/linux-ext-rtai.mk" -o \
-	$i = "linux/linux-ext-ocf-linux.mk" -o \
 	$i = "package/efl/efl.mk" -o \
-	$i = "package/games/games.mk" -o \
+	$i = "package/freescale-imx/freescale-imx.mk" -o \
+	$i = "package/gcc/gcc.mk" -o \
+	$i = "package/gstreamer/gstreamer.mk" -o \
+	$i = "package/gstreamer1/gstreamer1.mk" -o \
 	$i = "package/gtk2-themes/gtk2-themes.mk" -o \
-	$i = "package/multimedia/multimedia.mk" -o \
+	$i = "package/matchbox/matchbox.mk" -o \
+	$i = "package/opengl/opengl.mk" -o \
+	$i = "package/qt5/qt5.mk" -o \
+	$i = "package/x11r7/x11r7.mk" -o \
  	$i = "package/pkg-autotools.mk" -o \
  	$i = "package/pkg-cmake.mk" -o \
+	$i = "package/pkg-download.mk" -o \
  	$i = "package/pkg-generic.mk" -o \
- 	$i = "package/pkg-utils.mk" -o \
- 	$i = "package/pkg-download.mk" -o \
-	$i = "package/matchbox/matchbox.mk" -o \
-	$i = "package/x11r7/x11r7.mk" ; then
+ 	$i = "package/pkg-utils.mk" ; then
 	echo "skipping $i" 1>&2
 	continue
     fi
