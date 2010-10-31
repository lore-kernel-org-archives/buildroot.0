From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 31 Oct 2010 17:35:15 +0100
Subject: [Buildroot] [PATCH 7/8] toolchain/internal: use global BR2 version
	string for gcc version string
In-Reply-To: <1288542916-21883-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1288542916-21883-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1288542916-21883-8-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index f17b73f..6e6767b 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -39,8 +39,7 @@ GCC_SRC_DIR:=$(GCC_DIR)
 
 # Branding works on >= 4.3
 ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
-BUILDROOT_VERSION_STRING=$(call qstrip,$(BR2_VERSION))
-EXTRA_GCC_CONFIG_OPTIONS+=--with-pkgversion="Buildroot $(BUILDROOT_VERSION_STRING)" \
+EXTRA_GCC_CONFIG_OPTIONS+=--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
 	--with-bugurl="http://bugs.buildroot.net/"
 endif
 
-- 
1.7.1
