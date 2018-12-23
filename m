From: Carlos Santos <casantos@datacom.com.br>
Date: Sun, 23 Dec 2018 15:19:50 -0200
Subject: [Buildroot] [PATCH v3 3/3] package/mpv: selec host-waf
In-Reply-To: <20181223171950.3979-1-casantos@datacom.com.br>
References: <20181223171950.3979-1-casantos@datacom.com.br>
Message-ID: <20181223171950.3979-3-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's required, since MPV_NEEDS_EXTERNAL_WAF is set to YES in mpv.mk.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/mpv/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 69810038f1..ed9662759d 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_MPV
 	select BR2_PACKAGE_XLIB_LIBXINERAMA if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_HOST_WAF
 	help
 	  mpv is a fork of mplayer2 and MPlayer. It shares some features
 	  with the former projects while introducing many more.
-- 
2.20.1
