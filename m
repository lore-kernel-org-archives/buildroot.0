From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:22 +0200
Subject: [Buildroot] [PATCH 48/50] package/busybox: invert dependency with
 bash
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <50997e123a3bbca27953758aa54be882447577a0.1530565933.git.yann.morin.1998@free.fr>
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
index 2ff6c94e85..8ff84df715 100644
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
