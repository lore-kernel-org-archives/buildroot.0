From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 23:33:07 +0200
Subject: [Buildroot] [git commit] acpid: fix obvious syntax error in
	addprefix call
Message-ID: <20130528214154.7CD079A3F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d96dc1a67569b4a2f67dbf9dee69dcdf1ce2200
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/acpid/acpid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
