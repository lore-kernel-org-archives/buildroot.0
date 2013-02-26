From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Feb 2013 22:34:53 +0100
Subject: [Buildroot] [git commit] kernel-headers: remove legacy code
Message-ID: <20130226213540.B670A9AD7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77e5e0d3fad2a97628aa959187cdbf06015ddd15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_KERNEL_HEADERS_2_6_35 symbol no longer exists since some time,
so get rid of code that was specific to this kernel version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/kernel-headers.mk |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 76602d8..073d609 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -36,15 +36,6 @@ LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOLCHAIN_DIR)/linux
 
-# long term support kernels are stored in a longterm/v2.6.x subdir
-ifeq ($(BR2_KERNEL_HEADERS_2_6_35),y)
-DEFAULT_KERNEL_HEADERS_MAJOR := \
-	$(shell echo $(DEFAULT_KERNEL_HEADERS) | sed 's/\.[0-9]*$$//')
-# += adds a space between
-LINUX_HEADERS_SITE:= \
-	$(LINUX_HEADERS_SITE)longterm/v$(DEFAULT_KERNEL_HEADERS_MAJOR)/
-endif
-
 LINUX_HEADERS_DEPENDS:=
 
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
