From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:44 +0200
Subject: [Buildroot] [PATCH 30/35] pkg-download: get rid of DL_MODE
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-31-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The DL_MODE variable is now no longer used with any other value than
"DOWNLOAD", so it no longer makes sense to have this variable at
all. Therefore, this commit gets rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index b5af5a2..0bc98b1 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -20,10 +20,6 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
 
-# Default spider mode is 'DOWNLOAD'. Other possible value is
-# 'SOURCE_CHECK' used by the _source-check target.
-DL_MODE = DOWNLOAD
-
 # DL_DIR may have been set already from the environment
 ifeq ($(origin DL_DIR),undefined)
 DL_DIR ?= $(call qstrip,$(BR2_DL_DIR))
@@ -214,7 +210,7 @@ endef
 ################################################################################
 
 define DOWNLOAD
-	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),$(DL_MODE))
+	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),DOWNLOAD)
 endef
 
 define SOURCE_CHECK
-- 
2.1.0
