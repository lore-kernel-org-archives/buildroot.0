From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue,  9 Apr 2019 19:45:35 +0200
Subject: [Buildroot] [PATCH] package/vdr-plugin-vnsiserver: package needs
 host-gettext to build correctly
Message-ID: <20190409174535.31768-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During building msgmerge is used, so at the moment if build environment
doesn't provide it, build will fail.

Add host-gettext to VDR_PLUGIN_VNSISERVER_DEPENDENCIES.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
index 20644d3f6b..86c99c422b 100644
--- a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
@@ -8,7 +8,7 @@ VDR_PLUGIN_VNSISERVER_VERSION = v1.8.0
 VDR_PLUGIN_VNSISERVER_SITE = $(call github,FernetMenta,vdr-plugin-vnsiserver,$(VDR_PLUGIN_VNSISERVER_VERSION))
 VDR_PLUGIN_VNSISERVER_LICENSE = GPL-2.0+
 VDR_PLUGIN_VNSISERVER_LICENSE_FILES = COPYING
-VDR_PLUGIN_VNSISERVER_DEPENDENCIES = vdr
+VDR_PLUGIN_VNSISERVER_DEPENDENCIES = vdr host-gettext
 
 VDR_PLUGIN_VNSISERVER_CXXFLAGS = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC"
 
-- 
2.17.1
