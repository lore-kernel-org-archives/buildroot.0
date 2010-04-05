From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Apr 2010 13:29:01 +0200
Subject: [Buildroot] [git commit master] busybox: respect
	BR2_PREFER_STATIC_LIB
Message-ID: <20100405112952.02D938DCCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3ef9b6969c8ea5c6ff0e3cf5e40a4185a57999d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build static version if requested in BR config.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7f2f171..cc2097e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -78,6 +78,11 @@ ifeq ($(BR2_INET_RPC),y)
 else
 	$(SED) "s/^.*CONFIG_FEATURE_MOUNT_NFS.*/CONFIG_FEATURE_MOUNT_NFS=n/;" $(BUSYBOX_DIR)/.config
 endif
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	$(SED) "s/^.*CONFIG_STATIC.*/CONFIG_STATIC=y/;" $(BUSYBOX_DIR)/.config
+else
+	$(SED) "s/^.*CONFIG_STATIC.*/CONFIG_STATIC=n/;" $(BUSYBOX_DIR)/.config
+endif
 ifeq ($(BR2_PACKAGE_BUSYBOX_SKELETON),y)
 	# force mdev on
 	$(SED) "s/^.*CONFIG_MDEV.*/CONFIG_MDEV=y/" $(BUSYBOX_DIR)/.config
-- 
1.6.3.3
