From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Sep 2018 23:03:25 +0200
Subject: [Buildroot] [git commit] package/xen: disable tools/qemu-xen/ opengl
Message-ID: <20180904210441.EF13B827CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13c6754f3c1d2a14516f641490e9dd6f4c183d7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Resolves:
http://autobuild.buildroot.net/results/a7f2bf387458c2f0db6a4b555c51004f321f9320

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
