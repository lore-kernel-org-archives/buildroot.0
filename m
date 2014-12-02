From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 12:58:39 +0100
Subject: [Buildroot] [git commit] live555: fix test programs target
	installation
Message-ID: <20141202120522.B931B80077@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a569400fc355f5a709398b7ac6c1133f7b8ec20c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 43ebd93e1fcb (live555: add error handling to for loop) removed the
shell command delimiter. Add it back.

Fixes:
http://autobuild.buildroot.net/results/00f/00f26fa3b6fc8c707009f44ede7b680849f18d5f/

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 0644505..46fca5b 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -55,7 +55,7 @@ endef
 
 define LIVE555_INSTALL_TARGET_CMDS
 	for i in $(LIVE555_FILES_TO_INSTALL-y); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i` || exit 1 \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin/`basename $$i` || exit 1; \
 	done
 endef
 
