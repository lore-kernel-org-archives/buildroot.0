From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Jun 2011 13:08:19 +0200
Subject: [Buildroot] [git commit] sudo: bump version, use official upstream,
	don't disable auth
Message-ID: <20110607110850.DE91F828FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=92ab7428e85027d8155855e67e8e03bb80c93a94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sudo without authentication doesn't make much sense, and it has very
limited impact on binary size.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sudo/Config.in |    2 ++
 package/sudo/sudo.mk   |    6 ++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index a1b596b..fc0a175 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -5,3 +5,5 @@ config BR2_PACKAGE_SUDO
 	  limited root privileges to users and log root activity.  The
 	  basic philosophy is to give as few privileges as possible
 	  but still allow people to get their work done.
+
+	  http://www.sudo.ws/sudo/
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index fde4b77..688df16 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,9 +4,8 @@
 #
 #############################################################
 
-SUDO_VERSION = 1.7.4p6
-SUDO_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sudo
-SUDO_SOURCE  = sudo_$(SUDO_VERSION).orig.tar.gz
+SUDO_VERSION = 1.7.6p2
+SUDO_SITE    = http://www.sudo.ws/sudo/dist
 
 SUDO_CONF_OPT = \
 		--without-lecture \
@@ -14,7 +13,6 @@ SUDO_CONF_OPT = \
 		--without-umask \
 		--with-logging=syslog \
 		--without-interfaces \
-		--disable-authentication \
 		--without-pam
 
 define SUDO_INSTALL_TARGET_CMDS
-- 
1.7.3.4
