From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:13:15 +0200
Subject: [Buildroot] [git commit] libpng: add explicit dependencies for host
	variant
Message-ID: <20160703071557.CA6238180E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0871a4a3001aa8ebb8ade7833d597c5596d612f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 5f469af..0dfc535 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -12,6 +12,7 @@ LIBPNG_LICENSE = libpng license
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
+HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 LIBPNG_CONF_OPTS = $(if $(BR2_ARM_CPU_HAS_NEON),--enable-arm-neon=yes,--enable-arm-neon=no)
 
