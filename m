From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:30:43 +0100
Subject: [Buildroot] [git commit] ipset: drop obsolete patch
Message-ID: <20170305203055.0B3B7822B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ea735f5a0ec3bbb51e77375f4cecf66eca9c539
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 0552a367dbd ("Remove --{enable, disable}-debug configure flags.")
we do not pass --enable-debug to configure script. The patch to remove -Werror
in this case is thus no longer needed.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...not-pass-Werror-when-enable-debug-is-used.patch | 39 ----------------------
 package/ipset/ipset.mk                             |  2 --
 2 files changed, 41 deletions(-)

diff --git a/package/ipset/0001-Do-not-pass-Werror-when-enable-debug-is-used.patch b/package/ipset/0001-Do-not-pass-Werror-when-enable-debug-is-used.patch
deleted file mode 100644
index c115f63..0000000
--- a/package/ipset/0001-Do-not-pass-Werror-when-enable-debug-is-used.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f31bb2561776ad2ce4b77339da6fbfc9e3b2ffbb Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 26 Oct 2014 14:18:29 +0100
-Subject: [PATCH] Do not pass -Werror when --enable-debug is used
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Make_global.am | 2 +-
- configure.ac   | 1 -
- 2 files changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Make_global.am b/Make_global.am
-index 7953451..25c4d64 100644
---- a/Make_global.am
-+++ b/Make_global.am
-@@ -77,7 +77,7 @@ AM_CPPFLAGS = $(kinclude_CFLAGS) $(all_includes) -I$(top_srcdir)/include \
- AM_CFLAGS = -std=gnu99
- 
- if ENABLE_DEBUG
--AM_CFLAGS += -g -g3 -ggdb -gdwarf-2 -DIPSET_DEBUG -Wall -Werror
-+AM_CFLAGS += -g -g3 -ggdb -gdwarf-2 -DIPSET_DEBUG -Wall
- else
- AM_CFLAGS += -O2 -DNDEBUG
- endif
-diff --git a/configure.ac b/configure.ac
-index 8fdac15..ee3b147 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -345,7 +345,6 @@ AX_CFLAGS_GCC_OPTION(-Waggregate-return)
- AX_CFLAGS_GCC_OPTION(-Wbad-function-cast)
- AX_CFLAGS_GCC_OPTION(-Wcast-align)
- AX_CFLAGS_GCC_OPTION(-Wcast-qual)
--AX_CFLAGS_GCC_OPTION(-Werror)
- AX_CFLAGS_GCC_OPTION(-Wextra)
- AX_CFLAGS_GCC_OPTION(-Wfloat-equal)
- AX_CFLAGS_GCC_OPTION(-Wformat=2)
--- 
-2.0.0
-
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index bb40fee..5d7955f 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -9,8 +9,6 @@ IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
 IPSET_CONF_OPTS = --with-kmod=no
-# For 0001-Do-not-pass-Werror-when-enable-debug-is-used.patch
-IPSET_AUTORECONF = YES
 IPSET_LICENSE = GPLv2
 IPSET_LICENSE_FILES = COPYING
 IPSET_INSTALL_STAGING = YES
