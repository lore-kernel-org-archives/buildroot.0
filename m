From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 May 2014 22:26:09 +0200
Subject: [Buildroot] [PATCH v10 16/29] xbmc - prepare for 13.x-Gotham: Add
	host-nasm dependency
In-Reply-To: <1401049582-2110-1-git-send-email-bernd.kuhls@t-online.de>
References: <1401049582-2110-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1401049582-2110-17-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
checking for nasm... no
configure: error: Could not find a required program. Please see the README for your platform.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    3 +++
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
1.7.10.4
