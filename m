From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 23 Mar 2017 08:54:50 +0100
Subject: [Buildroot] [RFC PATCH v3 07/10] core: install relocation script
	and location at the end of the build
In-Reply-To: <1490255693-9134-1-git-send-email-wg@grandegger.com>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
Message-ID: <1490255693-9134-8-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The script "relocate-sdk.sh" is installed into the the top directory
of the SDK (HOST_DIR) and the SDK location path is stored in the
file "HOST_DIR/usr/share/buildroot/sdk-location"-

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index aea85c8..5e61b39 100644
--- a/Makefile
+++ b/Makefile
@@ -549,6 +549,8 @@ PACKAGES += host-patchelf
 world: target-post-image
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	$(TOPDIR)/support/scripts/fix-rpath host
+	install $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR) && \
+	echo $(HOST_DIR) > $(HOST_DIR)/usr/share/buildroot/sdk-location
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars help \
-- 
1.9.1
