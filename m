From: Simon Dawson <spdawson@gmail.com>
Date: Mon,  2 Jun 2014 16:55:59 +0100
Subject: [Buildroot] [PATCH] replace github with GitHub
Message-ID: <1401724559-3629-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The correct capitalisation pattern is "GitHub"; fix manual and makefile
commentary.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 2 +-
 docs/manual/adding-packages-tips.txt    | 6 +++---
 package/e2tools/e2tools.mk              | 2 +-
 package/libsha1/libsha1.mk              | 2 +-
 package/pkg-download.mk                 | 2 +-
 package/smack/smack.mk                  | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index d3fa45b..67a7453 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -228,7 +228,7 @@ information is (assuming the package name is +libfoo+) :
   types for retrieving package tarballs. Git, Subversion, Mercurial,
   and Bazaar are supported URL types for retrieving packages directly
   from source code management systems. There is a helper function to make
-  it easier to download source tarballs from github (refer to
+  it easier to download source tarballs from GitHub (refer to
   xref:github-download-url[] for details). A filesystem path may be used
   to specify either a tarball or a directory containing the package
   source code. See +LIBFOO_SITE_METHOD+ below for more details on how
diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 9266af6..0d4fcb0 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -34,11 +34,11 @@ using the following rules:
 
 
 [[github-download-url]]
-==== How to add a package from github
+==== How to add a package from GitHub
 
-Packages on github often don't have a download area with release tarballs.
+Packages on GitHub often don't have a download area with release tarballs.
 However, it is possible to download tarballs directly from the repository
-on github. As github is known to have changed download mechanisms in the
+on GitHub. As GitHub is known to have changed download mechanisms in the
 past, the 'github' helper function should be used as shown below.
 
 ------------------------
diff --git a/package/e2tools/e2tools.mk b/package/e2tools/e2tools.mk
index 97afcc0..789519f 100644
--- a/package/e2tools/e2tools.mk
+++ b/package/e2tools/e2tools.mk
@@ -7,7 +7,7 @@
 E2TOOLS_VERSION = 3158ef18a903ca4a98b8fa220c9fc5c133d8bdf6
 E2TOOLS_SITE = $(call github,ndim,e2tools,$(E2TOOLS_VERSION))
 
-# Source coming from github, no configure included.
+# Source coming from GitHub, no configure included.
 E2TOOLS_AUTORECONF = YES
 E2TOOLS_LICENSE = GPLv2
 E2TOOLS_LICENSE_FILES = COPYING
diff --git a/package/libsha1/libsha1.mk b/package/libsha1/libsha1.mk
index 2fd7705..647f986 100644
--- a/package/libsha1/libsha1.mk
+++ b/package/libsha1/libsha1.mk
@@ -11,7 +11,7 @@ LIBSHA1_LICENSE_FILES = COPYING
 
 LIBSHA1_INSTALL_STAGING = YES
 
-# We're getting the source code from Github, so there is no generated
+# We're getting the source code from GitHub, so there is no generated
 # configure script in the tarball.
 LIBSHA1_AUTORECONF = YES
 
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 192b9e0..4cfb913 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -55,7 +55,7 @@ notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(c
 # default domainseparator is /, specify alternative value as first argument
 domainseparator=$(if $(1),$(1),/)
 
-# github(user,package,version): returns site of github repository
+# github(user,package,version): returns site of GitHub repository
 github = https://github.com/$(1)/$(2)/archive/$(3)
 
 ################################################################################
diff --git a/package/smack/smack.mk b/package/smack/smack.mk
index af6e81c..7e0a362 100644
--- a/package/smack/smack.mk
+++ b/package/smack/smack.mk
@@ -11,7 +11,7 @@ SMACK_LICENSE_FILES = COPYING
 SMACK_INSTALL_STAGING = YES
 SMACK_DEPENDENCIES = host-pkgconf
 
-# Sources from github, no configure script included.
+# Sources from GitHub, no configure script included.
 SMACK_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.9.1
