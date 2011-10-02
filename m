From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Oct 2011 21:13:57 +0200
Subject: [Buildroot] [git commit] gst-plugins-base: fix build by disabling
	testchannels example
Message-ID: <20111002191515.2B1DE8E04A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c20b39cf31bff85a8cf35e3bb2d8a9bbf436b16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Testchannels doesn't build because it forgets to link with libgstinterfaces.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...base-0.10.35-disable-testchannels-example.patch |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.35-disable-testchannels-example.patch b/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.35-disable-testchannels-example.patch
new file mode 100644
index 0000000..e991c4e
--- /dev/null
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.35-disable-testchannels-example.patch
@@ -0,0 +1,26 @@
+[PATCH] disable testchannels example
+
+The testchannels example doesn't build because it forgets to link with
+libgstinterfaces. Unfortunately testchannels gets built even though
+--disable-examples is used, so instead disable it in Makefile.in
+(package doesn't autoreconf cleanly, so don't edit Makefile.am)
+
+Problem is fixed upstream in 0.11 branch (940291dd38be66fa).
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ gst-libs/gst/audio/Makefile.in |    1 -
+ 1 file changed, 1 deletion(-)
+
+Index: gst-plugins-base-0.10.35/gst-libs/gst/audio/Makefile.in
+===================================================================
+--- gst-plugins-base-0.10.35.orig/gst-libs/gst/audio/Makefile.in
++++ gst-plugins-base-0.10.35/gst-libs/gst/audio/Makefile.in
+@@ -45,7 +45,6 @@
+ POST_UNINSTALL = :
+ build_triplet = @build@
+ host_triplet = @host@
+-noinst_PROGRAMS = testchannels$(EXEEXT)
+ DIST_COMMON = $(libgstaudio_ at GST_MAJORMINOR@include_HEADERS) \
+ 	$(srcdir)/Makefile.am $(srcdir)/Makefile.in \
+ 	$(top_srcdir)/common/gst-glib-gen.mak TODO
