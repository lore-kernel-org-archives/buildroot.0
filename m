From: Cyril Bur <cyrilbur@gmail.com>
Date: Thu, 29 Oct 2015 17:11:41 +1100
Subject: [Buildroot] [PATCH 1/2] package/dropbear: Respect user specific
	configurations
Message-ID: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd .service file should respect /etc/default/dropbear
---
 package/dropbear/dropbear.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dropbear/dropbear.service b/package/dropbear/dropbear.service
index 1eb42f9..66ec9cf 100644
--- a/package/dropbear/dropbear.service
+++ b/package/dropbear/dropbear.service
@@ -19,7 +19,8 @@ if [ -L /etc/dropbear \
         mkdir -p "$(readlink /etc/dropbear)"; \
     fi; \
 fi'
-ExecStart=/usr/sbin/dropbear -F -R
+EnvironmentFile=/etc/default/dropbear
+ExecStart=/usr/sbin/dropbear -F -R $DROPBEAR_ARGS
 ExecReload=/bin/kill -HUP $MAINPID
 
 [Install]
-- 
2.6.2
