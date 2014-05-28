From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:26 +0200
Subject: [Buildroot] [PATCH 03/30] xbmc: add host-nasm dependency
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <e00f42bd94002c4b3c9c14e07466b3c19be61325.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Fixes:
checking for nasm... no
configure: error: Could not find a required program. Please see the README for your platform.

This will be needed for 13.0 Gotham.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/xbmc/xbmc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index d8b9508..3522802 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -18,6 +18,9 @@ XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
+# xbmc at i386 depends on nasm
+XBMC_DEPENDENCIES += $(if $(BR2_i386),host-nasm)
+
 XBMC_CONF_ENV = \
 	PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)" \
 	PYTHON_LDFLAGS="-lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm" \
-- 
1.8.3.2
