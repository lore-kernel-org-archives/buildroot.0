From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:27:03 +0200
Subject: [Buildroot] [git commit] package/mraa: bump to version 2.1.0
Message-ID: <20200610212619.7FF40800B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52969c0950b7df5eccf389b20f82067071a1ae96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change the upstream URL as the project is now under Eclipse umbrella.

Remove obsolete options like IPK nad RPM and disable JSONPLAT option
that is enabled by default but requires c-json package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mraa/mraa.hash | 4 ++--
 package/mraa/mraa.mk   | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/mraa/mraa.hash b/package/mraa/mraa.hash
index f2eb73ca74..f29a5ce838 100644
--- a/package/mraa/mraa.hash
+++ b/package/mraa/mraa.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4501e6936afb426c75b7d406c1a7a27b514297f640e887de4d88a2d9687f37b  mraa-0.9.1.tar.gz
-sha256  04f8503394c6d01c86538a693f6990fc1debd94119954ff4eae4407fe7c60a8e  COPYING
+sha256  5351ce9eb654014d8ea7f43bdb2d17e6d1955536938a2ea0d467f4008e614345  mraa-2.1.0.tar.gz
+sha256  fac52622ed3badd86b34857b21777ab90296d6ccbc2ac0fd457c09fdeefa9ef1  COPYING
diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
index 5077859fa5..23413de08e 100644
--- a/package/mraa/mraa.mk
+++ b/package/mraa/mraa.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MRAA_VERSION = 0.9.1
-MRAA_SITE = $(call github,intel-iot-devkit,mraa,v$(MRAA_VERSION))
+MRAA_VERSION = 2.1.0
+MRAA_SITE = $(call github,eclipse,mraa,v$(MRAA_VERSION))
 MRAA_LICENSE = MIT
 MRAA_LICENSE_FILES = COPYING
 MRAA_INSTALL_STAGING = YES
@@ -17,8 +17,7 @@ MRAA_CONF_OPTS += \
 	-DBUILDSWIG=OFF \
 	-DUSBPLAT=OFF \
 	-DFTDI4222=OFF \
-	-DIPK=OFF \
-	-DRPM=OFF \
+	-DJSONPLAT=OFF \
 	-DENABLEEXAMPLES=OFF \
 	-DBUILDTESTS=OFF
 
