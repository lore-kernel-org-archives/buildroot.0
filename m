From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Dec 2010 14:04:22 -0300
Subject: [Buildroot] [PATCH 01/13] portmap: install initscript
Message-ID: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to patrick.ziegler at fh-kl.de in the mailing list for noticing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/portmap/portmap.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index dba6155..e83ff1d 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -23,6 +23,8 @@ define PORTMAP_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/man/man8/pmap_dump.8
 	$(INSTALL) -D $(@D)/pmap_set.8 \
 		$(TARGET_DIR)/usr/share/man/man8/pmap_set.8
+	$(INSTALL) -m 0755 package/portmap/S13portmap \
+		$(TARGET_DIR)/etc/init.d
 endef
 
 define PORTMAP_UNINSTALL_TARGET_CMDS
-- 
1.7.2.2
