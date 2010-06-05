From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat,  5 Jun 2010 20:03:50 +0200
Subject: [Buildroot] [PATCH 4/4] gstreamer: remove --disable-registry from
	configure options
In-Reply-To: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
References: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1275761030-20955-5-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

--disable-registry has no dependency on libxml2 and should not be
linked to BR2_PACKAGE_GSTREAMER_LIBXML2. If we want to disable
registry then we should add another option.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/multimedia/gstreamer/gstreamer.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 226a4ef..17c72fe 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -27,7 +27,6 @@ ifeq ($(BR2_PACKAGE_GSTREAMER_LIBXML2),y)
 GSTREAMER_DEPENDENCIES += libxml2
 else
 GSTREAMER_CONF_OPT += \
-	--disable-registry \
 	--disable-loadsave
 endif
 
-- 
1.7.1
