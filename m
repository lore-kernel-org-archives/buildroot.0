From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 22:28:09 +0200
Subject: [Buildroot] [git commit] nginx: activate the systemd service
Message-ID: <20150713202813.1F51581973@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=112ab5f40467f8d8b89cdba99d864f33a7618054
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Aur??lien Chabot <aurelien@chabot.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx/nginx.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index c617f68..32a337c 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -230,6 +230,11 @@ endef
 define NGINX_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/nginx/nginx.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/nginx.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -fs ../../../../usr/lib/systemd/system/nginx.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nginx.service
 endef
 
 define NGINX_INSTALL_INIT_SYSV
