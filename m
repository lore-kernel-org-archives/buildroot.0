From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:07:09 +0100
Subject: [Buildroot] [git commit] espeak: add missing indirect dependency on
	atomics for pulseaudio
Message-ID: <20150207202910.458BB8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fffb57f1fe915d751b16f74167e18e2006c24b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/espeak/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index 29dfec9..607d5b0 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -30,11 +30,13 @@ config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
 
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO
 	bool "pulseaudio"
-	select BR2_PACKAGE_PULSEAUDIO
 	depends on BR2_LARGEFILE # pulseaudio
+	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
+	select BR2_PACKAGE_PULSEAUDIO
 
 comment "pulseaudio backend needs a toolchain with largefile"
 	depends on !BR2_LARGEFILE
+	depends on BR2_ARCH_HAS_ATOMICS
 
 endchoice
 
