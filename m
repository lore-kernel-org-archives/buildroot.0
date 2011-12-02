From: Daniel Mack <zonque@gmail.com>
Date: Fri,  2 Dec 2011 11:49:11 +0100
Subject: [Buildroot] [PATCH] dnsmasq: create runtime directory
Message-ID: <1322822951-31492-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

$(TARGET_DIR)/var/lib/misc/ is the location where dnsmasq stores its
lease files. Create it to make the daemon work.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/dnsmasq/dnsmasq.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 0f8db9d..fc43abd 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -57,6 +57,7 @@ endef
 
 define DNSMASQ_INSTALL_TARGET_CMDS
 	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT) install
+	mkdir -p $(TARGET_DIR)/var/lib/misc/
 endef
 
 define DNSMASQ_UNINSTALL_TARGET_CMDS
-- 
1.7.7.3
