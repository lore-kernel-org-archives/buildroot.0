From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Dec 2016 12:58:40 -0300
Subject: [Buildroot] [PATCH] zsh: bump to version 5.3
Message-ID: <1481558320-31492-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0001-configure-use-user-set-pcre-config.patch  | 33 ----------------------
 package/zsh/zsh.hash                               |  4 +--
 package/zsh/zsh.mk                                 |  4 +--
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 package/zsh/0001-configure-use-user-set-pcre-config.patch

diff --git a/package/zsh/0001-configure-use-user-set-pcre-config.patch b/package/zsh/0001-configure-use-user-set-pcre-config.patch
deleted file mode 100644
index d4cf59b..0000000
--- a/package/zsh/0001-configure-use-user-set-pcre-config.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 3 Mar 2016 23:14:39 +0200
-Subject: [PATCH] configure: use user set pcre-config
-
-Setting a non default configuration script location is common practice when
-cross compiling, since the target library might need different flags. zsh
-configure scripts allows the user to set pcre-config location but doesn't
-actually use it. Fix this.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: sent upstream
-(http://www.zsh.org/mla/workers/2016/msg00619.html)
-
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c3bd713c126a..9947b16066b6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -925,7 +925,7 @@ fi
- if test x$enable_pcre = xyes; then
- dnl pcre-config should probably be employed here
- dnl AC_SEARCH_LIBS(pcre_compile, pcre)
--  LIBS="`pcre-config --libs` $LIBS"
-+  LIBS="`$ac_cv_prog_PCRECONF --libs` $LIBS"
- fi
- 
- dnl ---------------------
--- 
-2.7.0
-
diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 6793162..0eeebd4 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,4 +1,4 @@
 # From http://www.zsh.org/pub/MD5SUM
-md5	afe96fde08b70e23c1cab1ca7a68fb34	zsh-5.2.tar.xz
+md5	c5ba34e68fcf62a2e78adc56bf3d328a	zsh-5.3.tar.xz
 # Calculated based on the hash above
-sha256	f17916320ffaa844bbd7ce48ceeb5945fc5f3eff64b149b4229bbfbdf3795a9d	zsh-5.2.tar.xz
+sha256	76f82cfd5ce373cf799a03b6f395283f128430db49202e3e3f512fb5a19d6f8a	zsh-5.3.tar.xz
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index aa4029f..9d11b97 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.2
+ZSH_VERSION = 5.3
 ZSH_SITE = http://www.zsh.org/pub
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
 ZSH_CONF_OPTS = --bindir=/bin
-# Patching configure.ac
-ZSH_AUTORECONF = YES
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
 
-- 
2.7.3
