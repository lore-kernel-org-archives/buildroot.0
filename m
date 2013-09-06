From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 6 Sep 2013 11:06:00 -0500
Subject: [Buildroot] [PATCH 1/1] libcap-ng: bump revision to 0.7.3
Message-ID: <1378483560-6490-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also cleaned the package makefile up by removing explicitly naming
the source along with moving the configure of the package down below
the standard package declarations.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/libcap-ng/libcap-ng.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 97eb219..53c7ee7 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.6.6
+LIBCAP_NG_VERSION = 0.7.3
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng/
-LIBCAP_NG_SOURCE = libcap-ng-$(LIBCAP_NG_VERSION).tar.gz
+LIBCAP_NG_LICENSE = GPLv2+ LGPLv2.1+
+LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 LIBCAP_NG_INSTALL_STAGING = YES
+
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPT = --without-python
-LIBCAP_NG_LICENSE = GPLv2+ LGPLv2.1+
-LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 
 $(eval $(autotools-package))
-- 
1.7.1
