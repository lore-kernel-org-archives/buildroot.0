From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed,  8 Dec 2010 10:54:07 +0100
Subject: [Buildroot] [PATCH 15/17] at: ensure startup script is well
	installed
In-Reply-To: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291802049-18764-16-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

In case /etc/init.d does not exist.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/at/at.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/at/at.mk b/package/at/at.mk
index c38c424..531cb40 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -20,6 +20,7 @@ AT_CONF_OPT = \
 	SENDMAIL=/usr/sbin/sendmail
 
 define AT_INSTALL_INITSCRIPT
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -m 0755 package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
 endef
 
-- 
1.7.2.3
