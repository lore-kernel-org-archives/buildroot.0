From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Sep 2013 23:54:44 +0200
Subject: [Buildroot] [git commit] perf: Add host-bison,
	host-flex dependencies
Message-ID: <20130907061414.2B9CE9A2A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2fa8eb91c70ec084ba72c5b1f2ca180257b9441
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/perf/perf.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index 7787c78..120353f 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -8,7 +8,7 @@
 PERF_SOURCE =
 PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 
-PERF_DEPENDENCIES = linux
+PERF_DEPENDENCIES = linux host-flex host-bison
 
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
@@ -40,14 +40,14 @@ define PERF_BUILD_CMDS
 			exit 1 ; \
 		fi \
 	fi
-	$(MAKE) -C $(LINUX_DIR)/tools/perf \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \
 		$(PERF_MAKE_FLAGS) O=$(@D)
 endef
 
 # After installation, we remove the Perl and Python scripts from the
 # target.
 define PERF_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(LINUX_DIR)/tools/perf \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \
 		$(PERF_MAKE_FLAGS) O=$(@D) install
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 endef
