From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:15:55 +0100
Subject: [Buildroot] [git commit] iostat: don't install man page
Message-ID: <20141201223450.3BE8A80048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9260501fb8b34756ac1f40ea1b4b39e06ce01217
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't support installing documentation on the target, so there's no
point in having explicit code to do so.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iostat/iostat.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 8610f8f..2080e56 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -17,8 +17,6 @@ endef
 
 define IOSTAT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(IOSTAT_DIR)/iostat $(TARGET_DIR)/usr/bin/iostat
-	$(INSTALL) -D $(IOSTAT_DIR)/iostat.8 \
-		$(TARGET_DIR)/usr/share/man/man8/iostat.8
 endef
 
 $(eval $(generic-package))
