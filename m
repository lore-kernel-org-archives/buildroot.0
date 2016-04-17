From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 22:17:11 +0200
Subject: [Buildroot] [git commit] package/freeswitch: enable mod_isac
Message-ID: <20160417201716.F3ED37FBEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d5e67ecc76592259b0e0fc6c9aac6f33cda2d47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freeswitch/freeswitch.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index a7ed597..bb8cfb2 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -158,6 +158,14 @@ define FREESWITCH_ENABLE_MODULES
 endef
 FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 
+# mod_isac supports a limited set of archs
+# src/mod/codecs/mod_isac/typedefs.h
+ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_x86_64),y)
+FREESWITCH_LICENSE += BSD-3c (mod_isac)
+FREESWITCH_LICENSE_FILES += src/mod/codecs/mod_isac/LICENSE
+FREESWITCH_ENABLED_MODULES += codecs/mod_isac
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 FREESWITCH_DEPENDENCIES += freetype
 endif
