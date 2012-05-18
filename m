From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 May 2012 22:21:58 +0200
Subject: [Buildroot] [git commit branch/next] hiawatha: bump to version 8.2
	and define saner default directories
Message-ID: <20120518202900.5971F96D2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c7f14af250a7333f792aaab28b88665df122ff7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump to version 8.2.
Define CONFIG_DIR=/etc/hiawatha, LOG_DIR=/var/log, PID_DIR=/var/run and
WEBROOT_DIR=/var/www/hiawatha which are the same as the defaults but
without the /usr prefix.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
