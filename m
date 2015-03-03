From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:27 +0100
Subject: [Buildroot] [RFC v3 22/30] Makefile: add the STAGINGNOPKG_DIR
	variable
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-23-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is to be able to access the common staging directory even when in a
successive commit the STAGING_DIR will point to the per-package staging
directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/Makefile.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 803b162..88ace05 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -108,6 +108,7 @@ endif
 
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
+STAGINGNOPKG_DIR := $(STAGING_DIR)
 
 TARGET_OPTIMIZATION := $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
-- 
2.3.1
