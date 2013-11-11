From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 21:59:44 +0100
Subject: [Buildroot] [PATCH 4/6] infra: remove unused {TARGET,
	HOST}_PATH definition
In-Reply-To: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
References: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1384203586-17790-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Makefile.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 7ce84ce..501a0b3 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -144,9 +144,6 @@ else
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
 endif
 
-# Quotes are needed for spaces et al in path components.
-TARGET_PATH = $(BR2_PATH)
-
 # Define TARGET_xx variables for all common binutils/gcc
 TARGET_AR       = $(TARGET_CROSS)ar
 TARGET_AS       = $(TARGET_CROSS)as
@@ -200,7 +197,6 @@ HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
-HOST_PATH = $(BR2_PATH)
 
 # hostcc version as an integer - E.G. 4.3.2 => 432
 HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
-- 
1.8.4.2
