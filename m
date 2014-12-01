From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:28:59 +0100
Subject: [Buildroot] [git commit] samba: install configuration file
	unconditionally
Message-ID: <20141201233009.85E4D80051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0e56499354d41a3512b674004d84f9e82f98b15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba/samba.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 92bbe4e..0e4db95 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -177,10 +177,7 @@ SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_SWAT_DOCUMENTATION
 endif
 
 define SAMBA_INSTALL_CONFIG
-	# install config
-	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
-		$(INSTALL) -m 0644 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
-	fi
+	$(INSTALL) -m 0644 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf
 endef
 
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_CONFIG
