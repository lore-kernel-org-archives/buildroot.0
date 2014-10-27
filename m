From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Mon, 27 Oct 2014 10:26:11 +0100
Subject: [Buildroot] [PATCH 1/1] targetcli-fb: allow to build with Python 3
Message-ID: <1414401971-8577-1-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/python-configshell-fb/Config.in | 5 +++--
 package/python-rtslib-fb/Config.in      | 2 +-
 package/targetcli-fb/Config.in          | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-configshell-fb/Config.in b/package/python-configshell-fb/Config.in
index 05de585..fb96763 100644
--- a/package/python-configshell-fb/Config.in
+++ b/package/python-configshell-fb/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	bool "python-configshell-fb"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYPARSING
-	select BR2_PACKAGE_PYTHON_READLINE
+	select BR2_PACKAGE_PYTHON3_READLINE if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_READLINE if BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_URWID
 	help
 	  configshell-fb is a Python library that provides a framework
diff --git a/package/python-rtslib-fb/Config.in b/package/python-rtslib-fb/Config.in
index b2aebcf..119b63b 100644
--- a/package/python-rtslib-fb/Config.in
+++ b/package/python-rtslib-fb/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_RTSLIB_FB
 	bool "python-rtslib-fb"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  rtslib-fb is an object-based Python library for configuring
 	  the LIO generic SCSI target, present in 3.x Linux kernel
diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index dcc6a54..ee241ef 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -1,9 +1,9 @@
-comment "targetcli-fb depends on python"
-	depends on !BR2_PACKAGE_PYTHON
+comment "targetcli-fb depends on Python"
+	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3
 
 config BR2_PACKAGE_TARGETCLI_FB
 	bool "targetcli-fb"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_RTSLIB_FB
 	help
-- 
2.1.1
