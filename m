From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 23:23:35 +0100
Subject: [Buildroot] [git commit] package/*/*.mk: Fix indent
Message-ID: <20141201104837.272507FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1595d6b531600fa20eeba06c0584c383c29fe0f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change LIBFOO_PERMISSIONS everywhere to be a space-separated list.
As nothing was specified in the manual but all our lists are space
separated, there is no reason that this one should be made an exception.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    4 ++--
 package/nginx/nginx.mk     |    2 +-
 package/sudo/sudo.mk       |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 0ceaab1..f0fa851 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -50,8 +50,8 @@ BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
 define BUSYBOX_PERMISSIONS
-	/bin/busybox			 f 4755	0 0 - - - - -
-	/usr/share/udhcpc/default.script f 755  0 0 - - - - -
+	/bin/busybox                     f 4755 0  0 - - - - -
+	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
 endef
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 5a65c52..55ae844 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -25,7 +25,7 @@ NGINX_CONF_OPTS = \
 # So, we just need to create the directories used by nginx with the right
 # ownership.
 define NGINX_PERMISSIONS
-	/var/lib/nginx	d	755	33	33	-	-	-	-	-
+	/var/lib/nginx d 755 33 33 - - - - -
 endef
 
 # disable external libatomic_ops because its detection fails.
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 283a40c..61635ec 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -29,7 +29,7 @@ endef
 SUDO_POST_CONFIGURE_HOOKS += SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
 
 define SUDO_PERMISSIONS
-	/usr/bin/sudo			 f 4755	0 0 - - - - -
+	/usr/bin/sudo f 4755 0 0 - - - - -
 endef
 
 $(eval $(autotools-package))
