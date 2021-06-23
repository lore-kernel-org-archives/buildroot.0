From: Andreas Naumann <anaumann@ultratronik.de>
Date: Wed, 23 Jun 2021 10:36:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/gesftpserver: Add host-python as
 dependency
Message-ID: <20210623083634.8158-1-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gesftpserver needs python for the configure step.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/gesftpserver/gesftpserver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 85511a3c97..c67fdb3f79 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -19,7 +19,7 @@ GESFTPSERVER_CPE_ID_PRODUCT = sftpserver
 GESFTPSERVER_CONF_ENV = LIBS=-lpthread
 
 # overwrite openssh version if enabled
-GESFTPSERVER_DEPENDENCIES += \
+GESFTPSERVER_DEPENDENCIES += host-python \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	$(if $(BR2_PACKAGE_OPENSSH),openssh)
 
-- 
2.32.0
