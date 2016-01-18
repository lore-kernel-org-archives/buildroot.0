From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 18 Jan 2016 18:38:40 +0100
Subject: [Buildroot] [PATCH v2] package/libevent: Fix broken download URL
Message-ID: <1453138720-16100-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream URL has changed on Sourceforge:

>>> libevent 2.0.22-stable Downloading
--2016-01-17 23:06:31--  http://downloads.sourceforge.net/project/levent/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.34.181.59
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.34.181.59|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2016-01-17 23:06:31 ERROR 404: Not Found.

Additionally the project moved to github:
http://sourceforge.net/projects/levent/

"As of 2015-10-07, this project may now be found at
 https://github.com/libevent/libevent."

This patch points Config.in to the new upstream URL and fixes the broken
download URL by using github.com.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: the download URL should work now ;) (Peter)

 package/libevent/Config.in   | 2 +-
 package/libevent/libevent.mk | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libevent/Config.in b/package/libevent/Config.in
index 680fa48..c32f29e 100644
--- a/package/libevent/Config.in
+++ b/package/libevent/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_LIBEVENT
 	help
 	  Userspace library for handling asynchronous notifications
 
-	  http://monkey.org/~provos/
+	  http://libevent.org
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index d67c738..820beea 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBEVENT_VERSION_MAJOR = 2.0
-LIBEVENT_VERSION = $(LIBEVENT_VERSION_MAJOR).22-stable
-LIBEVENT_SITE = http://downloads.sourceforge.net/project/levent/libevent/libevent-$(LIBEVENT_VERSION_MAJOR)
+LIBEVENT_VERSION = 2.0.22-stable
+LIBEVENT_SITE = https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_LICENSE = BSD-3c, OpenBSD
 LIBEVENT_LICENSE_FILES = LICENSE
-- 
2.7.0.rc3
