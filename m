From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:55 -0300
Subject: [Buildroot] [PATCH 27/53] libedit: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-27-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libedit/libedit.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

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
-- 
1.8.5.5
