From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 03 Sep 2012 20:05:36 -0000
Subject: [Buildroot] [git commit] cairo: Add tee surface backend option
	(required by firefox)
Message-ID: <20120903200534.CAA809953E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42136fea75b123377df99189fc8c8871cd568584
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/Config.in |    3 +++
 package/cairo/cairo.mk  |    6 ++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 19c4723..398e47f 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -32,4 +32,7 @@ config BR2_PACKAGE_CAIRO_SVG
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_CAIRO_PDF
 
+config BR2_PACKAGE_CAIRO_TEE
+	bool "tee support"
 endif
+
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 6b456dd..eedb28d 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -77,4 +77,10 @@ else
 	CAIRO_CONF_OPT += --disable-svg
 endif
 
+ifeq ($(BR2_PACKAGE_CAIRO_TEE),y)
+	CAIRO_CONF_OPT += --enable-tee
+else
+	CAIRO_CONF_OPT += --disable-tee
+endif
+
 $(eval $(autotools-package))
