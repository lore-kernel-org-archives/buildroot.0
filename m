From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  5 Feb 2013 18:16:01 +0100
Subject: [Buildroot] [PATCH 3/4] busybox: busybox-update-config should
	depend on busybox-configure
In-Reply-To: <cover.1360084128.git.arnout@mind.be>
References: <cover.1360084128.git.arnout@mind.be>
Message-ID: <906319b949f250124fdd06ea6bf4ac3b44337903.1360084128.git.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Before the config file can be copied, it has to exist.  The
other xxx-update-config targets do this as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
v4: Rebased against master.

v2: small spelling mistake in commit message
---
 package/busybox/busybox.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9154c08..599e145 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -223,5 +223,5 @@ busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 	rm -f $(BUSYBOX_DIR)/.stamp_built
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
 
-busybox-update-config:
+busybox-update-config: busybox-configure
 	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
-- 
1.7.10.4
