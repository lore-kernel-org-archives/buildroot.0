From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 19:10:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/rdesktop: security bump to version
 1.8.6
Message-ID: <20200229181008.3338093-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2019-15682: RDesktop version 1.8.4 contains multiple
  out-of-bound access read vulnerabilities in its code, which results in
  a denial of service (DoS) condition. This attack appear to be
  exploitable via network connectivity. These issues have been fixed in
  version 1.8.5
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rdesktop/rdesktop.hash | 4 ++--
 package/rdesktop/rdesktop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rdesktop/rdesktop.hash b/package/rdesktop/rdesktop.hash
index a43fab76fa..d42ab59be1 100644
--- a/package/rdesktop/rdesktop.hash
+++ b/package/rdesktop/rdesktop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	516f04df92f16eba04c96bbf9aeb05b9da686689c2bb5c107e0941583e09f933	rdesktop-1.8.4.tar.gz
-sha256	fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7	COPYING
+sha256  ffb9f8e2f0b7a06e383e550698bdc9734ae33eb3ec971b0a094078434a4bba6d  rdesktop-1.8.6.tar.gz
+sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index d97422cf13..491fd60407 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDESKTOP_VERSION = 1.8.4
+RDESKTOP_VERSION = 1.8.6
 RDESKTOP_SITE = $(call github,rdesktop,rdesktop,v$(RDESKTOP_VERSION))
 RDESKTOP_DEPENDENCIES = host-pkgconf openssl xlib_libX11 xlib_libXt \
 	$(if $(BR2_PACKAGE_ALSA_LIB_PCM),alsa-lib) \
-- 
2.25.0
