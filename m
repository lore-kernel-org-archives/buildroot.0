From: Lucian Buga <lucianbuga@gmail.com>
Date: Sun,  3 May 2020 09:51:10 +0300
Subject: [Buildroot] [PATCH] package/kmod - fix host build dependecies
Message-ID: <20200503065110.7609-1-lucianbuga@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When kernel is configured with CONFIG_MODULE_COMPRESS, host-kmod must
be built with zlib / xz support to be able to properly generate
dependency files for target.

Signed-off-by: Lucian Buga <lucianbuga@gmail.com>
---
 package/kmod/kmod.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index e2dfea5c7b..7149658ac7 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -35,11 +35,15 @@ endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
 KMOD_CONF_OPTS += --with-zlib
+HOST_KMOD_DEPENDENCIES += host-zlib
+HOST_KMOD_CONF_OPTS += --with-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
 KMOD_DEPENDENCIES += xz
 KMOD_CONF_OPTS += --with-xz
+HOST_KMOD_DEPENDENCIES += host-xz
+HOST_KMOD_CONF_OPTS += --with-xz
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
-- 
2.17.1
