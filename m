From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:13:41 +0100
Subject: [Buildroot] [git commit] sound-theme-borealis: add error handling
	to for loop
Message-ID: <20141201233008.F3D9580051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d9e954c443d64537d596ee652b7a63d2c16f5c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../sound-theme-borealis/sound-theme-borealis.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
index a2f29a9..9242837 100644
--- a/package/sound-theme-borealis/sound-theme-borealis.mk
+++ b/package/sound-theme-borealis/sound-theme-borealis.mk
@@ -11,7 +11,7 @@ SOUND_THEME_BOREALIS_SOURCE = \
 
 define SOUND_THEME_BOREALIS_INSTALL_TARGET_CMDS
 	for f in $(@D)/*.ogg ; do \
-		$(INSTALL) -D -m 0644 $$f $(TARGET_DIR)/usr/share/sounds/borealis/stereo/`basename $$f` ; \
+		$(INSTALL) -D -m 0644 $$f $(TARGET_DIR)/usr/share/sounds/borealis/stereo/`basename $$f` || exit 1; \
 	done
 endef
 
