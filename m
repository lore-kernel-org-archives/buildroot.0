From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:07 +0100
Subject: [Buildroot] [PATCH 09/21] espeak: add missing indirect dependency
	on atomics for pulseaudio
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-10-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/espeak/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
 
-- 
2.1.4
