From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 24 Oct 2012 09:17:01 +0200
Subject: [Buildroot] [PATCHv2 04/10] busybox: busybox-update-config should
	depend on busybox-configure
In-Reply-To: <1351063027-13800-1-git-send-email-arnout@mind.be>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
Message-ID: <1351063027-13800-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Before the config file can be copied, it has to exist.  The
other xxx-update-config targets do this as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: small spelling mistake in commit message
---
 package/busybox/busybox.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 33f8633..e95364c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -215,5 +215,5 @@ busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 	rm -f $(BUSYBOX_DIR)/.stamp_built
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
 
-busybox-update-config:
+busybox-update-config: busybox-configure
 	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
-- 
1.7.10.4
