From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:10 +0100
Subject: [Buildroot] [RFC v2 10/31] tinyhttpd: warn that legal-info is not
	implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-11-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/tinyhttpd/tinyhttpd.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 739849f..00a3005 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -35,6 +35,10 @@ $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY): $(TINYHTTPD_DIR)/$(TINYHTTPD_BINARY)
 	$(INSTALL) -m 0755 package/tinyhttpd/S85tinyhttpd $(TARGET_DIR)/etc/init.d
 	mkdir -p $(TARGET_DIR)/var/www
 
+tinyhttpd-legal-info:
+	@echo WARNING: Cannot produce any legal info for package tinyhttpd \
+		>>$(LEGAL_WARNINGS)
+
 tinyhttpd: $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
 
 tinyhttpd-clean:
-- 
1.7.5.4
