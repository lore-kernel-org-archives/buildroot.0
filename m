From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:06:16 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain: remove redundant and
	incorrect --with-build-time-tools option
Message-ID: <20100727210656.EB159835A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=460ba963acb17df043f412e5c01fda250da6b410
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option is already part of the gcc configure options through the
BR2_CONFIGURE_BUILD_TOOLS variable (in toolchain/Makefile.in).

Additionnally, the value that was passed in the AVR32 specific case
was incorrect: it was $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin
instead of $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/Makefile.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index 4278bdb..9537e9d 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -46,8 +46,6 @@ endif
 ifeq ($(BR2_avr32),y)
 EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
 SOFT_FLOAT_CONFIG_OPTION:=
-EXTRA_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
-#EXTRA_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
 endif
 
 ifeq ($(BR2_PACKAGE_GCC_TARGET),y)
-- 
1.7.1
