From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Fri, 31 Aug 2007 10:58:16 +0200
Subject: [Buildroot] [PATCH] mpfr: Download from versioned directory on
	server
Message-ID: <46D7D828.8020208@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, mpfr is downloaded from /mpfr-current/ on the official
server. This directory contains only the latest version of mpfr, so
the download will fail each time a new version is released.

Instead, download it from /mpfr-$(MPFR_VERSION)/ which will always
contain the specified version.

Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
---
  package/mpfr/mpfr.mk |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 0c5f07f..2a2f89c 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -8,7 +8,7 @@ MPFR_PATCH:=patches
  MPFR_PATCH_FILE:=mpfr-$(MPFR_VERSION).patch
  MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
  MPFR_CAT:=$(BZCAT)
-MPFR_SITE:=http://www.mpfr.org/mpfr-current/
+MPFR_SITE:=http://www.mpfr.org/mpfr-$(MPFR_VERSION)/
  MPFR_DIR:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
  MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
  MPFR_BINARY:=libmpfr$(LIBTGTEXT)
-- 
1.5.2.4
