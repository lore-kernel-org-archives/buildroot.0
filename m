From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 Jul 2016 00:32:52 +0200
Subject: [Buildroot] [PATCH 4/4] package/puseaudio: fix typo
In-Reply-To: <1467585172-10299-1-git-send-email-romain.naour@gmail.com>
References: <1467585172-10299-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1467585172-10299-4-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit 7290dc1e87b23fe21c75c50b2238004273a0ec5c added
PULSE_AUDIO_CONF_ENV instead of PULSEAUDIO_CONF_ENV.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/pulseaudio/pulseaudio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 9ef11bc..e0d9ab4 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -18,7 +18,7 @@ PULSEAUDIO_CONF_OPTS = \
 # Make sure we don't detect libatomic_ops. Indeed, since pulseaudio
 # requires json-c, which needs 4 bytes __sync builtins, there should
 # be no need for pulseaudio to rely on libatomic_ops.
-PULSE_AUDIO_CONF_ENV += \
+PULSEAUDIO_CONF_ENV += \
 	ac_cv_header_atomic_ops_h=no
 
 # 0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
-- 
2.5.5
