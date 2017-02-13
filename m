From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 22:39:31 +0100
Subject: [Buildroot] [git commit branch/next] gnuradio: make gr-audio select
	alsa-lib if no backend selected
Message-ID: <20170213214039.B391581F7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e528ed77401f2a62b0284c289deab8a3c1d5d76f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

gr-audio may be built with alsa-lib or portaudio support. To simplify
dependencies if no backend is selected, we automatically select alsa-lib
as the default audio backend if portaudio is not enabled.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
