From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:30:59 +0100
Subject: [Buildroot] [git commit] googlefontdirectory: add error handling to
	for loop
Message-ID: <20141201223450.B009B80048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0cefa916b2131054fe3f5d0916dbbe2bcc54f4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/googlefontdirectory/googlefontdirectory.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/googlefontdirectory/googlefontdirectory.mk b/package/googlefontdirectory/googlefontdirectory.mk
index 076e654..0e60892 100644
--- a/package/googlefontdirectory/googlefontdirectory.mk
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -16,7 +16,7 @@ define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS
 	for i in $(GOOGLEFONTDIRECTORY_FONTS); \
 	do \
 		$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/$$i && \
-		$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/fonts/$$i $(@D)/$$i/*.ttf; \
+		$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/fonts/$$i $(@D)/$$i/*.ttf || exit 1; \
 	done
 endef
 
