From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:02 -0000
Subject: [Buildroot] [git commit branch/next] lighttpd: fix systemd service
	activation symlink
Message-ID: <20150808105631.2940D7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0ce66ea6f97e2d190d8b949f43dca0fc66092d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Aur??lien Chabot <aurelien@chabot.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lighttpd/lighttpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 626cd69..d602556 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -88,7 +88,7 @@ define LIGHTTPD_INSTALL_INIT_SYSTEMD
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -fs ../../../../usr/lib/systemd/lighttpd.service \
+	ln -fs ../../../../usr/lib/systemd/system/lighttpd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
 endef
 
