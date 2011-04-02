From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 2 Apr 2011 10:24:59 +0200
Subject: [Buildroot] [git commit master 1/1] lighttpd: fix build without
	webdav support
Message-ID: <20110402082553.421CC81DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4bc1041db6ce805a8d96f653e50ce06eb6849d4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a typo in the --without-webdav-* handling.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lighttpd/lighttpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 5901801..332afe7 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -47,7 +47,7 @@ ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
 LIGHTTPD_DEPENDENCIES += libxml2 sqlite
 LIGHTTPD_CONF_OPT += --with-webdav-props --with-webdav-locks
 else
-LIGHTTPD_CONF_OPT += ---without-webdav-props --without-webdav-locks
+LIGHTTPD_CONF_OPT += --without-webdav-props --without-webdav-locks
 endif
 
 define LIGHTTPD_UNINSTALL_TARGET_CMDS
-- 
1.7.3.4
