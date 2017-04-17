From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Apr 2017 16:06:41 +0200
Subject: [Buildroot] [PATCH] package/kodi: re-install prompt for optical
	drives
Message-ID: <20170417140641.24527-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 81c438aa (package/kodi: Rework audio encoder support), the prompt for
the optical drive support was dropped, on the assumption that such
support was only needed when an audio encoder was enabled.

However, support for optical drives is also required when, surprisingly,
one wants to read a DVD (and probably a BD as well, but this was not
tested by lack of hardware).

Re-instate the prompt, so one can enable optical drive support even when
no audio encoder enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/kodi/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f2a3e2e032..b993ac94a5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -253,7 +253,9 @@ config BR2_PACKAGE_KODI_UPNP
 	  Enable UPnP support
 
 config BR2_PACKAGE_KODI_OPTICALDRIVE
-	bool
+	bool "optical drives"
+	help
+	  Add support for optical drives, to read e.g. DVDs...
 
 menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-modplug/Config.in"
-- 
2.11.0
