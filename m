From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Oct 2014 13:42:21 +0200
Subject: [Buildroot] [git commit] libgtk3: ensure cups-config can be found
Message-ID: <20141016114246.C4F56BD4A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9c30099aaac4c51c7af42d0a9853797f06137d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

http://autobuild.buildroot.net/results/db6/db6cd8922444490056bf5157fc0c9349e9bf383b/
http://autobuild.buildroot.net/results/4bd/4bdcd642eaa880dbbfbed8f4ed5ffac0c52edaa8/
http://autobuild.buildroot.net/results/8d3/8d30687f92178de15d7697a7b8a1b7e2d6e93deb/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/libgtk3.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 31aa1b3..a9a681d 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -96,6 +96,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 LIBGTK3_CONF_OPTS += --enable-cups
+LIBGTK3_CONF_ENV += ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
 LIBGTK3_DEPENDENCIES += cups
 else
 LIBGTK3_CONF_OPTS += --disable-cups
