From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:35:49 +0200
Subject: [Buildroot] [git commit] libedit: add license information
Message-ID: <20140701224921.E03D69D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bbecb1bbf6402e639f2e104a41421c6e8835665
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libedit/libedit.mk |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 0ff418a..927626f 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-LIBEDIT_VERSION         = 20130712-3.1
-LIBEDIT_SITE            = http://www.thrysoee.dk/editline/
+LIBEDIT_VERSION = 20130712-3.1
+LIBEDIT_SITE = http://www.thrysoee.dk/editline/
 LIBEDIT_INSTALL_STAGING = YES
-LIBEDIT_DEPENDENCIES    = ncurses
+LIBEDIT_DEPENDENCIES = ncurses
+LIBEDIT_LICENSE = BSD-3c
+LIBEDIT_LICENSE_FILES = COPYING
 
 # We're patching configure.ac
-LIBEDIT_AUTORECONF      = YES
+LIBEDIT_AUTORECONF = YES
 
 # Doesn't really support !wchar, but support is disabled otherwise
 LIBEDIT_CONF_OPT += --enable-widec
@@ -19,7 +21,7 @@ LIBEDIT_CONF_OPT += --enable-widec
 # with __progname; otherwise, some features are disabled, as if libbsd was
 # missing entirely.
 ifeq ($(BR2_PACKAGE_LIBBSD),y)
-LIBEDIT_DEPENDENCIES   += libbsd
+LIBEDIT_DEPENDENCIES += libbsd
 endif
 
 $(eval $(autotools-package))
