From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:32:26 +0100
Subject: [Buildroot] [git commit] live555: add error handling to for loop
Message-ID: <20141201223450.D823280048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43ebd93e1fcb96d9d7dc26f7611246abb92b0d1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index b923388..7dbded3 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -54,7 +54,7 @@ endef
 
 define LIVE555_INSTALL_TARGET_CMDS
 	for i in $(LIVE555_FILES_TO_INSTALL-y); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i`; \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i` || exit 1 \
 	done
 endef
 
