From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:06:51 +0100
Subject: [Buildroot] [git commit] at: use <pkg>_INSTALL_INIT_SYSV mechanism
Message-ID: <20141201221141.1B3328002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efe16ae118570f26212dc9210071fa0949a0e482
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/at/at.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/at/at.mk b/package/at/at.mk
index 851a05b..1504e32 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -21,10 +21,8 @@ AT_CONF_OPTS = \
 	--with-daemon_groupname=root \
 	SENDMAIL=/usr/sbin/sendmail
 
-define AT_INSTALL_INITSCRIPT
+define AT_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
 endef
 
-AT_POST_INSTALL_TARGET_HOOKS += AT_INSTALL_INITSCRIPT
-
 $(eval $(autotools-package))
