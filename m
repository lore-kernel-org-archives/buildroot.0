From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Jan 2013 00:36:12 +0100
Subject: [Buildroot] [git commit] wavpack: fix the iconv breakage ghost
Message-ID: <20130108233623.02D2C9A6E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d5f83ffafb1ad3e9a9df975fb581931f2fa9606
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix missing comma in DEPENDENCIES, causing to pull in libiconv when it
wasn't necessary and causing other packages to go crazy on (e)glibc
toolchains which don't need it with libiconv being present. Fixes:
http://autobuild.buildroot.org/results/e0ce086a33a1db6fee77f43356e4e94ed6941f17

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/wavpack/wavpack.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/wavpack/wavpack.mk b/package/multimedia/wavpack/wavpack.mk
index cd9b4f7..a7c703f 100644
--- a/package/multimedia/wavpack/wavpack.mk
+++ b/package/multimedia/wavpack/wavpack.mk
@@ -10,7 +10,7 @@ WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.bz2
 WAVPACK_INSTALL_STAGING = YES
 # configure not up to date
 WAVPACK_AUTORECONF = YES
-WAVPACK_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),libiconv)
+WAVPACK_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
 WAVPACK_LICENSE = BSD-3c
 WAVPACK_LICENSE_FILES = license.txt
 
