From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:19:29 +0100
Subject: [Buildroot] [git commit] dmraid: install init script unconditionally
Message-ID: <20141201233009.2A80580051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e31c6b961aff7e5018f8f5c72d938f1ad577c21f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmraid/dmraid.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 024b9b5..a6ed57f 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -18,9 +18,8 @@ DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
 DMRAID_DEPENDENCIES = lvm2
 
 define DMRAID_INSTALL_INIT_SYSV
-	[ -f $(TARGET_DIR)/etc/init.d/S20dmraid ] || \
-		$(INSTALL) -D -m 0755 package/dmraid/S20dmraid \
-			$(TARGET_DIR)/etc/init.d/S20dmraid
+	$(INSTALL) -D -m 0755 package/dmraid/S20dmraid \
+		$(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
 $(eval $(autotools-package))
