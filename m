From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 16:26:15 +0100
Subject: [Buildroot] [git commit] cairo: remove remaining host variables
Message-ID: <20120117152637.92EDB9036E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fcc7cd3c7b42a2ff829a0cf7d28894cff3a89660
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host support was removed in 7b38fc20ba (cairo: remove host variant),
but it forgot to remove the HOST_CAIRO_CONF_OPT assignment.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cairo/cairo.mk |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 1746eff..2230587 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -79,12 +79,4 @@ else
 	CAIRO_CONF_OPT += --disable-svg
 endif
 
-HOST_CAIRO_CONF_OPT = \
-		--enable-ps \
-		--enable-pdf \
-		--enable-xlib \
-		--with-x \
-		--disable-png \
-		--disable-svg
-
 $(eval $(call AUTOTARGETS))
