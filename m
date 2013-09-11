From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Sep 2013 13:21:53 +0200
Subject: [Buildroot] [git commit] linux.mk: target-install: drop extra
	(invalid) DEPMOD parameter
Message-ID: <20130911112409.F09F99B6F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f817237fdc66f9484a65df7631b48d4103578e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DEPMOD is already specified in LINUX_MAKE_FLAGS, and is no longer located
in HOST_DIR/usr/sbin after the move to host-kmod, so drop it from here.

Reported-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 649d06b..901ce25 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -273,8 +273,7 @@ define LINUX_INSTALL_TARGET_CMDS
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
-		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) 		\
-			DEPMOD="$(HOST_DIR)/usr/sbin/depmod" modules_install ;		\
+		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) modules_install; \
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ;		\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ;	\
 	fi
