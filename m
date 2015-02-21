From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Feb 2015 23:36:15 +0100
Subject: [Buildroot] [PATCH 02/11 v5] package/freerdp: conditionally build
	gstreamer support
In-Reply-To: <cover.1424558036.git.yann.morin.1998@free.fr>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
Message-ID: <3bb8323b61ac1d3ba359d64c35c4b88e0bc0d547.1424558036.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid a warning at configure time when gstreamer is missing.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index ffe014c..32b4714 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -14,6 +14,13 @@ FREERDP_LICENSE_FILES = LICENSE
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF
 
+ifeq ($(BR2_PACKAGE_GSTREAMER),y)
+FREERDP_CONF_OPTS += -DWITH_GSTREAMER=ON
+FREERDP_DEPENDENCIES += gstreamer
+else
+FREERDP_CONF_OPTS += -DWITH_GSTREAMER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_CUPS),y)
 FREERDP_CONF_OPTS += -DWITH_CUPS=ON
 FREERDP_DEPENDENCIES += cups
-- 
1.9.1
