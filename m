From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 13 Feb 2017 17:13:18 +0100
Subject: [Buildroot] [PATCH 1/2] GNURadio: gr-audio: select alsa-lib if no
	backend selected
Message-ID: <20170213161319.25131-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

gr-audio may be built with alsa-lib or portaudio support. To simplify
dependencies if no backend is selected, then alsa-lib is the default choice.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 8301afe..0291d70 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -32,7 +32,7 @@ if BR2_PACKAGE_GNURADIO
 
 config BR2_PACKAGE_GNURADIO_AUDIO
 	bool "gr-audio"
-	depends on BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO
+	select BR2_PACKAGE_ALSA_LIB if !BR2_PACKAGE_PORTAUDIO
 	help
 	  Add audio source/sink to GNU Radio
 
-- 
2.10.2
