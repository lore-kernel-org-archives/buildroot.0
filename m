From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:02 +0100
Subject: [Buildroot] [RFC v2 02/31] cups: warn that legal-info is not
	implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/cups/cups.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 4e8db71..1ad551f 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -110,6 +110,10 @@ $(CUPS_DIR)/.installed: $(CUPS_DIR)/.compiled
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/bin/cups-config
 	touch $@
 
+cups-legal-info:
+	@echo WARNING: Cannot produce any legal info for package cups \
+		>>$(LEGAL_WARNINGS)
+
 cups: host-autoconf $(CUPS_DEPENDENCIES) $(CUPS_DIR)/.installed
 
 cups-source: $(DL_DIR)/$(CUPS_SOURCE)
-- 
1.7.5.4
