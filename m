From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:57:08 +0100
Subject: [Buildroot] [PATCHv2 50/74] sound-theme-borealis: add error
	handling to for loop
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-51-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sound-theme-borealis/sound-theme-borealis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
2.1.0
