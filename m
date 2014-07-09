From: Henry Margies <henry.margies@gmail.com>
Date: Wed,  9 Jul 2014 11:38:59 +0100
Subject: [Buildroot] [PATCH v2 1/1] Build Python with tzset support
In-Reply-To: <1404825833-1075-1-git-send-email-henry.margies@gmail.com>
References: <1404825833-1075-1-git-send-email-henry.margies@gmail.com>
Message-ID: <1404902339-25481-1-git-send-email-henry.margies@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for time.tzset() in Python2.7 and Python3.

The Python configure script sets ac_cv_working_tzset to 'no' when
cross compiling, although it should be available and work with all 
toolchains supported by Buildroot (?).
The patch below pre-sets the variable so that time.tzset() works.


Signed-off-by: Henry Margies <henry.margies@gmail.com>
---
Changes v1 -> v2:
 - added similar patch for Python3

 package/python/python.mk   |    3 ++-
 package/python3/python3.mk |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

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
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 98fc31b..1591ac9 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -96,6 +96,7 @@ PYTHON3_CONF_ENV += \
 	ac_cv_have_long_long_format=yes \
 	ac_cv_file__dev_ptmx=yes \
 	ac_cv_file__dev_ptc=yes \
+	ac_cv_working_tzset=yes
 
 PYTHON3_CONF_OPT += \
 	--without-ensurepip	\
-- 
1.7.2.5
