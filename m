From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed,  5 Jul 2017 18:53:11 +0200
Subject: [Buildroot] [PATCH v7 6/9] core: install relocation script and
	location at the end of the build
In-Reply-To: <1499273594-12106-1-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
Message-ID: <1499273594-12106-7-git-send-email-wg@grandegger.com>
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
index 2a265e0..32f85e8 100644
--- a/Makefile
+++ b/Makefile
@@ -559,6 +559,8 @@ world: target-post-image host-finalize
 host-finalize:
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	$(TOPDIR)/support/scripts/fix-rpath host
+	install $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)
+	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
 
 # When creating HOST_DIR, also symlink usr -> .
 $(HOST_DIR):
-- 
2.7.4
