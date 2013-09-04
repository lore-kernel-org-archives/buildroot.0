From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed,  4 Sep 2013 14:36:27 +0200
Subject: [Buildroot] [PATCH] perf: Add host-bison, host-flex dependencies
Message-ID: <1378298187-5058-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/perf/perf.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index 7787c78..004541e 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -8,7 +8,7 @@
 PERF_SOURCE =
 PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 
-PERF_DEPENDENCIES = linux
+PERF_DEPENDENCIES = linux host-flex host-bison
 
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
@@ -40,7 +40,7 @@ define PERF_BUILD_CMDS
 			exit 1 ; \
 		fi \
 	fi
-	$(MAKE) -C $(LINUX_DIR)/tools/perf \
+	$(HOST_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \
 		$(PERF_MAKE_FLAGS) O=$(@D)
 endef
 
-- 
1.7.9.5
