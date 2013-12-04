From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 11:50:41 +0100
Subject: [Buildroot] [git commit] lighttpd: fix systemd service file
	permission
Message-ID: <20131204105202.4D0519BF0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e18b3177702e071ed5385e821a0bef937ff67570
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Systemd service files don't need to be +x so switch the installation to
mode 644.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index c820a73..70421cf 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -98,7 +98,7 @@ endef
 
 define LIGHTTPD_INSTALL_INIT_SYSTEMD
 	[ -f $(TARGET_DIR)/etc/systemd/system/lighttpd.service ] || \
-		$(INSTALL) -D -m 755 package/lighttpd/lighttpd.service \
+		$(INSTALL) -D -m 644 package/lighttpd/lighttpd.service \
 			$(TARGET_DIR)/etc/systemd/system/lighttpd.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
