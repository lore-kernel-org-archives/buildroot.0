From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Feb 2013 11:11:21 -0300
Subject: [Buildroot] [PATCH] collectd: also install to staging
Message-ID: <1360851081-32060-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes bug #5906

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/collectd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index a50be9c..6d26622 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -8,6 +8,7 @@ COLLECTD_VERSION = 5.1.2
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_MAKE_OPT = LDFLAGS="$(TARGET_LDFLAGS) -lm"
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
+COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = GPLv2 LGPLv2.1
 COLLECTD_LICENSE_FILES = COPYING
 
-- 
1.7.12.4
