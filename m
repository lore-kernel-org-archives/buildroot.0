From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu,  3 Sep 2015 09:55:24 +0200
Subject: [Buildroot] [PATCH v2 4/6] python-configshell-fb: bump version
In-Reply-To: <1441266926-2942-1-git-send-email-cvubrugier@fastmail.fm>
References: <1441266926-2942-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <1441266926-2942-4-git-send-email-cvubrugier@fastmail.fm>
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
 package/python-configshell-fb/Config.in                | 1 +
 package/python-configshell-fb/python-configshell-fb.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-configshell-fb/Config.in b/package/python-configshell-fb/Config.in
index 85f47a8..a680ce0 100644
--- a/package/python-configshell-fb/Config.in
+++ b/package/python-configshell-fb/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_PYPARSING
 	select BR2_PACKAGE_PYTHON3_READLINE if BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_READLINE if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SIX
 	select BR2_PACKAGE_PYTHON_URWID
 	help
 	  configshell-fb is a Python library that provides a framework
diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
index 76ef48d..d0671d5 100644
--- a/package/python-configshell-fb/python-configshell-fb.mk
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_CONFIGSHELL_FB_VERSION = v1.1.fb15
+PYTHON_CONFIGSHELL_FB_VERSION = v1.1.fb18
 PYTHON_CONFIGSHELL_FB_SITE = $(call github,agrover,configshell-fb,$(PYTHON_CONFIGSHELL_FB_VERSION))
 PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
 PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
 PYTHON_CONFIGSHELL_FB_SETUP_TYPE = setuptools
-PYTHON_CONFIGSHELL_FB_DEPENDENCIES = python-pyparsing python-urwid
+PYTHON_CONFIGSHELL_FB_DEPENDENCIES = python-pyparsing python-six python-urwid
 
 $(eval $(python-package))
-- 
2.5.0
