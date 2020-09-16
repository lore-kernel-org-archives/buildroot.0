From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 16 Sep 2020 21:49:22 +0200
Subject: [Buildroot] [RFC v1 02/13] package/gst1-interpipe: change to meson
 build
In-Reply-To: <20200916194933.24921-1-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
Message-ID: <20200916194933.24921-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index 92e2bb38fc..9d3402d02b 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -13,9 +13,10 @@ GST1_INTERPIPE_GIT_SUBMODULES = YES
 GST1_INTERPIPE_LICENSE = LGPL-2.1
 GST1_INTERPIPE_LICENSE_FILES = COPYING
 
-# from git source
-GST1_INTERPIPE_AUTORECONF = YES
-
 GST1_INTERPIPE_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
 
-$(eval $(autotools-package))
+GST1_INTERPIPE_CONF_OPTS = \
+	-Dtests=disabled \
+	-Denable-gtk-doc=false
+
+$(eval $(meson-package))
-- 
2.28.0
