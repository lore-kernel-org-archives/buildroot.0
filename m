From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 17 Jun 2015 21:28:21 +0200
Subject: [Buildroot] [PATCH 1/3] tmux: bump to 2.0
Message-ID: <1434569303-2383-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new location as tmux moved to GitHub.

Remove the patch as it was already merged upstream.
Remove related AUTORECONF as well.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...01-Makefile.am-remove-unsafe-headers-path.patch | 35 ----------------------
 package/tmux/tmux.hash                             |  2 +-
 package/tmux/tmux.mk                               |  7 ++---
 3 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 package/tmux/0001-Makefile.am-remove-unsafe-headers-path.patch

diff --git a/package/tmux/0001-Makefile.am-remove-unsafe-headers-path.patch b/package/tmux/0001-Makefile.am-remove-unsafe-headers-path.patch
deleted file mode 100644
index 4a20945..0000000
--- a/package/tmux/0001-Makefile.am-remove-unsafe-headers-path.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4095ee95141063ff3f91153e84bd029b019b8dad Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Fri, 26 Dec 2014 17:44:15 +0100
-Subject: [PATCH] Makefile.am: remove unsafe headers path
-
-/usr/local/include is probably not needed and it's unsafe for
-cross-compilation.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index a9ad5b9..0109e5d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -38,12 +38,12 @@ else
- CFLAGS += -O2
- endif
- if IS_GCC4
--CPPFLAGS += -iquote. -I/usr/local/include
-+CPPFLAGS += -iquote.
- if IS_DEBUG
- CFLAGS += -Wno-pointer-sign
- endif
- else
--CPPFLAGS += -I. -I- -I/usr/local/include
-+CPPFLAGS += -I. -I-
- endif
- endif
- 
--- 
-1.9.3
-
diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index eb9f4fd..ab7c4d3 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  c5e3b22b901cf109b20dab54a4a651f0471abd1f79f6039d79b250d21c2733f5  tmux-1.9a.tar.gz
+sha256  795f4b4446b0ea968b9201c25e8c1ef8a6ade710ebca4657dd879c35916ad362  tmux-2.0.tar.gz
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 9c8921e..c9abbf7 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,13 +4,10 @@
 #
 ################################################################################
 
-TMUX_VERSION = 1.9a
-TMUX_SITE = http://downloads.sourceforge.net/tmux
+TMUX_VERSION = 2.0
+TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = README
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
-# we patch Makefile.am
-TMUX_AUTORECONF = YES
-
 $(eval $(autotools-package))
-- 
2.1.4
