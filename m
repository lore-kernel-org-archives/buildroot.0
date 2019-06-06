From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 09:37:05 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/pcsc-lite: fix
 license
Message-ID: <20190606073742.82C9083C44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b5eb7219031eaf657f27774fc81923c85c326db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

pcsc-lite is not only licensed under BSD-3-Clause, so retrieve licenses
from COPYING (BSD-2-Clause, GPL-3.0+, MIT, ISC) and add GPL-3.0.txt to
license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0ccdedd030f769ddaeb4484dc071a8c644622a3e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
