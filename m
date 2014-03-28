From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Mar 2014 20:29:19 -0300
Subject: [Buildroot] [PATCH 1/2] newt: fix weird indentation
Message-ID: <1396049360-5683-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/newt/newt.mk | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index b567156..85e75f4 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -4,16 +4,14 @@
 #
 ################################################################################
 
-NEWT_VERSION         = 0.52.17
-NEWT_SITE            = https://fedorahosted.org/releases/n/e/newt/
-NEWT_LICENSE         = GPLv2
-NEWT_LICENSE_FILES   = COPYING
+NEWT_VERSION = 0.52.17
+NEWT_SITE = https://fedorahosted.org/releases/n/e/newt/
 NEWT_INSTALL_STAGING = YES
-
-NEWT_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) slang popt
-
+NEWT_DEPENDENCIES = popt slang \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 NEWT_CONF_OPT = --without-python --without-tcl
-
 NEWT_MAKE = $(MAKE1)
+NEWT_LICENSE = GPLv2
+NEWT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.3.2
