From: Martin Hicks <mort@bork.org>
Date: Thu, 10 Feb 2011 11:41:39 -0500
Subject: [Buildroot] [PATCH] Allow file globs in microperl module list
Message-ID: <1297356099-15765-1-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This lets the user place file globs into the microperl module
list.  e.g.,

CGI/*.pm warnings.pm strict.pm

Signed-off-by: Martin Hicks <mort@bork.org>
---
 package/microperl/microperl.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index b68e825..71a4e4a 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -82,7 +82,8 @@ ifneq ($(MICROPERL_MODS),)
 	 for i in $(patsubst %,$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/%,$(dir $(MICROPERL_MODS))); do \
 		[ -d $$i ] || mkdir -p $$i; \
 	 done; \
-	 for i in $(MICROPERL_MODS); do \
+	 FILES="$(shell cd $(MICROPERL_DIR)/lib && ls $(MICROPERL_MODS))"; \
+	 for i in $$FILES; do \
 	 cp -dpf $(MICROPERL_DIR)/lib/$$i $(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \
 	 done; \
 	)
-- 
1.5.6.5
