From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 28 May 2019 23:06:23 +0200
Subject: [Buildroot] [git commit] package/mender: install additional
 inventory scripts
Message-ID: <20190528210121.986AD83916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbb4bc7dfacb205c3f87f63e5e762a5f82d92f55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are two additional inventory scripts provided in
the Mender client repository, let's install them.

- mender-inventory-os
    - will push content of /etc/os-release
- mender-inventory-rootfs-type
    - will push filesystem type of rootfs

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mender/mender.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 07f6e5e5f9..d56b634713 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -46,7 +46,7 @@ define MENDER_INSTALL_CONFIG_FILES
 
 	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
 		$(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
-	$(foreach f,hostinfo network, \
+	$(foreach f,hostinfo network os rootfs-type, \
 		$(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
 			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
 	)
