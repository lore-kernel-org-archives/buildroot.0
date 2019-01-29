From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 16:37:10 +0100
Subject: [Buildroot] [git commit] package/busybox: drop empty configure
 command
Message-ID: <20190129153631.9C80E81496@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=908a8b5a7fb5744c55adbe609dca991709b2181a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 50dc350c65 (package/busybox: update to 1.29.0), we no
longer define the BUSYBOX_NOCLOBBER_INSTALL macro, so it expands to an
empty string, so we end up with no action in BUSYBOX_CONFIGURE_CMDS.

Drop BUSYBOX_CONFIGURE_CMDS now that it serves no purpose.

Signed-off-by: Yann MORIN <yann.morin@orange.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index bfcca6ed3e..5c5a8ea839 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -323,10 +323,6 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
 endef
 
-define BUSYBOX_CONFIGURE_CMDS
-	$(BUSYBOX_NOCLOBBER_INSTALL)
-endef
-
 define BUSYBOX_BUILD_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D)
 endef
