From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 22 Apr 2014 12:10:59 +0200
Subject: [Buildroot] [PATCH v2] Makefile: let show-targets prints also the
	dependencies
Message-ID: <1398161459-8343-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because the "show-targets" target print the targets that will be built,
print also their dependencies.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v2:
 - remove the refactor code to simplify the merge of this patch

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d10da9d..a6e6ecb 100644
--- a/Makefile
+++ b/Makefile
@@ -653,7 +653,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
 	@rm -f $(LEGAL_WARNINGS)
 
 show-targets:
-	@echo $(TARGETS) $(TARGETS_ROOTFS)
+	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(TARGETS) $(TARGETS_ROOTFS)
 
 graph-build: $(O)/build/build-time.log
 	@install -d $(O)/graphs
-- 
1.8.3.2
