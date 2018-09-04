From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  4 Sep 2018 14:13:47 -0500
Subject: [Buildroot] [PATCH] package/xen: disable tools/qemu-xen/ opengl
Message-ID: <20180904191347.13857-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Resolves:
http://autobuild.buildroot.net/results/a7f2bf387458c2f0db6a4b555c51004f321f9320

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/xen/xen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 29699cf0f9..a1685d371d 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -45,7 +45,7 @@ XEN_DEPENDENCIES += argp-standalone
 endif
 XEN_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-tools
 XEN_MAKE_OPTS += dist-tools
-XEN_CONF_OPTS += --with-extra-qemuu-configure-args="--disable-sdl"
+XEN_CONF_OPTS += --with-extra-qemuu-configure-args="--disable-sdl --disable-opengl"
 
 define XEN_INSTALL_INIT_SYSV
 	mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
-- 
2.17.0
