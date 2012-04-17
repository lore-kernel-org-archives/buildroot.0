From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:14 +0200
Subject: [Buildroot] [PATCH 02/22] Remove cc-option: not used anywhere
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f29f6efc37cf8f3b23bb23383ffb8e590de38e17.1334673910.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index f56c8ee..90c2086 100644
--- a/Makefile
+++ b/Makefile
@@ -177,13 +177,6 @@ BUILD_DIR:=$(BASE_DIR)/build
 
 ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
-# cc-option
-# Usage: cflags-y+=$(call cc-option, -march=winchip-c6, -march=i586)
-# sets -march=winchip-c6 if supported else falls back to -march=i586
-# without checking the latter.
-cc-option=$(shell if $(TARGET_CC) $(TARGET_CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
-	> /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
-
 #############################################################
 #
 # Hide troublesome environment variables from sub processes
-- 
1.7.4.1
