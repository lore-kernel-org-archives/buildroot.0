From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 May 2014 19:10:31 +0200
Subject: [Buildroot] [PATCH 05/12] boot/syslinux: move comments out of
	define-block
In-Reply-To: <cover.1399050467.git.yann.morin.1998@free.fr>
References: <cover.1399050467.git.yann.morin.1998@free.fr>
Message-ID: <758858debbeeb3f3bbc427ebe348986af6417d66.1399050467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The comments are mot really part of the command we want to execute,
so move themn out of the define-block. This also cleans up the output,
as they will no longer appear.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/syslinux/syslinux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
 
-- 
1.8.3.2
