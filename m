From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] libpfm4: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132037.394598199C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78cefe7e60d13c88c565839d7264d8cc52d7b7a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpfm4/libpfm4.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 358fd9d..913fc35 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -17,15 +17,15 @@ LIBPFM4_FLAGS = SYS=Linux ARCH=$(BR2_ARCH) \
 	DBG=
 
 define LIBPFM4_BUILD_CMDS
-	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBPFM4_FLAGS)
 endef
 
 define LIBPFM4_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(STAGING_DIR)/usr install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(STAGING_DIR)/usr install
 endef
 
 define LIBPFM4_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(TARGET_DIR)/usr install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(TARGET_DIR)/usr install
 endef
 
 $(eval $(generic-package))
