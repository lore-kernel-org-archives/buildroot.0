From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Mar 2018 23:23:06 +0100
Subject: [Buildroot] [git commit] libmpdclient: pass PARALLEL_JOBS to
 NINJA_OPTS
Message-ID: <20180319222354.CA27C837FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20994334a0aaeab357581eeb9178b91a763cdac2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmpdclient/libmpdclient.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index a399516fe3..6ff27241c0 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -20,7 +20,7 @@ LIBMPDCLIENT_CONF_OPTS += \
 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
 
-LIBMPDCLIENT_NINJA_OPTS = $(if $(VERBOSE),-v)
+LIBMPDCLIENT_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
 
 define LIBMPDCLIENT_CONFIGURE_CMDS
 	rm -rf $(@D)/build
