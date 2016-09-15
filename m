From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 15 Sep 2016 15:57:02 +0530
Subject: [Buildroot] [PATCH 1/7] util-linux: add optional dependency on
	readline
Message-ID: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fdisk and sfdisk tools can be built with readline support. This patch
adds optional dependency on readline if it is already selected.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/util-linux/util-linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index aa6f994..7b16ca4 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -146,6 +146,13 @@ else
 UTIL_LINUX_CONF_OPTS += --without-python
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+UTIL_LINUX_CONF_OPTS += --with-readline
+UTIL_LINUX_DEPENDENCIES += readline
+else
+UTIL_LINUX_CONF_OPTS += --without-readline
+endif
+
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),y)
 define UTIL_LINUX_INSTALL_PAMFILES
-- 
2.6.2
