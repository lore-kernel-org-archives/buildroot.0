From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 23:17:48 +0200
Subject: [Buildroot] [PATCH] acpid: fix obvious syntax error in addprefix
	call
Message-ID: <1369775868-3461-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/acpid/acpid.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 4ad9f66..b557617 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -26,7 +26,7 @@ endef
 define ACPID_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/acpid
 	rm -f $(TARGET_DIR)/usr/bin/acpi_listen
-	rm -f $(addprefix )$(TARGET_DIR)/usr/share/man/man8/,acpid.8 acpi_listen.8)
+	rm -f $(addprefix $(TARGET_DIR)/usr/share/man/man8/,acpid.8 acpi_listen.8)
 endef
 
 define ACPID_CLEAN_CMDS
-- 
1.7.9.5
