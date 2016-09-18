From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Sep 2016 10:29:58 +0300
Subject: [Buildroot] [PATCH] sam-ba: correct license
Message-ID: <3f965e7ede7391104b6d53c8871777eba9f402b1.1474183798.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sam-ba binary is distributed under a proprietary license. TCL and some
applets code is under a BSD-2c like license, while some other applets are
under BSD-4c.

Also correct license files.

Cc: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sam-ba/sam-ba.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index aede615a3f94..7fc65c01a9b3 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -7,8 +7,10 @@
 SAM_BA_SITE = http://www.atmel.com/dyn/resources/prod_documents
 SAM_BA_VERSION = 2.16
 SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION)_linux.zip
-SAM_BA_LICENSE = BSD-like (partly binary-only)
-SAM_BA_LICENSE_FILES = doc/readme.txt
+SAM_BA_LICENSE = SAM-BA license (sam-ba executable), \
+		BSD-2c like, BSD-4c (TCL and applets code)
+SAM_BA_LICENSE_FILES = doc/license.txt tcl_lib/boards.tcl \
+		applets/sam4c/libraries/libchip_sam4c/include/sam4c/sam4c32e-1.h
 
 define HOST_SAM_BA_EXTRACT_CMDS
 	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
-- 
2.9.3
