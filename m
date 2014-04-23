From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 23 Apr 2014 10:39:24 +0200
Subject: [Buildroot] [PATCH v5 2/2] Makefile: let show-targets prints also
	the dependencies
In-Reply-To: <1398242364-4644-1-git-send-email-fabio.porcedda@gmail.com>
References: <1398242364-4644-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1398242364-4644-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because the "show-targets" target print the targets that will be built,
print also their dependencies.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index fc111b3..eff408b 100644
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
