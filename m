From: Charlie Turner <cturner@igalia.com>
Date: Thu, 16 May 2019 10:58:58 +0100
Subject: [Buildroot] [PATCH] package/cog: install to staging
Message-ID: <20190516095858.33732-1-cturner@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is useful when unstripped libraries are installed into staging. It
allows the cog executable to be debugged.
---
 package/cog/cog.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 43f13152c8..6bbffcfc8e 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -9,6 +9,7 @@ COG_SITE = $(call github,Igalia,cog,$(COG_VERSION))
 COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
 COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
+COG_INSTALL_STAGING = YES
 COG_CONF_OPTS = \
 	-DCOG_BUILD_PROGRAMS=ON \
 	-DCOG_PLATFORM_FDO=ON \
-- 
2.17.1
