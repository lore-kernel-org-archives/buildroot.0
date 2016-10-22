From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] latencytop: use $(TARGET_CONFIGURE_OPTS)
	when calling $(MAKE)
Message-ID: <20161022132037.D54A97F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fc51ef91bb4d5bc9d28c792ad7e07b21b51ab92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/latencytop/latencytop.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/latencytop/latencytop.mk b/package/latencytop/latencytop.mk
index 935b2a3..644a84f 100644
--- a/package/latencytop/latencytop.mk
+++ b/package/latencytop/latencytop.mk
@@ -17,7 +17,7 @@ define LATENCYTOP_BUILD_CMDS
 endef
 
 define LATENCYTOP_INSTALL_TARGET_CMDS
-	$(MAKE) install -C $(@D) DESTDIR=$(TARGET_DIR) HAS_GTK_GUI=
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D) DESTDIR=$(TARGET_DIR) HAS_GTK_GUI=
 endef
 
 $(eval $(generic-package))
