From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:04 +0200
Subject: [Buildroot] [PATCH v4 05/22] newt: warn that legal-info is not
	implemented
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/newt/newt.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index ac450e0..b10e4f8 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -58,6 +58,9 @@ $(TARGET_DIR)/usr/lib/libnewt.so.$(NEWT_VERSION): $(STAGING_DIR)/usr/lib/libnewt
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnewt.so*
 	touch -c $@
 
+newt-legal-info:
+	@$(call legal-warning-pkg,newt,legal-info not yet implemented)
+
 newt: slang $(TARGET_DIR)/usr/lib/libnewt.so.$(NEWT_VERSION)
 
 newt-source: $(DL_DIR)/$(NEWT_SOURCE)
-- 
1.7.9.5
