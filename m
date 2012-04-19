From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Apr 2012 15:53:53 +0200
Subject: [Buildroot] [git commit] Remove cc-option: not used anywhere
Message-ID: <20120419194555.2C58096B1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=338c6d7cf278a3f694ab939f0e4254f0e81e98bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 3a09417..55d552b 100644
--- a/Makefile
+++ b/Makefile
@@ -178,13 +178,6 @@ BUILD_DIR:=$(BASE_DIR)/build
 
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
