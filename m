From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 21:37:48 +0200
Subject: [Buildroot] [git commit] boot/syslinux: move comments out of
	define-block
Message-ID: <20140503200855.E51249CACC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a2b94acf8d4131c12fac922b1b9ae2b8b486f1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comments are not really part of the command we want to execute,
so move them out of the define-block. This also cleans up the output,
as they will no longer appear.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/syslinux.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index a1eb394..ee71a0a 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -22,9 +22,9 @@ define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" AR="$(HOSTAR)" -C $(@D)
 endef
 
+# While the actual bootloader is compiled for the target, several
+# utilities for installing the bootloader are meant for the host.
 define SYSLINUX_INSTALL_TARGET_CMDS
-	# While the actual bootloader is compiled for the target, several
-	# utilities for installing the bootloader are meant for the host.
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR) install
 endef
 
