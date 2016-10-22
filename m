From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] dtc: use $(HOST_CONFIGURE_OPTS) when
	calling $(MAKE)
Message-ID: <20161022132039.3C09E819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fa39e2162b95a1ed8037af3e1f6bebc381429ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dtc/dtc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 9dbca0a..0a48644 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -51,7 +51,7 @@ define HOST_DTC_BUILD_CMDS
 endef
 
 define HOST_DTC_INSTALL_CMDS
-	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin
 endef
 
 $(eval $(generic-package))
