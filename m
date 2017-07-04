From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue,  4 Jul 2017 18:22:37 +0200
Subject: [Buildroot] [PATCH v6 08/10] core: install relocation script and
	location at the end of the build
In-Reply-To: <1499185359-8293-1-git-send-email-wg@grandegger.com>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
Message-ID: <1499185359-8293-9-git-send-email-wg@grandegger.com>
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
index f5646ad..7e92428 100644
--- a/Makefile
+++ b/Makefile
@@ -556,6 +556,8 @@ world: target-post-image host-finalize
 host-finalize:
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	$(TOPDIR)/support/scripts/fix-rpath host
+	install $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)
+	echo $(HOST_DIR) > $(HOST_DIR)/usr/share/buildroot/sdk-location
 
 # We need patchelf for RPATH sanitization
 PACKAGES += host-patchelf
-- 
2.7.4
