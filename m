From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Apr 2014 09:01:35 -0300
Subject: [Buildroot] [PATCH] htop: bump to version 1.0.3
Message-ID: <1398686495-15756-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/htop/{htop.patch => htop-01-native-affinity.patch} | 0
 package/htop/htop.mk                                       | 5 +++--
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename package/htop/{htop.patch => htop-01-native-affinity.patch} (100%)

diff --git a/package/htop/htop.patch b/package/htop/htop-01-native-affinity.patch
similarity index 100%
rename from package/htop/htop.patch
rename to package/htop/htop-01-native-affinity.patch
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index fe9b302..a1ec56f 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-HTOP_VERSION = 1.0.2
-HTOP_SITE = http://downloads.sourceforge.net/project/htop/htop/$(HTOP_VERSION)
+HTOP_VERSION = 1.0.3
+HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
+# For htop-01-native-affinity.patch
 HTOP_AUTORECONF = YES
 HTOP_CONF_OPT = --disable-unicode
 HTOP_CONF_ENV = ac_cv_file__proc_stat=yes ac_cv_file__proc_meminfo=yes
-- 
1.8.3.2
