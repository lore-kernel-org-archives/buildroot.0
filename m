From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 22:51:02 +0100
Subject: [Buildroot] [git commit] linux: remove dirs dependency
Message-ID: <20140306215147.27C129BDD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eca29bdf5fa16656d68f25160fad646832dc1d13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "dirs" dependency is redundant because now the "generic-package"
infrastructure add automatically the "dirs" dependency so just remove
the redundant references.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3d52e69..e270705 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -302,12 +302,12 @@ include $(sort $(wildcard linux/linux-ext-*.mk))
 $(eval $(generic-package))
 
 ifeq ($(BR2_LINUX_KERNEL),y)
-linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs linux-configure
+linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: linux-configure
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
 	rm -f $(LINUX_DIR)/.stamp_{built,target_installed,images_installed}
 
-linux-savedefconfig linux26-savedefconfig: dirs linux-configure
+linux-savedefconfig linux26-savedefconfig: linux-configure
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
 
