From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 09:04:28 +0100
Subject: [Buildroot] [git commit] newt: fix weird indentation
Message-ID: <20140329080544.B2B259C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=200e9595c2e47c35c042bb330415dd95382b9182
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/newt/newt.mk |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

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
