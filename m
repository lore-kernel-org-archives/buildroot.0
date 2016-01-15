From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Jan 2016 09:47:35 +0100
Subject: [Buildroot] [PATCH] perf: remove tests from target
Message-ID: <1452847655-15415-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The perf tool installed test files in
    output/target/usr/libexec/perf-core/tests/
which amounted to about 30+K.

Since they are not needed for normal perf operation, remove them.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 linux/linux-tool-perf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux-tool-perf.mk b/linux/linux-tool-perf.mk
index 0bd0ed1..07c3514 100644
--- a/linux/linux-tool-perf.mk
+++ b/linux/linux-tool-perf.mk
@@ -84,4 +84,5 @@ define PERF_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
 		-C $(@D)/tools/perf O=$(@D)/tools/perf/ install
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
+	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
 endef
-- 
2.4.10
