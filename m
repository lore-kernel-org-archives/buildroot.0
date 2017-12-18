From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 18 Dec 2017 09:07:04 +0100
Subject: [Buildroot] [PATCH v2 1/2] python-cffi: add missing runtime
 dependency
Message-ID: <20171218080705.3182-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

python-pycparser is mentioned in setup.py as install_requires, so
select it in Config.in.

As python-cffi will be installed with python-crossbar's dependencies,
remove it from python-crossbar's Config.in.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
	- rename patch to just indicate that we are adding missing runtime dependency

 package/python-cffi/Config.in     | 1 +
 package/python-crossbar/Config.in | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cffi/Config.in b/package/python-cffi/Config.in
index 3805d3d10a..bc9f6a296d 100644
--- a/package/python-cffi/Config.in
+++ b/package/python-cffi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_CFFI
 	bool "python-cffi"
 	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_PYTHON_PYCPARSER # runtime
 	help
 	  This is the Foreign Function Interface for Python calling C
 	  code. The aim of this project is to provide a convenient
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index faec922e50..2a98467bd4 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
 	select BR2_PACKAGE_PYTHON_CBOR
 	select BR2_PACKAGE_PYTHON_CLICK
-	select BR2_PACKAGE_PYTHON_PYCPARSER
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	select BR2_PACKAGE_PYTHON_JINJA2
 	select BR2_PACKAGE_PYTHON_LMDB
-- 
2.11.0
