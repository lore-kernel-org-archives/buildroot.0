From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:08:21 +0100
Subject: [Buildroot] [git commit] wipe: don't install man pages
Message-ID: <20141201221141.33CC28002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c254d121b6d880d4e87f1a2512ccae0268e6d09f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't support installing documentation on the target, so there's no
point in having explicit code to do so.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wipe/wipe.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index 4deabab..ee4682c 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -13,7 +13,6 @@ WIPE_LICENSE_FILES = LICENSE
 
 define WIPE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/wipe $(TARGET_DIR)/usr/bin/wipe
-	$(INSTALL) -D $(@D)/wipe.1 $(TARGET_DIR)/usr/share/man/man1/wipe.1
 endef
 
 $(eval $(autotools-package))
