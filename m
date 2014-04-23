From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 00:20:36 +0200
Subject: [Buildroot] [git commit] Makefile: let show-targets prints also the
	dependencies
Message-ID: <20140423222043.C46B09C99D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9f0543fc84fd69f4d9a64b90cfeddee90b71f89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because the "show-targets" target print the targets that will be built,
print also their dependencies.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
