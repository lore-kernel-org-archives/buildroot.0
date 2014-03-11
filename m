From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 11 Mar 2014 23:39:45 +0100
Subject: [Buildroot] [PATCH v7 4/6] infra: remove unused {TARGET,
	HOST}_PATH definition
In-Reply-To: <1394577587-6426-1-git-send-email-s.martin49@gmail.com>
References: <1394577587-6426-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1394577587-6426-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the variables TARGET_PATH and HOST_PATH are not used anymore,
let's remove them.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v6 -> v7:
- rebase

changes v4 -> v6:
- rebase

changes v3 -> v4:
- rebase
- rename BR2_PATH -> BR_PATH

changes v2 -> v3:
- rebase
- no one-line commit log (ThomasP)

changes v1 -> v2:
- rebase
---
 package/Makefile.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index d92628c..6817867 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -144,8 +144,6 @@ else
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
 endif
 
-TARGET_PATH = $(BR_PATH)
-
 # Define TARGET_xx variables for all common binutils/gcc
 TARGET_AR       = $(TARGET_CROSS)ar
 TARGET_AS       = $(TARGET_CROSS)as
@@ -199,7 +197,6 @@ HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
-HOST_PATH = $(BR_PATH)
 
 # hostcc version as an integer - E.G. 4.3.2 => 432
 HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
-- 
1.9.0
