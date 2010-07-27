From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:02:22 +0200
Subject: [Buildroot] [PATCH 2/3] toolchain: Remove now-unused variables
In-Reply-To: <cover.1280264418.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280264418.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c7f180eca5eb35f2973cf0c89e1d047e090e02af.1280264418.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The variable BR2_SYSROOT_STAGING_DESTDIR is no longer used, since now
the prefix for gcc is already set to the correct location.

The variable BR2_SYSROOT_TARGET_DESTDIR was already unused.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Makefile.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
index e5fae1f..d1af877 100644
--- a/toolchain/Makefile.in
+++ b/toolchain/Makefile.in
@@ -10,8 +10,6 @@ else
 MULTILIB:=--disable-multilib
 endif
 
-BR2_SYSROOT_STAGING_DESTDIR=DESTDIR=$(STAGING_DIR)/
-BR2_SYSROOT_TARGET_DESTDIR=DESTDIR=$(TARGET_DIR)/
 BR2_CONFIGURE_DEVEL_SYSROOT=--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/
 BR2_CONFIGURE_STAGING_SYSROOT=--with-sysroot=$(STAGING_DIR)
 BR2_CONFIGURE_BUILD_TOOLS=--with-build-time-tools=$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
-- 
1.7.0.4
