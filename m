From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:06 +0100
Subject: [Buildroot] [RFC v2 06/31] microperl: warn that legal-info is not
	implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-7-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/microperl/microperl.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index de5ecd6..f9c32a9 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -93,6 +93,10 @@ ifneq ($(BR2_STRIP_none),y)
 endif
 	(cd $(TARGET_DIR)/usr/bin; rm -f perl; ln -s microperl perl;)
 
+microperl-legal-info:
+	@echo WARNING: Cannot produce any legal info for package microperl \
+		>>$(LEGAL_WARNINGS)
+
 microperl: $(TARGET_DIR)/usr/bin/microperl
 
 microperl-source: $(DL_DIR)/$(MICROPERL_SOURCE)
-- 
1.7.5.4
