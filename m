From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 30 Jan 2014 21:38:51 +0100
Subject: [Buildroot] [PATCH v3 4/6] infra: remove unused {TARGET,
	HOST}_PATH definition
In-Reply-To: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
References: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391114333-28001-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the variables TARGET_PATH and HOST_PATH are not used anymore,
let's remove them.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2 -> v3:
- rebase
- no one-line commit log (ThomasP)

changes v1 -> v2:
- rebase
---
 package/Makefile.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index bf6efe1..a313745 100644
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
1.8.5.3
