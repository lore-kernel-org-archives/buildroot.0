From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:09 +0100
Subject: [Buildroot] [RFC v2 09/31] newt: warn that legal-info is not
	implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-10-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/newt/newt.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index eb944a9..a85cb2d 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -58,6 +58,10 @@ $(TARGET_DIR)/usr/lib/libnewt.so.$(NEWT_VERSION): $(STAGING_DIR)/usr/lib/libnewt
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnewt.so*
 	touch -c $@
 
+newt-legal-info:
+	@echo WARNING: Cannot produce any legal info for package newt \
+		>>$(LEGAL_WARNINGS)
+
 newt: slang $(TARGET_DIR)/usr/lib/libnewt.so.$(NEWT_VERSION)
 
 newt-source: $(DL_DIR)/$(NEWT_SOURCE)
-- 
1.7.5.4
