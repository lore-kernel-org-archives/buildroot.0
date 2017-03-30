From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:40 +0530
Subject: [Buildroot] [PATCH 11/21] package: use SPDX short identifier for
	BSD-4c
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-12-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for BSD-4c is BSD-4-Clause.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/BSD-4c/BSD-4-Clause/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/file/file.mk                     | 2 +-
 package/flite/flite.mk                   | 2 +-
 package/heirloom-mailx/heirloom-mailx.mk | 2 +-
 package/iputils/iputils.mk               | 2 +-
 package/ngrep/ngrep.mk                   | 2 +-
 package/portmap/portmap.mk               | 2 +-
 package/pppd/pppd.mk                     | 2 +-
 package/python-xlwt/python-xlwt.mk       | 2 +-
 package/radvd/radvd.mk                   | 2 +-
 package/slirp/slirp.mk                   | 2 +-
 package/util-linux/util-linux.mk         | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index 00fdcce..1cd09c5 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -10,7 +10,7 @@ FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
 FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
-FILE_LICENSE = BSD-2-Clause, BSD-4c (one file), BSD-3-Clause (one file)
+FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
 
 $(eval $(autotools-package))
diff --git a/package/flite/flite.mk b/package/flite/flite.mk
index 611e334..72376e5 100644
--- a/package/flite/flite.mk
+++ b/package/flite/flite.mk
@@ -24,7 +24,7 @@ FLITE_SITE = http://www.speech.cs.cmu.edu/flite/packed/flite-$(FLITE_VERSION)
 # build in flite-1.4-release/
 FLITE_STRIP_COMPONENTS = 0
 FLITE_SUBDIR = flite-$(FLITE_VERSION)-release
-FLITE_LICENSE = BSD-4c
+FLITE_LICENSE = BSD-4-Clause
 FLITE_LICENSE_FILES = $(FLITE_SUBDIR)/COPYING
 
 FLITE_INSTALL_STAGING = YES
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index 044cd8c..f92203e 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -7,7 +7,7 @@
 HEIRLOOM_MAILX_VERSION = 12.5
 HEIRLOOM_MAILX_SOURCE = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
 HEIRLOOM_MAILX_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/heirloom-mailx
-HEIRLOOM_MAILX_LICENSE = BSD-4c, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPLv1.1 (nss)
+HEIRLOOM_MAILX_LICENSE = BSD-4-Clause, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPLv1.1 (nss)
 HEIRLOOM_MAILX_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index b5f0f26..a3ab836 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -13,7 +13,7 @@
 
 IPUTILS_VERSION = 55828d1fef3fed7f07abcbf7be9282a9662e78c7
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
-IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause, BSD-4c
+IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause, BSD-4-Clause
 # Only includes a license file for BSD
 IPUTILS_LICENSE_FILES = ninfod/COPYING
 
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index 8daaf2d..f6238e6 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -7,7 +7,7 @@
 NGREP_VERSION = 1.45
 NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
 NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSION)
-NGREP_LICENSE = BSD-4c-like
+NGREP_LICENSE = BSD-4-Clause-like
 NGREP_LICENSE_FILES = LICENSE.txt
 NGREP_INSTALL_STAGING = YES
 
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 5caf54c..c3e319b 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -7,7 +7,7 @@
 PORTMAP_VERSION = 6.0
 PORTMAP_SOURCE = portmap-$(PORTMAP_VERSION).tgz
 PORTMAP_SITE = http://neil.brown.name/portmap
-PORTMAP_LICENSE = BSD-4c (portmap.c) SunRPC License (portmap.c from_local.c)
+PORTMAP_LICENSE = BSD-4-Clause (portmap.c) SunRPC License (portmap.c from_local.c)
 PORTMAP_LICENSE_FILES = portmap.c from_local.c
 PORTMAP_SBINS = portmap pmap_dump pmap_set
 
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index f5fb663..6139c5b 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -7,7 +7,7 @@
 PPPD_VERSION = 2.4.7
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = https://download.samba.org/pub/ppp
-PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4c, BSD-3-Clause, GPL-2.0+
+PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
 PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
diff --git a/package/python-xlwt/python-xlwt.mk b/package/python-xlwt/python-xlwt.mk
index 0438fc8..f8a298a 100644
--- a/package/python-xlwt/python-xlwt.mk
+++ b/package/python-xlwt/python-xlwt.mk
@@ -8,7 +8,7 @@ PYTHON_XLWT_VERSION = 1.2.0
 PYTHON_XLWT_SOURCE = xlwt-$(PYTHON_XLWT_VERSION).tar.gz
 PYTHON_XLWT_SITE = https://pypi.python.org/packages/5b/8d/22b9ec552a1d7865de39f54bd15f9db09c72a6bf8ab77b11dcce4ae336bb
 PYTHON_XLWT_SETUP_TYPE = setuptools
-PYTHON_XLWT_LICENSE = BSD-3-Clause, BSD-4c
+PYTHON_XLWT_LICENSE = BSD-3-Clause, BSD-4-Clause
 PYTHON_XLWT_LICENSE_FILES = docs/licenses.rst
 
 $(eval $(python-package))
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 8b6e5b2..64f755d 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -11,7 +11,7 @@ RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
 RADVD_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 # For 0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch
 RADVD_AUTORECONF = YES
-RADVD_LICENSE = BSD-4c-like
+RADVD_LICENSE = BSD-4-Clause-like
 RADVD_LICENSE_FILES = COPYRIGHT
 
 define RADVD_INSTALL_INIT_SYSV
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index dce21ff..7cfead6 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -9,7 +9,7 @@
 # of today)
 SLIRP_VERSION = 8c2da74c1385242f20799fec8c04f8378edc6550
 SLIRP_SITE = git://anongit.freedesktop.org/spice/slirp
-SLIRP_LICENSE = BSD-4c, BSD-2-Clause
+SLIRP_LICENSE = BSD-4-Clause, BSD-2-Clause
 # Note: The license file 'COPYRIGHT' is missing from the sources,
 # although some files refer to it.
 SLIRP_INSTALL_STAGING = YES
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b9c4bb0..70f88a1 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -14,7 +14,7 @@ UTIL_LINUX_AUTORECONF = YES
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
-UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4c, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid)
+UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid)
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
-- 
2.6.2
