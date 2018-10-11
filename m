From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 09:33:22 +0200
Subject: [Buildroot] [git commit] libsepol: remove library host symlink
Message-ID: <20181011073216.28A3F81898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36bf14cf0420a312e702cf92573813d8685579a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bump to version 2.7 and addition of
0003-revert-ln-relative.patch, the creation of a symlink through
ln -sf libsepol.so.1 $(HOST_DIR)/lib/libsepol.so
is not needed anymore so remove it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsepol/libsepol.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 5932ca1464..a9a9c652ea 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -41,7 +41,6 @@ endef
 
 define HOST_LIBSEPOL_INSTALL_CMDS
 	$(HOST_LIBSEPOL_MAKE_ENV) $(MAKE) -C $(@D) install $(HOST_CONFIGURE_OPTS)
-	ln -sf libsepol.so.1 $(HOST_DIR)/lib/libsepol.so
 endef
 
 $(eval $(generic-package))
