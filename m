From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 28 Jun 2021 06:01:25 +0000
Subject: [Buildroot] [PATCH 1/1] package/flac: enable building of libFLAC++
Message-ID: <20210628060125.73642-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Besides libFLAC, also build libFLAC++ when C++ support is enabled.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/flac/flac.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 880c176f6e..9aa00b7ffd 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -17,7 +17,7 @@ FLAC_CPE_ID_VENDOR = flac_project
 FLAC_AUTORECONF = YES
 
 FLAC_CONF_OPTS = \
-	--disable-cpplibs \
+	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
 	--disable-xmms-plugin \
 	--disable-altivec
 
-- 
2.32.0
