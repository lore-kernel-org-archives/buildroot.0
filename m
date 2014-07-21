From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:55:52 +0200
Subject: [Buildroot] [git commit] perf: Add support for Linux 3.13
Message-ID: <20140721195556.EFC2E9D2A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c07552996f9a24becbc78a27e2e3c6efe6bd87e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Makefile has been renamed to Makefile.perf; so now we check both
Makefile and Makefile.perf to support 3.7 - 3.12 and 3.13 - beyond.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perf/perf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
