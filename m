From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:55:56 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/rdesktop:
 security bump to version 1.8.6
Message-ID: <20200314174333.DA0F88393E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22675fad184a78011cc405abe0e7fa84eb4a8c5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Fix CVE-2019-15682: RDesktop version 1.8.4 contains multiple
  out-of-bound access read vulnerabilities in its code, which results in
  a denial of service (DoS) condition. This attack appear to be
  exploitable via network connectivity. These issues have been fixed in
  version 1.8.5
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ffb50125b091a8a86985df117b71942b8a7a0484)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
