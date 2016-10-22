From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] iodine: use $(TARGET_CONFIGURE_OPTS) when
	calling $(MAKE)
Message-ID: <20161022132039.51376819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9b1e6edc3aec38fd3171464fbabc31f1bca5255
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iodine/iodine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iodine/iodine.mk b/package/iodine/iodine.mk
index 9de54e0..711d709 100644
--- a/package/iodine/iodine.mk
+++ b/package/iodine/iodine.mk
@@ -26,7 +26,7 @@ define IODINE_BUILD_CMDS
 endef
 
 define IODINE_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)" prefix=/usr
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)" prefix=/usr
 endef
 
 $(eval $(generic-package))
