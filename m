From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 21 Jul 2014 18:02:12 +0400
Subject: [Buildroot] [PATCH V2] perf: Add support for Linux 3.13
Message-ID: <1405951332-8607-1-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile has been renamed to Makefile.perf; so now we check both
Makefile and Makefile.perf to support 3.7 - 3.12 and 3.13 - beyond.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/perf/perf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index 7610f3d..ffeec02 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -35,7 +35,7 @@ define PERF_BUILD_CMDS
 		exit 1 ; \
 	fi
 	$(Q)if test "$(BR2_PACKAGE_ELFUTILS)" = "" ; then \
-		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile ; then \
+		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile* ; then \
 			if ! test -r $(LINUX_DIR)/tools/perf/config/Makefile ; then \
 				echo "The perf tool in your kernel cannot be built without libelf." ; \
 				echo "Either upgrade your kernel to >= 3.7, or enable the elfutils package." ; \
-- 
1.8.4.1
