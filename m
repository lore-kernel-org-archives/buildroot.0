From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu,  3 Sep 2015 09:55:23 +0200
Subject: [Buildroot] [PATCH v2 3/6] python-rtslib-fb: bump version
In-Reply-To: <1441266926-2942-1-git-send-email-cvubrugier@fastmail.fm>
References: <1441266926-2942-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <1441266926-2942-3-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add new dependency to python-six.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>

---
Changes since v1:
 * Select BR2_PACKAGE_PYTHON_SIX in Config.in

---
 package/python-rtslib-fb/Config.in           | 1 +
 package/python-rtslib-fb/python-rtslib-fb.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/python-rtslib-fb/Config.in b/package/python-rtslib-fb/Config.in
index 42a610c..7bae560 100644
--- a/package/python-rtslib-fb/Config.in
+++ b/package/python-rtslib-fb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_RTSLIB_FB
 	bool "python-rtslib-fb"
+	select BR2_PACKAGE_PYTHON_SIX
 	help
 	  rtslib-fb is an object-based Python library for configuring
 	  the LIO generic SCSI target, present in 3.x Linux kernel
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index d45c261..85bee0b 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_RTSLIB_FB_VERSION = v2.1.fb50
+PYTHON_RTSLIB_FB_VERSION = v2.1.fb57
 PYTHON_RTSLIB_FB_SITE = $(call github,agrover,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
 PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
 PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
+PYTHON_RTSLIB_FB_DEPENDENCIES = python-six
 
 $(eval $(python-package))
-- 
2.5.0
