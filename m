From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Sep 2013 21:30:32 +0200
Subject: [Buildroot] [git commit] libcap-ng: bump revision to 0.7.3
Message-ID: <20130908204534.3897C9B6AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e51b06e95c2355b96893823165985e23f0ecec99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also cleaned the package makefile up by removing explicitly naming
the source along with moving the configure of the package down below
the standard package declarations.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
