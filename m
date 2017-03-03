From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri,  3 Mar 2017 15:18:50 +0100
Subject: [Buildroot] [RFC PATCH 6/9] core: create relocate-toolchain.sh in
	HOST_DIR/usr at the end of the build
In-Reply-To: <1488550733-3956-1-git-send-email-wg@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
Message-ID: <1488550733-3956-7-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index a68c9ce..afa7516 100644
--- a/Makefile
+++ b/Makefile
@@ -553,9 +553,14 @@ define SANITIZE_RPATH_HOST
 	$(TOPDIR)/support/scripts/fix-rpath host $(HOST_DIR)
 endef
 
+define CREATE_RELOCATION_SCRIPT
+	$(TOPDIR)/support/scripts/create-relocation-script $(HOST_DIR)
+endef
+
 world: target-post-image
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	$(SANITIZE_RPATH_HOST)
+	$(CREATE_RELOCATION_SCRIPT)
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars help \
-- 
1.9.1
