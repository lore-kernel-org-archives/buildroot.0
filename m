From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 21:34:44 +0100
Subject: [Buildroot] [git commit] gst1-plugins-base: alsa now needs seq
Message-ID: <20160326203451.C37458183A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b59d9324a1f1d0030331a64ab24af98f0bd84e06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A seq (midi) source has been added to gst-plugins-base 1.8.x hence we
need to account for it, so select BR2_PACKAGE_ALSA_LIB_SEQ. Fixes:
http://autobuild.buildroot.net/results/474/474e4b9bc3a44224302d0576cf1c0de7ce709f1a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-base/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 22541e1..897c1d1 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -111,6 +111,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_ALSA_LIB_PCM
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 	help
 	  ALSA plugin library
 
