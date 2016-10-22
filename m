From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] libpfm4: use $(MAKE) rather than make
	directly
Message-ID: <20161022132037.3E0D2819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d90b8ec383abdfc6587176b4eca79e801fa82a98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpfm4/libpfm4.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 147be7c..358fd9d 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -21,11 +21,11 @@ define LIBPFM4_BUILD_CMDS
 endef
 
 define LIBPFM4_INSTALL_STAGING_CMDS
-	make -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(STAGING_DIR)/usr install
+	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(STAGING_DIR)/usr install
 endef
 
 define LIBPFM4_INSTALL_TARGET_CMDS
-	make -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(TARGET_DIR)/usr install
+	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(TARGET_DIR)/usr install
 endef
 
 $(eval $(generic-package))
