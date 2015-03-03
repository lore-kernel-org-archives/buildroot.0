From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:14 +0100
Subject: [Buildroot] [RFC v3 09/30] cups: use TARGET_LDFLAGS
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-10-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in order to support the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/cups/cups.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index cc87574..502f7a3 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -12,6 +12,7 @@ CUPS_LICENSE_FILES = LICENSE.txt
 CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
+CUPS_CONF_ENV = DSOFLAGS="$(TARGET_LDFLAGS)"
 CUPS_CONF_OPTS = \
 	--without-perl \
 	--without-java \
-- 
2.3.1
