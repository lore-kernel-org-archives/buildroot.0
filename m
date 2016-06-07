From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 22:10:56 +0200
Subject: [Buildroot] [git commit] package/uclibc: use the generic help rules
Message-ID: <20160607201335.B3C7A8074E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72122c50af477015e950f24167e140f946efb6b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that the uclibc-menuconfig rule was guarded behind
BR2_TOOLCHAIN_BUILDROOT, which is wrong since we can build
glibc or musl toolchains too...

This is de facto fixed by moving the help text to the uClibc package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: don't use the helper.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                 | 3 ---
 package/uclibc/uclibc.mk | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index bb3d588..f007db2 100644
--- a/Makefile
+++ b/Makefile
@@ -941,9 +941,6 @@ help:
 		@echo $(sep) \
 		@echo '$($(p)_NAME):' $(sep) \
 		$($(p)_HELP_CMDS)$(sep))
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
-endif
 ifeq ($(BR2_TARGET_BAREBOX),y)
 	@echo '  barebox-menuconfig     - Run barebox menuconfig'
 	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index e20e8a8..6bc5f41 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -11,6 +11,10 @@ UCLIBC_LICENSE = LGPLv2.1+
 UCLIBC_LICENSE_FILES = COPYING.LIB
 UCLIBC_INSTALL_STAGING = YES
 
+define UCLIBC_HELP_CMDS
+	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
+endef
+
 # uclibc is part of the toolchain so disable the toolchain dependency
 UCLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
