From: Henry Margies <henry.margies@gmail.com>
Date: Tue,  8 Jul 2014 14:23:53 +0100
Subject: [Buildroot] [PATCH 1/1] Build Python with tzset support
Message-ID: <1404825833-1075-1-git-send-email-henry.margies@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for time.tzset() in Python 2.7.

The Python configure script sets ac_cv_working_tzset to 'no' when
cross compiling, although it should be available and work with all 
toolchains supported by Buildroot (?).
The patch below pre-sets the variable so that time.tzset() works.

Signed-off-by: Henry Margies <henry.margies@gmail.com>
---
 package/python/python.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index cb54e3e..b237848 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -121,7 +121,8 @@ endif
 PYTHON_CONF_ENV += \
 	ac_cv_have_long_long_format=yes \
 	ac_cv_file__dev_ptmx=yes \
-	ac_cv_file__dev_ptc=yes
+	ac_cv_file__dev_ptc=yes \
+	ac_cv_working_tzset=yes
 
 PYTHON_CONF_OPT += \
 	--without-cxx-main 	\
-- 
1.7.2.5
