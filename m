From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:46:13 +0200
Subject: [Buildroot] [PATCH 48/50 v2] package/busybox: invert dependency
 with bash
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <d7be2552df2b3ee3f2bd1ffc79f9980f1cb6b2b4.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bash/bash.mk       | 4 +---
 package/busybox/busybox.mk | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index bb52bf3259..7fb7192e2c 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -6,9 +6,7 @@
 
 BASH_VERSION = 4.4.18
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
-# Build after since bash is better than busybox shells
-BASH_DEPENDENCIES = ncurses readline host-bison \
-	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
+BASH_DEPENDENCIES = ncurses readline host-bison
 BASH_CONF_OPTS = --with-installed-readline --without-bash-malloc
 BASH_LICENSE = GPL-3.0+
 BASH_LICENSE_FILES = COPYING
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 75a2dc4c6d..0a9af9f17b 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_BASH),bash) \
 	$(if $(BR2_PACKAGE_BC),bc) \
 	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
 	$(if $(BR2_PACKAGE_COREUTILS),coreutils) \
-- 
2.14.1
