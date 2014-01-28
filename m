From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 28 Jan 2014 14:10:40 +0100
Subject: [Buildroot] [PATCH 1/2] perf: Add support for Linux 3.13
Message-ID: <1390914640-18160-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile has been renamed to Makefile.perf; so now we check
both Makefiles to support 3.7 - 3.12 and 3.13 - beyond.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/perf/perf.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index d7898d0..ffe18bc 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -35,7 +35,7 @@ define PERF_BUILD_CMDS
 		exit 1 ; \
 	fi
 	$(Q)if test "$(BR2_PACKAGE_ELFUTILS)" = "" ; then \
-		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile ; then \
+		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile $(LINUX_DIR)/tools/perf/Makefile.perf ; then \
 			echo "The perf tool in your kernel cannot be built without libelf." ; \
 			echo "Either upgrade your kernel to >= 3.7, or enable the elfutils package." ; \
 			exit 1 ; \
-- 
1.7.9.5
