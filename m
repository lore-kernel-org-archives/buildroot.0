From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 23:58:18 +0100
Subject: [Buildroot] [git commit] vsftpd: add empty directory
	/usr/share/empty
Message-ID: <20130121225843.5B11B9A6D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed357ebef6042619095e0e3e81cf1dcd27b19abc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Vsftpd needs an empty directory where it can chroot.
If /usr/share/empty isn't present it refuses to work in the default
configuration.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vsftpd/vsftpd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index a075e82..36f2645 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -47,6 +47,7 @@ define VSFTPD_INSTALL_TARGET_CMDS
 	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
 		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
 			$(TARGET_DIR)/etc/vsftpd.conf
+	install -d -m 700 $(TARGET_DIR)/usr/share/empty
 endef
 
 define VSFTPD_UNINSTALL_TARGET_CMDS
