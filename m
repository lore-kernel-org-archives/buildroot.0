From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  3 Nov 2014 00:39:52 +0100
Subject: [Buildroot] [PATCH 3/6] package/*/*.mk: Fix indent
In-Reply-To: <1414971595-9972-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414971595-9972-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414971595-9972-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change LIBFOO_PERMISSIONS everywhere to be a space-separated list.
As nothing was specified in the manual but all our lists are space
separated, there is no reason that this one should be made an exception.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/busybox/busybox.mk | 4 ++--
 package/nginx/nginx.mk     | 2 +-
 package/sudo/sudo.mk       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 0ceaab1..b320aed 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -50,8 +50,8 @@ BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
 define BUSYBOX_PERMISSIONS
-	/bin/busybox			 f 4755	0 0 - - - - -
-	/usr/share/udhcpc/default.script f 755  0 0 - - - - -
+	/bin/busybox f 4755 0 0 - - - - -
+	/usr/share/udhcpc/default.script f 755 0 0 - - - - -
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
-- 
2.1.1
