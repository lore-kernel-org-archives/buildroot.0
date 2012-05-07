From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:26 +0200
Subject: [Buildroot] [PATCH v3 05/22] newt: warn that legal-info is not
	implemented
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/newt/newt.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index ac450e0..b4eed5c 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -58,6 +58,9 @@ $(TARGET_DIR)/usr/lib/libnewt.so.$(NEWT_VERSION): $(STAGING_DIR)/usr/lib/libnewt
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnewt.so*
 	touch -c $@
 
+newt-legal-info:
+	@$(call legal-warning-pkg,newt,cannot produce any legal info)
+
 newt: slang $(TARGET_DIR)/usr/lib/libnewt.so.$(NEWT_VERSION)
 
 newt-source: $(DL_DIR)/$(NEWT_SOURCE)
-- 
1.7.5.4
