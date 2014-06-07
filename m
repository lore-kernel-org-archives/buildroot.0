From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Jun 2014 23:46:07 +0200
Subject: [Buildroot] [RFCv1 4/4] Makefile: implement a graph-size target
In-Reply-To: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1402177567-8021-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like we have graph-build and graph-depends, this commit implements a
graph-size target to generate the corresponding graph.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 0b4264a..fee6b46 100644
--- a/Makefile
+++ b/Makefile
@@ -677,6 +677,11 @@ graph-depends:
 	|tee $(O)/graphs/$(@).dot \
 	|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
 
+graph-size:
+	@$(INSTALL) -d $(O)/graphs
+	@cd "$(TOPDIR)"; \
+	./support/scripts/graph-size --builddir $(O) --output $(O)/graphs/$(@).$(BR_GRAPH_OUT)
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -892,6 +897,7 @@ endif
 	@echo '  manual-epub            - build manual in ePub'
 	@echo '  graph-build            - generate graphs of the build times'
 	@echo '  graph-depends          - generate graph of the dependency tree'
+	@echo '  graph-size             - generate graph of the filesystem size'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
-- 
2.0.0
