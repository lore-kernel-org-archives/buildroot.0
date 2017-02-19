From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:23 -0500
Subject: [Buildroot] [PATCH 26/58] python-mwclient: bump to version 0.8.2
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-27-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 .../0001-use-exec-in-py3-compatible-manner.patch   | 36 ----------------------
 package/python-mwclient/python-mwclient.hash       |  4 +--
 package/python-mwclient/python-mwclient.mk         |  4 +--
 3 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 package/python-mwclient/0001-use-exec-in-py3-compatible-manner.patch

diff --git a/package/python-mwclient/0001-use-exec-in-py3-compatible-manner.patch b/package/python-mwclient/0001-use-exec-in-py3-compatible-manner.patch
deleted file mode 100644
index ac7838a..0000000
--- a/package/python-mwclient/0001-use-exec-in-py3-compatible-manner.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 5de1bb82465d39962e26175c62f644a3e423d030 Mon Sep 17 00:00:00 2001
-From: Adam Williamson <awilliam@redhat.com>
-Date: Thu, 21 Jan 2016 17:21:52 -0800
-Subject: [PATCH] use 'exec' in py3-compatible manner
-
-per https://docs.python.org/2/reference/simple_stmts.html ,
-as exec is a function not a statement in py3, the py2 version
-has been set to allow the subsequent statement to be a tuple,
-so we can invoke it like this to make it both py2 and py3
-compatible. Without this, byte-compiling the file fails under
-py3.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-downloaded from upstream commit:
-https://github.com/mwclient/mwclient/commit/5de1bb82465d39962e26175c62f644a3e423d030
-
- mwclient/ex.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mwclient/ex.py b/mwclient/ex.py
-index db4006c..c0b1eae 100644
---- a/mwclient/ex.py
-+++ b/mwclient/ex.py
-@@ -12,7 +12,7 @@ def read_config(config_files, **predata):
- 
- def _read_config_file(_config_file, predata):
-     _file = open(_config_file)
--    exec _file in globals(), predata
-+    exec(_file, globals(), predata)
-     _file.close()
- 
-     for _k, _v in predata.iteritems():
--- 
-2.9.3
-
diff --git a/package/python-mwclient/python-mwclient.hash b/package/python-mwclient/python-mwclient.hash
index 1098971..75708a1 100644
--- a/package/python-mwclient/python-mwclient.hash
+++ b/package/python-mwclient/python-mwclient.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/mwclient/json, sha256 locally computed
-md5	c1334facf2d6ca54fe6dba4ab75ecf34  mwclient-0.8.1.tar.gz
-sha256	5f892711cc0b23ff2a6d8b7986ee63cd43fd1ec92b0783604ffa7613cd1662e4  mwclient-0.8.1.tar.gz
+md5 2fb5863ee8e7e436e2ecf230a48084e0 mwclient-0.8.2.tar.gz
+sha256 e16fa5bc4fd1a2acfc5cc3897e7132500917198bd17350b543893c17abe2cbb6 mwclient-0.8.2.tar.gz
diff --git a/package/python-mwclient/python-mwclient.mk b/package/python-mwclient/python-mwclient.mk
index 1f1e209..80ede64 100644
--- a/package/python-mwclient/python-mwclient.mk
+++ b/package/python-mwclient/python-mwclient.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MWCLIENT_VERSION = 0.8.1
+PYTHON_MWCLIENT_VERSION = 0.8.2
 PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
-PYTHON_MWCLIENT_SITE = https://pypi.python.org/packages/19/79/481b288a497f625ee8f76141ff3472d81428b1f14b7155a28a63a3247197
+PYTHON_MWCLIENT_SITE = https://pypi.python.org/packages/39/61/f743f760a720c4fd303192d12c3c8bd902543e7749a9efb1ba44b4ab0ead
 PYTHON_MWCLIENT_LICENSE = MIT
 PYTHON_MWCLIENT_LICENSE_FILES = mwclient/__init__.py
 PYTHON_MWCLIENT_SETUP_TYPE = setuptools
-- 
2.9.3
