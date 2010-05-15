From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 May 2010 01:15:32 +0200
Subject: [Buildroot] [PATCH 07/12] cairo: remove host variant
In-Reply-To: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6e038f07405babfad21230b6c46559b088201479.1273965305.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
