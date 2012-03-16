From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Mar 2012 14:54:55 +0100
Subject: [Buildroot] [PATCH 2/2] vsftpd: fix SSL dependency
In-Reply-To: <1331906095-18056-1-git-send-email-yegorslists@googlemail.com>
References: <1331906095-18056-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1331906095-18056-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/vsftpd/vsftpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 8d3a01e..3c9aa65 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -14,7 +14,7 @@ endef
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 VSFTPD_DEPENDENCIES += openssl
-VSFTPD_LIBS += -lssl
+VSFTPD_LIBS += -lssl -lcrypto
 VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_ENABLE_SSL
 endif
 
-- 
1.7.7
