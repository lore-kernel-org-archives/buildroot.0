From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Dec 2017 15:36:35 +0100
Subject: [Buildroot] [PATCH v2] package/mfgtools: bump to 0.02
Message-ID: <20171225143635.12778-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump mfgtools to include the fix [1] for the C++ build issue reported
by the autobuilders.

This bump include only 4 small commit fixing memory leak and this
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
---
This patch should be backported to stable branches 2017.02 and 2017.08.

v2: update url (Baruch)
    add README.txt to MFGTOOLS_LICENSE_FILES (Baruch)
---
 package/mfgtools/mfgtools.hash | 4 +++-
 package/mfgtools/mfgtools.mk   | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/mfgtools/mfgtools.hash b/package/mfgtools/mfgtools.hash
index e73a7fa13a..4932a80dba 100644
--- a/package/mfgtools/mfgtools.hash
+++ b/package/mfgtools/mfgtools.hash
@@ -1,2 +1,4 @@
 # locally computed
-sha256  6ce93a33c269282df305cf7e517d2d14fde78203537d8ea75b064966afe48464  mfgtools-b219fc219a35c365010897ed093c40750f8cdac6.tar.gz
+sha256  055d71227d18883d6e8bc9e854c076015f9a7749820a94272e19071bf0b25c89  mfgtools-v0.02.tar.gz
+sha256  2655559a6bb1179eae514f5c7166f4ede4f2453efa9cf4dc3c045cab5d57dede  LICENSE
+sha256  0963b6e5086bf454265b0f57821a02b681d1211e40ad74c310231cb4d94815c9  README.txt
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
index 00a011af85..e4663a8af9 100644
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
-- 
2.14.3
