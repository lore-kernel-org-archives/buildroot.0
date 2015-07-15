From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 15 Jul 2015 12:31:04 -0500
Subject: [Buildroot] [PATCH] setool: Add missing bison dependency
Message-ID: <1436981464-55916-1-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The setools package needs the yacc utility which is part of the bison
package to build.

Fixes http://autobuild.buildroot.net/results/8f9/8f95e83411552397ca29e9aee5c457a1a762b364/

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 package/setools/setools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 912daf8..a2bfd42 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -7,7 +7,7 @@
 SETOOLS_VERSION = 3.3.8
 SETOOLS_SOURCE = setools-$(SETOOLS_VERSION).tar.bz2
 SETOOLS_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/setools3/files/dists/setools-$(SETOOLS_VERSION)/
-SETOOLS_DEPENDENCIES = libselinux libsepol sqlite libxml2 bzip2
+SETOOLS_DEPENDENCIES = libselinux libsepol sqlite libxml2 bzip2 host-bison
 SETOOLS_INSTALL_STAGING = YES
 SETOOLS_LICENSE = GPLv2+ LGPLv2.1+
 SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
@@ -32,7 +32,7 @@ SETOOLS_CONF_OPTS = \
 	--with-selinux-devel="$(STAGING_DIR)/usr"
 
 HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-sqlite \
-	host-libxml2 host-bzip2
+	host-libxml2 host-bzip2 host-bison
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_SETOOLS_PYTHON_VERSION=$(PYTHON3_VERSION_MAJOR)
-- 
1.9.1
