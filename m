From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 16 Mar 2017 15:23:25 +0100
Subject: [Buildroot] [RFC PATCH v2 7/9] core: create relocate-sdk.sh in
	HOST_DIR at the end of the build
In-Reply-To: <1489674207-6876-1-git-send-email-wg@grandegger.com>
References: <1489674207-6876-1-git-send-email-wg@grandegger.com>
Message-ID: <1489674207-6876-8-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index aea85c8..1139304 100644
--- a/Makefile
+++ b/Makefile
@@ -549,6 +549,7 @@ PACKAGES += host-patchelf
 world: target-post-image
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	$(TOPDIR)/support/scripts/fix-rpath host
+	$(TOPDIR)/support/scripts/create-sdk-relocation-script $(HOST_DIR)
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars help \
-- 
1.9.1
