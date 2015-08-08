From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:46 -0000
Subject: [Buildroot] [git commit branch/next] setools: Add missing bison
	dependency
Message-ID: <20150808105636.0BB917FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0daffc0b65aa86d6d5bc6916736e0cffcdf540cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The setools package needs the yacc utility which is part of the bison
package to build.

Fixes http://autobuild.buildroot.net/results/8f9/8f95e83411552397ca29e9aee5c457a1a762b364/

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/setools/setools.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
