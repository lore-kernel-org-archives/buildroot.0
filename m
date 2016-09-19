From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2016 19:28:14 +0200
Subject: [Buildroot] [git commit] sam-ba: correct license
Message-ID: <20160919172828.BD979817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a81d1cda3f77ce4f6a5b423815e3b7488ba681be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sam-ba binary is distributed under a proprietary license. TCL and some
applets code is under a BSD-2c like license, while some other applets are
under BSD-4c.

Also correct license files.

Cc: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sam-ba/sam-ba.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index aede615..7fc65c0 100644
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
