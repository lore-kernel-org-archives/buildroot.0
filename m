From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Feb 2012 09:18:17 +0100
Subject: [Buildroot] [git commit] libevas: disable sse3 optimizations for
	host builds
Message-ID: <20120201082049.D6ADC9058E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a273b6129efaf07e01b9fc4a70d7730481c68d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's not really any advantage to adding it, and it depends on
immintrin.h which was added in gcc 4.4, so it breaks with older
host compilers.

For details, see:

http://trac.enlightenment.org/e/ticket/942

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/libevas.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index acb2f4b..e34967b 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -13,7 +13,7 @@ LIBEVAS_DEPENDENCIES = host-pkg-config zlib libeina freetype
 
 HOST_LIBEVAS_DEPENDENCIES = host-pkg-config host-zlib host-libeina \
 				host-freetype host-libpng
-HOST_LIBEVAS_CONF_OPT += --enable-image-loader-png
+HOST_LIBEVAS_CONF_OPT += --enable-image-loader-png --disable-cpu-sse3
 
 # rendering options
 ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SAMPLE),y)
