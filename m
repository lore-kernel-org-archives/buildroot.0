From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  9 Dec 2010 10:55:08 +0100
Subject: [Buildroot] [PATCH 10/16] cups: avoid using non reevaluated
	$(STAGING_DIR)
In-Reply-To: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
References: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291888514-31385-11-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/cups/cups.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 776fb57..169cdb3 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -8,7 +8,7 @@ CUPS_NAME = cups-$(CUPS_VERSION)
 CUPS_DIR = $(BUILD_DIR)/$(CUPS_NAME)
 CUPS_SITE = http://ftp.easysw.com/pub/cups/$(CUPS_VERSION)
 CUPS_SOURCE:=$(CUPS_NAME)-source.tar.bz2
-CUPS_DESTDIR:=$(STAGING_DIR)/usr/lib
+CUPS_DESTDIR = $(STAGING_DIR)/usr/lib
 CUPS_CAT:=$(BZCAT)
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-- 
1.7.2.3
