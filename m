From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Mar 2018 23:23:37 +0100
Subject: [Buildroot] [git commit] mpd-mpc: pass PARALLEL_JOBS to NINJA_OPTS
Message-ID: <20180319222354.DF7D4837FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12262ab50d6968189adcdfb64dffe75191f11187
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd-mpc/mpd-mpc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
index 3eecf8a3ef..e16f600491 100644
--- a/package/mpd-mpc/mpd-mpc.mk
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -17,7 +17,7 @@ MPD_MPC_CONF_OPTS += \
 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
 
-MPD_MPC_NINJA_OPTS = $(if $(VERBOSE),-v)
+MPD_MPC_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
 
 define MPD_MPC_CONFIGURE_CMDS
 	rm -rf $(@D)/build
