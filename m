From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Feb 2015 00:08:11 +0100
Subject: [Buildroot] [git commit] log4cxx: disable unused documentation
Message-ID: <20150204231034.F19E680819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac37db1ee96936e9aff45cf096581073a9984fd0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Saves around 14 MiB of data in /usr/share/log4cxx/html.

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/log4cxx/log4cxx.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 00d851e..7d7e2e9 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -13,7 +13,10 @@ LOG4CXX_LICENSE_FILES = LICENSE
 
 LOG4CXX_CONF_OPTS = \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
-	--with-apr-util=$(STAGING_DIR)/usr/bin/apu-1-config
+	--with-apr-util=$(STAGING_DIR)/usr/bin/apu-1-config \
+	--disable-dot \
+	--disable-doxygen \
+	--disable-html-docs
 
 LOG4CXX_DEPENDENCIES = apr apr-util
 
