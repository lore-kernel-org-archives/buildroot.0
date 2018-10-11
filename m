From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 09:33:13 +0200
Subject: [Buildroot] [git commit] libselinux: remove library host symlink
Message-ID: <20181011073216.20FCA81898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de52b0d439732433c1d36b8bf7b2a9cb59e2acb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bump to version 2.7 and addition of
0003-revert-ln-relative.patch, the creation of a symlink through
ln -sf libselinux.so.1 $(HOST_DIR)/lib/libselinux.so
is not needed anymore so remove it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libselinux/libselinux.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index b3d48f7105..97b4f03062 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -102,7 +102,6 @@ endef
 define HOST_LIBSELINUX_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_LIBSELINUX_MAKE_OPTS) install
-	ln -sf libselinux.so.1 $(HOST_DIR)/lib/libselinux.so
 	# Install python interface wrapper
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_LIBSELINUX_MAKE_OPTS) install-pywrap
