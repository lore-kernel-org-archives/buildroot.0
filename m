From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:10 -0000
Subject: [Buildroot] [git commit branch/next] package/pppd: install pon,
	poff scripts
Message-ID: <20150808105608.646DC81778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e05d4ffe08af3b1489548176dadce1ca352e21c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pppd/pppd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 0f9945f..554b830 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -98,6 +98,8 @@ define PPPD_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/openl2tp.so
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppol2tp/pppol2tp.so \
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/pppol2tp.so
+	$(INSTALL) -D -m 0755 $(PPPD_DIR)/scripts/pon $(TARGET_DIR)/usr/bin/pon
+	$(INSTALL) -D -m 0755 $(PPPD_DIR)/scripts/poff $(TARGET_DIR)/usr/bin/poff
 	$(PPPD_INSTALL_RADIUS)
 endef
 
