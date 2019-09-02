From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:17:07 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/libssh2: switch
 site to https://www.libssh2.org/download
Message-ID: <20190902151258.A2F1C8A2E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f75645a5b890a30ac104bafc4393d98f14fa261
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

As spotted by Danomi during review of "libssh2: security bump to version
1.9.0" (https://patchwork.ozlabs.org/patch/1148776), it seems that
the tarball from github and libssh2.org/download are not the same. One
of the difference is that LIBSSH2_VERSION in include/libssh2.h is set to
"1.9.0_DEV" in github tarball whereas it is set to "1.9.0" in
libssh2.org/download.

So switch site to https://www.libssh2.org/download to get "official"
release

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cc3da232e48b811853d64a74b9b538ea30c91918)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-drop-custom-buildconf-script.patch        | 28 ++--------------------
 package/libssh2/libssh2.hash                       |  2 +-
 package/libssh2/libssh2.mk                         |  2 +-
 3 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/package/libssh2/0001-drop-custom-buildconf-script.patch b/package/libssh2/0001-drop-custom-buildconf-script.patch
index a9a98e083c..bf187b26a8 100644
--- a/package/libssh2/0001-drop-custom-buildconf-script.patch
+++ b/package/libssh2/0001-drop-custom-buildconf-script.patch
@@ -29,6 +29,8 @@ Update gitignore accordingly, too.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Cc: Sam Voss <sam.voss@rockwellcollins.com>
+[Fabrice: Remove .gitignore so patch applies on 1.9.0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  .gitignore          |  2 ++
  buildconf           | 24 +++++-------------------
@@ -37,19 +39,6 @@ Cc: Sam Voss <sam.voss@rockwellcollins.com>
  example/Makefile.am |  2 +-
  5 files changed, 9 insertions(+), 23 deletions(-)
 
-diff --git a/.gitignore b/.gitignore
-index 997e51e1..b6d6b5cb 100644
---- a/.gitignore
-+++ b/.gitignore
-@@ -13,6 +13,8 @@ Makefile
- Makefile.in
- aclocal.m4
- autom4te.cache
-+compile
-+test-driver
- config.guess
- config.log
- config.status
 diff --git a/buildconf b/buildconf
 index 558dcb66..728b3397 100755
 --- a/buildconf
@@ -95,19 +84,6 @@ index c6ff7535..6939d0d6 100644
  AM_MAINTAINER_MODE
  m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
  
-diff --git a/example/.gitignore b/example/.gitignore
-index 13448191..cac152b8 100644
---- a/example/.gitignore
-+++ b/example/.gitignore
-@@ -20,8 +20,6 @@ sftp_write_nonblock
- config.h.in
- ssh2_exec
- ssh2_agent
--libssh2_config.h
--libssh2_config.h.in
- stamp-h2
- sftp_append
- sftp_write_sliding
 diff --git a/example/Makefile.am b/example/Makefile.am
 index 5cf5f071..41f65b12 100644
 --- a/example/Makefile.am
diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index 58aba4ad71..8e048ff508 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 db257d41754b16518c3bd0c3b8dd08940ccbee5fc44cef7bfb052d930bcbbda3  libssh2-1.9.0.tar.gz
+sha256 d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd  libssh2-1.9.0.tar.gz
 sha256 e15ed284a15e80115467d6d7f030f0d89d8fabbecd78fb6e0f861f0cfc128fd9  COPYING
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 824e208033..bd8517dac4 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH2_VERSION = 1.9.0
-LIBSSH2_SITE = $(call github,libssh2,libssh2,libssh2-$(LIBSSH2_VERSION))
+LIBSSH2_SITE = https://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
 LIBSSH2_INSTALL_STAGING = YES
