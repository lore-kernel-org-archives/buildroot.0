From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 22 May 2013 17:24:05 -0700
Subject: [Buildroot] [PATCH 3/5] portaudio: needs threads
In-Reply-To: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
References: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1369268647-13128-3-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/ba2/ba2d3832cb6838b2126e0f7db223305eab579d59

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/portaudio/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/portaudio/Config.in b/package/portaudio/Config.in
index df884a7..0a4d71b 100644
--- a/package/portaudio/Config.in
+++ b/package/portaudio/Config.in
@@ -1,11 +1,15 @@
 config BR2_PACKAGE_PORTAUDIO
 	bool "portaudio"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  PortAudio is a free, cross-platform, open-source,
 	  audio I/O library.
 
 	  http://www.portaudio.com/
 
+comment "portaudio needs a toolchain threads support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 if BR2_PACKAGE_PORTAUDIO
 
 config BR2_PACKAGE_PORTAUDIO_ALSA
-- 
1.7.4.1
