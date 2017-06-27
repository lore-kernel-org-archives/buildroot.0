From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 27 Jun 2017 12:26:44 +0200
Subject: [Buildroot] [PATCH v4 08/11] core: install relocation script and
	location at the end of the build
In-Reply-To: <1498559207-8050-1-git-send-email-wg@grandegger.com>
References: <1498559207-8050-1-git-send-email-wg@grandegger.com>
Message-ID: <1498559207-8050-9-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The script "relocate-sdk.sh" is installed into the top directory of
the SDK (HOST_DIR) and the SDK location path is stored in the file
"HOST_DIR/usr/share/buildroot/sdk-location"-

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index e492342..6181d9f 100644
--- a/Makefile
+++ b/Makefile
@@ -553,6 +553,8 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 world: target-post-image
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	$(TOPDIR)/support/scripts/fix-rpath host
+	install $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR) && \
+	echo $(HOST_DIR) > $(HOST_DIR)/usr/share/buildroot/sdk-location
 
 # We need patchelf for RPATH sanitation
 PACKAGES += host-patchelf
-- 
2.7.4
