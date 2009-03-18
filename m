From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 22:39:04 +0000 (UTC)
Subject: [Buildroot] svn commit: [25740] trunk/buildroot/package/avahi
Message-ID: <20090318223904.3609E7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 22:39:03 +0000 (Wed, 18 Mar 2009)
New Revision: 25740

Log:
avahi: fix python path

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2009-03-18 21:22:17 UTC (rev 25739)
+++ trunk/buildroot/package/avahi/avahi.mk	2009-03-18 22:39:03 UTC (rev 25740)
@@ -126,8 +126,8 @@
 		am_cv_path_PYTHON=$(PYTHON_TARGET_BINARY) \
 		am_cv_python_version=$(PYTHON_VERSION) \
 		am_cv_python_platform=linux2 \
-		am_cv_python_pythondir=$(PYTHON_SITE_PACKAGE_DIR) \
-		am_cv_python_pyexecdir=$(PYTHON_SITE_PACKAGE_DIR) \
+		am_cv_python_pythondir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		am_cv_python_pyexecdir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
 		py_cv_mod_socket_=yes
 
 AVAHI_DEPENDENCIES += libpython
