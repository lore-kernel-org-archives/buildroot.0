From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:11:38 +0200
Subject: [Buildroot] [PATCH 04/50] package/busybox: invert dependency with
 vim
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <5868424f876dd063a844edbeaa4b74bc9c9c7bce.1530565933.git.yann.morin.1998@free.fr>
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
index a510bf564b..eb3c848bac 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_VIM),vim) \
 	$(if $(BR2_PACKAGE_WGET),wget) \
 	$(if $(BR2_PACKAGE_WHOIS),whois)
 
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 5ee889882a..bd4fd489c6 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -6,10 +6,7 @@
 
 VIM_VERSION = v8.0.0329
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
