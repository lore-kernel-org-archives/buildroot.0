From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 14:42:45 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/xen: disable
 tools/qemu-xen/ opengl
Message-ID: <20180928124209.124B78A376@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8b28d503922cbaaf4369a1dd59330241b2d718b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Resolves:
http://autobuild.buildroot.net/results/a7f2bf387458c2f0db6a4b555c51004f321f9320

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 13c6754f3c1d2a14516f641490e9dd6f4c183d7c)
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
