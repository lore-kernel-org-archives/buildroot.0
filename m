From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 14:04:57 +0100
Subject: [Buildroot] [git commit] perf: remove tests from target
Message-ID: <20160116130708.28E258038C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77e7cdb5de94801982d0b0c37d26a12884ae1785
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The perf tool installed test files in
    output/target/usr/libexec/perf-core/tests/
which amounted to about 30+K.

Since they are not needed for normal perf operation, remove them.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
