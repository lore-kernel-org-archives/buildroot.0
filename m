From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 22:17:07 +0100
Subject: [Buildroot] [git commit] vsftpd: install sample config file to /etc
Message-ID: <20130120211813.1556F9A46A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3ea5e8d3d5faaad209a55ef9e17cc7b5761b2fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vsftpd comes with a sample config file that can serve as a starting
point for customization and enables a basic functionality.

[Peter: drop /usr/share/empty creation]
Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vsftpd/vsftpd.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 8d261c8..a075e82 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -44,6 +44,9 @@ define VSFTPD_INSTALL_TARGET_CMDS
 	test -f $(TARGET_DIR)/etc/init.d/S70vsftpd || \
 		$(INSTALL) -D -m 755 package/vsftpd/vsftpd-init \
 			$(TARGET_DIR)/etc/init.d/S70vsftpd
+	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
+		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
+			$(TARGET_DIR)/etc/vsftpd.conf
 endef
 
 define VSFTPD_UNINSTALL_TARGET_CMDS
