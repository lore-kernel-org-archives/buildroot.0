From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:03 -0000
Subject: [Buildroot] [git commit branch/next] nginx: activate the systemd
	service
Message-ID: <20150808105631.685527FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=112ab5f40467f8d8b89cdba99d864f33a7618054
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
