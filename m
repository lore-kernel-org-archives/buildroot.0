From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Sep 2019 23:05:56 +0200
Subject: [Buildroot] [git commit] package/bash-completion: bump to version
 2.9
Message-ID: <20190920210309.226C08ED47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=857c51b0e408eb7abd8f80398e80ffae4a76f393
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (already on version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Makefile.am-Use-install-data-hook-not-in.patch | 35 ----------------------
 package/bash-completion/bash-completion.hash       |  2 +-
 package/bash-completion/bash-completion.mk         |  5 +---
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/bash-completion/0001-completions-Makefile.am-Use-install-data-hook-not-in.patch b/package/bash-completion/0001-completions-Makefile.am-Use-install-data-hook-not-in.patch
deleted file mode 100644
index 4d01eb6eea..0000000000
--- a/package/bash-completion/0001-completions-Makefile.am-Use-install-data-hook-not-in.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f9a1dfe7a3d0f35474b3f4ded05e3d97be5017bf Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ville=20Skytt=C3=A4?= <ville.skytta@iki.fi>
-Date: Fri, 25 May 2018 17:38:59 +0200
-Subject: [PATCH] completions/Makefile.am: Use install-data-hook, not
- install-data-local
-
--hook is run after the main rule, while -local might end up before.
-https://www.gnu.org/software/automake/manual/html_node/Extending.html#index-hook-targets
-
-Closes #212
-
-[backported from ee6b37ad7ff5b309cbb9b886a871252abd9398fa]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- completions/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/completions/Makefile.am b/completions/Makefile.am
-index e442a9e..5c49796 100644
---- a/completions/Makefile.am
-+++ b/completions/Makefile.am
-@@ -993,8 +993,8 @@ symlinks: $(targetdir) $(DATA)
- all-local: targetdir = .
- all-local: symlinks
- 
--install-data-local: targetdir = $(DESTDIR)$(bashcompdir)
--install-data-local: symlinks
-+install-data-hook: targetdir = $(DESTDIR)$(bashcompdir)
-+install-data-hook: symlinks
- 
- check-local:
- 	ret=0
--- 
-2.7.4
-
diff --git a/package/bash-completion/bash-completion.hash b/package/bash-completion/bash-completion.hash
index 2c4cf67578..a286bd9bab 100644
--- a/package/bash-completion/bash-completion.hash
+++ b/package/bash-completion/bash-completion.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c01f5570f5698a0dda8dc9cfb2a83744daa1ec54758373a6e349bd903375f54d  bash-completion-2.8.tar.xz
+sha256 d48fe378e731062f479c5f8802ffa9d3c40a275a19e6e0f6f6cc4b90fa12b2f5  bash-completion-2.9.tar.xz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/bash-completion/bash-completion.mk b/package/bash-completion/bash-completion.mk
index c43fb15cd0..2ec8d72485 100644
--- a/package/bash-completion/bash-completion.mk
+++ b/package/bash-completion/bash-completion.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-BASH_COMPLETION_VERSION = 2.8
+BASH_COMPLETION_VERSION = 2.9
 BASH_COMPLETION_SITE = https://github.com/scop/bash-completion/releases/download/$(BASH_COMPLETION_VERSION)
 BASH_COMPLETION_SOURCE = bash-completion-$(BASH_COMPLETION_VERSION).tar.xz
 BASH_COMPLETION_LICENSE = GPL-2.0
 BASH_COMPLETION_LICENSE_FILES = COPYING
 
-# 0001-completions-Makefile.am-Use-install-data-hook-not-in.patch
-BASH_COMPLETION_AUTORECONF = YES
-
 # Install bash-completion.pc file
 BASH_COMPLETION_INSTALL_STAGING = YES
 
