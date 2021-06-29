From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 22:22:15 +0200
Subject: [Buildroot] [git commit] package/flac: enable building of libFLAC++
Message-ID: <20210629194958.9F6618E582@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4937dda8935b671b6f2a9f42e1ebea9912c67351
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Besides libFLAC, also build libFLAC++ when C++ support is enabled.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
