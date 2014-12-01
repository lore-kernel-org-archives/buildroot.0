From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:59:40 +0100
Subject: [Buildroot] [git commit] olsr: use <pkg>_INSTALL_INIT_SYSV mechanism
Message-ID: <20141201221140.E2A0D8002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fde19209a5c98d3366317d709a4126454e5cdba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/olsr/olsr.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 1051d18..539386d 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -31,9 +31,12 @@ define OLSR_INSTALL_TARGET_CMDS
 			LDCONFIG=/bin/true DESTDIR=$(TARGET_DIR) \
 			prefix="/usr" install ; \
 	done
-	$(INSTALL) -D -m 0755 package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/S50olsr
 	test -r $(TARGET_DIR)/etc/olsrd.conf || \
 		$(INSTALL) -D -m 0644 $(@D)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
 endef
 
+define OLSR_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/S50olsr
+endef
+
 $(eval $(generic-package))
