From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:29:13 +0200
Subject: [Buildroot] [git commit] infra: remove unused {TARGET,
	HOST}_PATH definition
Message-ID: <20140416172939.655E29C80F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b989976475eca68551d77664e926a3876196a4e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the variables TARGET_PATH and HOST_PATH are not used anymore,
let's remove them.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0bce599..3549f15 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -168,8 +168,6 @@ else
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
 endif
 
-TARGET_PATH = $(BR_PATH)
-
 # Define TARGET_xx variables for all common binutils/gcc
 TARGET_AR       = $(TARGET_CROSS)ar
 TARGET_AS       = $(TARGET_CROSS)as
@@ -223,7 +221,6 @@ HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
-HOST_PATH = $(BR_PATH)
 
 # hostcc version as an integer - E.G. 4.3.2 => 432
 HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
