From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 21:51:09 +0200
Subject: [Buildroot] [git commit] glibc: move version handling to Config.in
Message-ID: <20140601200641.04F529CE46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=990a46fdec6a6b7f6fc342371a09f0a7f846647b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like we do elsewhere. No functional change, but nicer and easier to keep in
sync.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in |    7 +++++++
 package/glibc/glibc.mk  |    1 +
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index d9b6acc..c2d6231 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -32,3 +32,10 @@ config BR2_GLIBC_VERSION_2_19
 endchoice
 
 endif
+
+config BR2_GLIBC_VERSION_STRING
+	string
+	default "2.18-svnr23787" if BR2_EGLIBC_VERSION_2_18
+	default "2.19-svnr25243" if BR2_EGLIBC_VERSION_2_19
+	default "2.18" if BR2_GLIBC_VERSION_2_18
+	default "2.19" if BR2_GLIBC_VERSION_2_19
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f841fd0..d465665 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -16,6 +16,7 @@ GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
 GLIBC_SRC_SUBDIR = .
 endif
 
+GLIBC_VERSION = $(call qstrip,$(BR2_GLIBC_VERSION_STRING))
 GLIBC_LICENSE = GPLv2+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
 GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
 
