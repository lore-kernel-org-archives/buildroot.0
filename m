From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:08:46 +0100
Subject: [Buildroot] [git commit] wipe: ensure binary gets installed with
	proper permissions
Message-ID: <20141201221141.3B7998002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e266172535eb978c071800d8895247f896eeafe1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wipe/wipe.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index ee4682c..38cb434 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -12,7 +12,7 @@ WIPE_LICENSE = GPLv2+
 WIPE_LICENSE_FILES = LICENSE
 
 define WIPE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/wipe $(TARGET_DIR)/usr/bin/wipe
+	$(INSTALL) -D -m 0755 $(@D)/wipe $(TARGET_DIR)/usr/bin/wipe
 endef
 
 $(eval $(autotools-package))
