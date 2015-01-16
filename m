From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Jan 2015 08:37:35 +0200
Subject: [Buildroot] [PATCH] dtc: install libfdt headers to staging
Message-ID: <dcb93a863d98147bb850079e63f6a45231e24660.1421390255.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The newly introduced install-lib target that we use since commit 8b500c1b63dc
(dtc: bump version to 1.4.1) does not install headers. Add install-includes to
DTC_INSTALL_STAGING_CMDS to make dependent packages like kexec-lite build.

Fixes:
http://autobuild.buildroot.net/results/515/515d32e45957e911fda6345f909fa9200df311ff/
http://autobuild.buildroot.net/results/b09/b09f15c7b59e972d2180d071804810315d2ee047/
http://autobuild.buildroot.net/results/023/02376cd3dccc98d10a58e5398b9f8db75239f263/
...

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dtc/dtc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index c01fe7b40078..e094f7bf782f 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -36,7 +36,8 @@ endef
 
 # For staging, only the library is needed
 define DTC_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install-lib
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install-lib \
+		install-includes
 endef
 
 define DTC_INSTALL_TARGET_CMDS
-- 
2.1.4
