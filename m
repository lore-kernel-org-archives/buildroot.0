From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun,  7 Apr 2019 18:04:15 +0300
Subject: [Buildroot] [PATCH 1/1] package/vim: move common configure options
 to separate variable
Message-ID: <20190407150415.10759-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move configure options which are used for host and target to separate
variable.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/vim/vim.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index c19d835632..739dde091d 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -20,7 +20,8 @@ VIM_CONF_ENV = \
 	ac_cv_sizeof_int=4 \
 	ac_cv_small_wchar_t=no
 # GUI/X11 headers leak from the host so forcibly disable them
-VIM_CONF_OPTS = --with-tlib=ncurses --enable-gui=no --without-x
+VIM_CONF_OPTS_COMMON = --with-tlib=ncurses --enable-gui=no --without-x
+VIM_CONF_OPTS = $(VIM_CONF_OPTS_COMMON)
 VIM_LICENSE = Charityware
 VIM_LICENSE_FILES = README.txt
 
@@ -80,10 +81,7 @@ VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
 endif
 
 HOST_VIM_DEPENDENCIES = host-ncurses
-HOST_VIM_CONF_OPTS = \
-	--with-tlib=ncurses \
-	--enable-gui=no \
-	--without-x \
+HOST_VIM_CONF_OPTS = $(VIM_CONF_OPTS_COMMON) \
 	--disable-acl \
 	--disable-gpm \
 	--disable-selinux
-- 
2.14.1
