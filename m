From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:17:53 +0100
Subject: [Buildroot] [git commit] pptp-linux: don't install man page
Message-ID: <20141201223450.57E5480048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b66deab8783d9c9bf0df2c0236a5e2e61a6aed6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't support installing documentation on the target, so there's no
point in having explicit code to do so.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pptp-linux/pptp-linux.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index dc624eb..d7edf6c 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -21,7 +21,6 @@ endef
 
 define PPTP_LINUX_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/pptp $(TARGET_DIR)/usr/sbin/pptp
-	$(INSTALL) -m 0644 -D $(@D)/pptp.8 $(TARGET_DIR)/usr/share/man/man8/pptp.8
 endef
 
 $(eval $(generic-package))
