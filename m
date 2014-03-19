From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 19 Mar 2014 07:49:00 -0300
Subject: [Buildroot] [PATCH] mtools: fix target compilation
Message-ID: <1395226140-8086-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It needs some help regarding setpgrp, fixes:
http://autobuild.buildroot.net/results/33e/33e38bf1c30cc09dbe992dfb95c48997ca860212/
Also disable X11 support since it picks up the host variant.
And use normal indentation for variables.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mtools/mtools.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 6d8f44b..4880245 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-MTOOLS_VERSION       = 4.0.18
-MTOOLS_SOURCE        = mtools-$(MTOOLS_VERSION).tar.bz2
-MTOOLS_SITE          = $(BR2_GNU_MIRROR)/mtools/
-MTOOLS_LICENSE       = GPLv3+
+MTOOLS_VERSION = 4.0.18
+MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.bz2
+MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools/
+MTOOLS_LICENSE = GPLv3+
 MTOOLS_LICENSE_FILES = COPYING
+MTOOLS_CONF_ENV = ac_cv_func_setpgrp_void=yes
+MTOOLS_CONF_OPT = --without-x
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.3.2
