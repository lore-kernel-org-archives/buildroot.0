From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 May 2012 16:37:32 -0300
Subject: [Buildroot] [PATCH 03/10] hiawatha: bump to version 8.2 and define
	saner default directories
In-Reply-To: <1336765059-20673-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336765059-20673-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1336765059-20673-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 8.2.
Define CONFIG_DIR=/etc/hiawatha, LOG_DIR=/var/log, PID_DIR=/var/run and
WEBROOT_DIR=/var/www/hiawatha which are the same as the defaults but
without the /usr prefix.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hiawatha/hiawatha.mk |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index aa245f3..4600c11 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -1,4 +1,4 @@
-HIAWATHA_VERSION = 8.1
+HIAWATHA_VERSION = 8.2
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files/
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
@@ -8,6 +8,10 @@ endif
 
 HIAWATHA_CONF_OPT += \
 	-DENABLE_TOOLKIT=OFF \
-	-DENABLE_XSLT=OFF
+	-DENABLE_XSLT=OFF \
+	-DCONFIG_DIR=/etc/hiawatha \
+	-DLOG_DIR=/var/log \
+	-DPID_DIR=/var/run \
+	-DWEBROOT_DIR=/var/www/hiawatha
 
 $(eval $(call CMAKETARGETS))
-- 
1.7.3.4
