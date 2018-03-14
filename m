From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 14 Mar 2018 21:18:37 +0100
Subject: [Buildroot] [PATCH 3/3] mpd-mpc: pass PARALLEL_JOBS to NINJA_OPTS
In-Reply-To: <20180314201837.21398-1-joerg.krause@embedded.rocks>
References: <20180314201837.21398-1-joerg.krause@embedded.rocks>
Message-ID: <20180314201837.21398-3-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
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
-- 
2.16.2
