From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 18 May 2019 23:43:48 +0200
Subject: [Buildroot] [PATCH 2/3] package/pcsc-lite: fix license
In-Reply-To: <20190518214349.5979-1-fontaine.fabrice@gmail.com>
References: <20190518214349.5979-1-fontaine.fabrice@gmail.com>
Message-ID: <20190518214349.5979-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pcsc-lite is not only licensed under BSD-3-Clause, so retrieve licenses
from COPYING (BSD-2-Clause, GPL-3.0+, MIT, ISC) and add GPL-3.0.txt to
license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcsc-lite/pcsc-lite.hash | 1 +
 package/pcsc-lite/pcsc-lite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index fe5ce94696..3b8cde1617 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256 5a27262586eff39cfd5c19aadc8891dd71c0818d3d629539bd631b958be689c9  pcsc-lite-1.8.23.tar.bz2
 sha256 2ce8f52bc5afa74f223121955e4e6328c432b16044ea535acd550435dda2b5db  COPYING
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 0d55d4b706..5a18d46a71 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -9,8 +9,8 @@ PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf
-PCSC_LITE_LICENSE = BSD-3-Clause
-PCSC_LITE_LICENSE_FILES = COPYING
+PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (demo, spy, tests), ISC (simclist), MIT (sd-daemon)
+PCSC_LITE_LICENSE_FILES = COPYING GPL-3.0.txt
 PCSC_LITE_AUTORECONF = YES
 
 # - libudev and libusb are optional
-- 
2.20.1
