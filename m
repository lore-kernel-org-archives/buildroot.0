From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 Jul 2012 08:50:27 -0300
Subject: [Buildroot] [PATCH] htop: bump to version 1.0.1 and fix build
	failure
Message-ID: <1341575427-24731-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 1.0.1
Also fix build failure:
http://autobuild.buildroot.net/results/5f95c4fbb62b7b8cb451f6525731eae4ce6bcdbf/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/htop/htop.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 07b750c..3535697 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,11 +4,11 @@
 #
 #############################################################
 
-HTOP_VERSION = 1.0
-HTOP_SOURCE = htop-$(HTOP_VERSION).tar.gz
-HTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/htop/$(HTOP_VERSION)
+HTOP_VERSION = 1.0.1
+HTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/htop/htop/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
-HTOP_CONF_OPT += --disable-unicode
+HTOP_CONF_OPT = --disable-unicode
+HTOP_CONF_ENV = ac_cv_file__proc_stat=yes ac_cv_file__proc_meminfo=yes
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.8.6
