From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] keyutils: use $(TARGET_CONFIGURE_OPTS)
	when calling $(MAKE)
Message-ID: <20161022132038.D6D8A819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50dfeb8e5a54dc3b1c983b5a335c0eb5946d8707
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/keyutils/keyutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 7a30ba6..4a8dbac 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -28,11 +28,11 @@ define KEYUTILS_BUILD_CMDS
 endef
 
 define KEYUTILS_INSTALL_STAGING_CMDS
-	$(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define KEYUTILS_INSTALL_TARGET_CMDS
-	$(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
