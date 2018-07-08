From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:45:29 +0200
Subject: [Buildroot] [PATCH 04/50 v2] package/busybox: invert dependency
 with vim
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <b6595f1d1356712c722a2526cb62ebef35bc83bb.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/vim/vim.mk         | 5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index e5de1b7284..c42c4a470a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_VIM),vim) \
 	$(if $(BR2_PACKAGE_WGET),wget) \
 	$(if $(BR2_PACKAGE_WHOIS),whois)
 
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 0c02ead7b5..dbf71c573f 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -6,10 +6,7 @@
 
 VIM_VERSION = v8.1.0133
 VIM_SITE = $(call github,vim,vim,$(VIM_VERSION))
-# Win over busybox vi since vim is more feature-rich
-VIM_DEPENDENCIES = \
-	ncurses $(TARGET_NLS_DEPENDENCIES) \
-	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
+VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
 VIM_CONF_ENV = \
 	vim_cv_toupper_broken=no \
-- 
2.14.1
