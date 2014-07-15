From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:39:09 +0200
Subject: [Buildroot] [git commit] python, python3: build with tzset support
Message-ID: <20140715183935.575E39D246@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a37b214c434d92dd7be3ddd69ca3c669c954c3a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for time.tzset() in Python 2.7 and Python 3.

The Python configure script sets ac_cv_working_tzset to 'no' when
cross compiling, although it should be available and work with all
toolchains supported by Buildroot (?).
The patch below pre-sets the variable so that time.tzset() works.

[Thomas: adjust commit log.]

Signed-off-by: Henry Margies <henry.margies@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
