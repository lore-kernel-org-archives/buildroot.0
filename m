From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 16:35:20 +0200
Subject: [Buildroot] [PATCH v8 09/10] core: install relocation script and
	location to make a relocatable SDK
In-Reply-To: <1500561321-6623-1-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
Message-ID: <1500561321-6623-10-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The script "relocate-sdk.sh" is installed into the top directory of
the SDK (HOST_DIR) and the SDK location path is stored in the file
"HOST_DIR/share/buildroot/sdk-location"-

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index c54c420..ee0ff13 100644
--- a/Makefile
+++ b/Makefile
@@ -558,6 +558,8 @@ sdk: toolchain $(PACKAGES)
 	$(TOPDIR)/support/scripts/fix-rpath host
 	@$(call MESSAGE,"Sanitizing RPATH in staging tree")
 	$(TOPDIR)/support/scripts/fix-rpath staging
+	install $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)
+	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
 
 # Compatibility symlink in case a post-build script still uses $(HOST_DIR)/usr
 $(HOST_DIR)/usr: $(HOST_DIR)
-- 
2.7.4
