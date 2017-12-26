From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Dec 2017 17:39:21 +0100
Subject: [Buildroot] [git commit] package/mfgtools: bump to 0.02
Message-ID: <20171226164129.169A283542@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34c4c0680a6de06e8c11e7361c26c8594315ba36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump mfgtools to include the fix [1] for the C++ build issue reported
by the autobuilders.

This bump include only 4 small commits fixing memory leak and this
build issue.

Remove CPOL.htm (removed upstream) from MFGTOOLS_LICENSE_FILES but CPOL
license is still valid.
Add the README.txt file to MFGTOOLS_LICENSE_FILES since it contains
licensing informations:

Licenses:
- CPOL: MfgToolLib/XmlLite.CPP and XmlLite.h
- BSD: Others.

Add license file hash.

[1] https://github.com/codeauroraforum/mfgtools/commit/b370a43e548440025d274ff2abbb25342bbaa78c

Fixes:
http://autobuild.buildroot.net/results/7c2bbbe13ab315684f3502afd96958a76879b1d5

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mfgtools/Config.in.host | 2 +-
 package/mfgtools/mfgtools.hash  | 4 +++-
 package/mfgtools/mfgtools.mk    | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
index 1cb5a7f..4bbdde3 100644
--- a/package/mfgtools/Config.in.host
+++ b/package/mfgtools/Config.in.host
@@ -11,4 +11,4 @@ config BR2_PACKAGE_HOST_MFGTOOLS
 	  production. The communication is done over USB using the
 	  Freescale UTP protocol.
 
-	  https://github.com/NXPmicro/mfgtools
+	  https://github.com/codeauroraforum/mfgtools
diff --git a/package/mfgtools/mfgtools.hash b/package/mfgtools/mfgtools.hash
index e73a7fa..4932a80 100644
--- a/package/mfgtools/mfgtools.hash
+++ b/package/mfgtools/mfgtools.hash
@@ -1,2 +1,4 @@
 # locally computed
-sha256  6ce93a33c269282df305cf7e517d2d14fde78203537d8ea75b064966afe48464  mfgtools-b219fc219a35c365010897ed093c40750f8cdac6.tar.gz
+sha256  055d71227d18883d6e8bc9e854c076015f9a7749820a94272e19071bf0b25c89  mfgtools-v0.02.tar.gz
+sha256  2655559a6bb1179eae514f5c7166f4ede4f2453efa9cf4dc3c045cab5d57dede  LICENSE
+sha256  0963b6e5086bf454265b0f57821a02b681d1211e40ad74c310231cb4d94815c9  README.txt
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
index 00a011a..e4663a8 100644
--- a/package/mfgtools/mfgtools.mk
+++ b/package/mfgtools/mfgtools.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-MFGTOOLS_VERSION = b219fc219a35c365010897ed093c40750f8cdac6
-MFGTOOLS_SITE = $(call github,NXPmicro,mfgtools,$(MFGTOOLS_VERSION))
+MFGTOOLS_VERSION = v0.02
+MFGTOOLS_SITE = $(call github,codeauroraforum,mfgtools,$(MFGTOOLS_VERSION))
 MFGTOOLS_SUBDIR = MfgToolLib
 MFGTOOLS_LICENSE = BSD-3-Clause or CPOL
-MFGTOOLS_LICENSE_FILES = LICENSE CPOL.htm
+MFGTOOLS_LICENSE_FILES = LICENSE README.txt
 HOST_MFGTOOLS_DEPENDENCIES = host-libusb
 
 HOST_MFGTOOLS_CFLAGS = \
