From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jul 2017 13:36:20 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] package/pulseaudio:
	remove kde files
Message-ID: <20170705113318.C56D881F76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=620bf17c445a2244d16c24666d76db363b630c56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Upstream removed the src/daemon/pulseaudio-kde.desktop.in since the
version 6.0 [1].

[1] https://github.com/pulseaudio/pulseaudio/commit/f46799579f438125b695dced4edf8bca05cbe90a

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 90536c3dfc8e375ebac2042ae9741e98b4ebc8f5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseaudio/pulseaudio.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 0c409a7..54a9a61 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -121,8 +121,6 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 define PULSEAUDIO_FIXUP_DESKTOP_FILES
 	cp $(@D)/src/daemon/pulseaudio.desktop.in \
 		$(@D)/src/daemon/pulseaudio.desktop
-	cp $(@D)/src/daemon/pulseaudio-kde.desktop.in \
-		$(@D)/src/daemon/pulseaudio-kde.desktop
 endef
 PULSEAUDIO_POST_PATCH_HOOKS += PULSEAUDIO_FIXUP_DESKTOP_FILES
 endif
