From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 24 Aug 2009 23:27:53 +0200
Subject: [Buildroot] [git commit master] busybox: also enable ipv6 support
	in ifupdown if ipv6 support is enabled
Message-ID: <20090824212915.20E617774C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4ae691ecb960f79968df454cba0dab04bf1dba9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by: Chris Smith <chris.smith@tandberg.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a5978da..7be49b3 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -69,8 +69,10 @@ else
 endif
 ifeq ($(BR2_INET_IPV6),y)
 	$(SED) "s/^.*CONFIG_FEATURE_IPV6.*/CONFIG_FEATURE_IPV6=y/;" $(BUSYBOX_DIR)/.config
+	$(SED) "s/^.*CONFIG_FEATURE_IFUPDOWN_IPV6.*/CONFIG_FEATURE_IFUPDOWN_IPV6=y/;" $(BUSYBOX_DIR)/.config
 else
 	$(SED) "s/^.*CONFIG_FEATURE_IPV6.*/CONFIG_FEATURE_IPV6=n/;" $(BUSYBOX_DIR)/.config
+	$(SED) "s/^.*CONFIG_FEATURE_IFUPDOWN_IPV6.*/CONFIG_FEATURE_IFUPDOWN_IPV6=n/;" $(BUSYBOX_DIR)/.config
 endif
 ifeq ($(BR2_INET_RPC),y)
 	$(SED) "s/^.*CONFIG_FEATURE_MOUNT_NFS.*/CONFIG_FEATURE_MOUNT_NFS=y/;" $(BUSYBOX_DIR)/.config
-- 
1.6.3.3
