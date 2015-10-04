From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 20:17:35 +0200
Subject: [Buildroot] [git commit] linux: install dtc binary as linux-dtc
Message-ID: <20151004181804.72802807E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab74e09eb4e28dab8bed8d783c5f0464d39a32e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So it doesn't conflict with host-dtc. The Linux kernel version may be a
patched version supporting E.G. overlays.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 2319576..c98459f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -294,7 +294,7 @@ endif
 define LINUX_INSTALL_HOST_TOOLS
 	# Installing dtc (device tree compiler) as host tool, if selected
 	if grep -q "CONFIG_DTC=y" $(@D)/.config; then 	\
-		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc ;	\
+		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/linux-dtc ;	\
 	fi
 endef
 
