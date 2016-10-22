From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] shapelib: use $(TARGET_CONFIGURE_OPTS)
	when calling $(MAKE)
Message-ID: <20161022132038.44A937F925@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91e469a31c8ef7000cfb8b6ccfeb3838d2239252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shapelib/shapelib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index 1e9c16f..2e8fe6d 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -15,11 +15,11 @@ define SHAPELIB_BUILD_CMDS
 endef
 
 define SHAPELIB_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) PREFIX=$(STAGING_DIR)/usr/ lib_install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(STAGING_DIR)/usr/ lib_install
 endef
 
 define SHAPELIB_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr/ bin_install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr/ bin_install
 endef
 
 $(eval $(generic-package))
