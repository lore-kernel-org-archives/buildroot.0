From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Jul 2021 22:06:34 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/flac: enable
 building of libFLAC++
Message-ID: <20210712193646.981C392076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac91b86c79a4b939558d054d6afe7739632535d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Besides libFLAC, also build libFLAC++ when C++ support is enabled.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4937dda8935b671b6f2a9f42e1ebea9912c67351)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
