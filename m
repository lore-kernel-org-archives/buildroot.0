From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 May 2014 13:40:03 +0200
Subject: [Buildroot] [PATCH v7 28/31] xbmc: add nasm/yasm dependency
In-Reply-To: <1400326806-16428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400326806-16428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1400326806-16428-29-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index b93ed2f..f564466 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -18,6 +18,8 @@ XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
+XBMC_DEPENDENCIES += $(if $(BR2_i386),host-nasm) $(if $(BR2_x86_64),host-yasm)
+
 XBMC_CONF_ENV = \
 	PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)" \
 	PYTHON_LDFLAGS="-lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm" \
-- 
1.7.10.4
