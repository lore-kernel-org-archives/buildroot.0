From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 20:37:51 +0200
Subject: [Buildroot] [git commit master] cairo: remove host variant
Message-ID: <20100521184449.070E69C152@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7b38fc20baa4762e5081246d8f2547336e883534
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we no longer need to build pango on the host, cairo on the host
is no longer needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/cairo.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 0ca99aa..9b72ffa 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -79,8 +79,6 @@ else
 	CAIRO_CONF_OPT += --disable-svg
 endif
 
-HOST_CAIRO_DEPENDENCIES = host-pkg-config host-pixman host-fontconfig
-
 HOST_CAIRO_CONF_OPT = \
 		--enable-ps \
 		--enable-pdf \
@@ -90,4 +88,3 @@ HOST_CAIRO_CONF_OPT = \
 		--disable-svg
 
 $(eval $(call AUTOTARGETS,package,cairo))
-$(eval $(call AUTOTARGETS,package,cairo,host))
-- 
1.6.3.3
