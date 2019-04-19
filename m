From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Apr 2019 11:19:31 +0200
Subject: [Buildroot] [PATCH 4/5] package/prompt-toolkit: bump to version
 2.0.9
In-Reply-To: <20190419091932.4922-1-fontaine.fabrice@gmail.com>
References: <20190419091932.4922-1-fontaine.fabrice@gmail.com>
Message-ID: <20190419091932.4922-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add hash for license file
- Add xml depedency

prompt-toolkit in version 2.x is a dependency of ipython 7.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-prompt-toolkit/Config.in                  | 2 ++
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 8 +++++---
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-prompt-toolkit/Config.in b/package/python-prompt-toolkit/Config.in
index ccc9ebb0f5..baafaeb8c1 100644
--- a/package/python-prompt-toolkit/Config.in
+++ b/package/python-prompt-toolkit/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT
 	bool "python-prompt-toolkit"
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_WCWIDTH # runtime
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON #?runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 #?runtime
 	help
 	  Library for building powerful interactive command lines in
 	  Python.
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index f60fc08679..be671b8953 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/prompt_toolkit/json, sha256 locally computed
-md5 427b496d2c147bd3819bc3a7f6e0d493 prompt_toolkit-1.0.13.tar.gz
-sha256 33d68ca09f76cd73287fde7df5748ffacf26a8238dd61ee81ac50860ea7c6776 prompt_toolkit-1.0.13.tar.gz
+# md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
+md5	091daddeec62015e0be36e8682d36562  prompt_toolkit-2.0.9.tar.gz
+sha256	2519ad1d8038fd5fc8e770362237ad0364d16a7650fb5724af6997ed5515e3c1  prompt_toolkit-2.0.9.tar.gz
+# Locally computed sha256 checksums
+sha256	303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index 19b7b34e0a..8f62922633 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 1.0.13
+PYTHON_PROMPT_TOOLKIT_VERSION = 2.0.9
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://pypi.python.org/packages/23/be/4876b52d5cc159cbd4b0ff6e7aa419a26470849a43a8f647857a4a24467b
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/94/a0/57dc47115621d9b3fcc589848cdbcbb6c4c130186e8fc4c4704766a7a699
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
-- 
2.20.1
