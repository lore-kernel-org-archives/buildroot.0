From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 14:19:18 +0200
Subject: [Buildroot] [git commit] python-configshell-fb: bump version
Message-ID: <20151003122242.125F17FAAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c67894eec4f8a2d9ea67af2d0137d2d350878af4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add new dependency to python-six.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-configshell-fb/Config.in            |    1 +
 .../python-configshell-fb/python-configshell-fb.mk |    4 ++--
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
