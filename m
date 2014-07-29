From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jul 2014 18:03:26 -0300
Subject: [Buildroot] [PATCH] popt: now needs gettextize
Message-ID: <1406667806-25878-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because of df9244ff3738face50605eacf4d4f15d963de915 we now need to
gettextize popt. Fixes:
http://autobuild.buildroot.net/results/6e2/6e27c98407f114df07eb5cd16a843420fdb72bf4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/popt/popt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 0413c5a..54e7c88 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -11,6 +11,7 @@ POPT_INSTALL_STAGING = YES
 POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
 POPT_AUTORECONF = YES
+POPT_GETTEXTIZE = YES
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
-- 
1.8.5.5
