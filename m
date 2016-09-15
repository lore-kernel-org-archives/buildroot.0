From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 15 Sep 2016 15:57:03 +0530
Subject: [Buildroot] [PATCH 2/7] util-linux: add optional dependency on audit
In-Reply-To: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1473935228-14014-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

login and hwclock can be built with audit support. This patch adds
optional dependency on audit package if it is already selected.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/util-linux/util-linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7b16ca4..82230bc 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -153,6 +153,13 @@ else
 UTIL_LINUX_CONF_OPTS += --without-readline
 endif
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+UTIL_LINUX_CONF_OPTS += --with-audit
+UTIL_LINUX_DEPENDENCIES += audit
+else
+UTIL_LINUX_CONF_OPTS += --without-audit
+endif
+
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),y)
 define UTIL_LINUX_INSTALL_PAMFILES
-- 
2.6.2
