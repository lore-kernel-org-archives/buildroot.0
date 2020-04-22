From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Apr 2020 17:39:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-mbstrdecoder: needs python3
Message-ID: <20200422153905.465881-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python2 has been dropped since version 1.0.0 and
https://github.com/thombashi/mbstrdecoder/commit/d8f6fd76452ef82d08d1633a0e484349fedc190b

Fixes:
 - http://autobuild.buildroot.org/results/324dc351752d412a315955faf69e8f5637e75123

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-dataproperty/Config.in  | 1 +
 package/python-mbstrdecoder/Config.in  | 1 +
 package/python-pytablereader/Config.in | 2 +-
 package/python-pytablewriter/Config.in | 1 +
 package/python-simplesqlite/Config.in  | 1 +
 package/python-sqliteschema/Config.in  | 1 +
 package/python-tabledata/Config.in     | 1 +
 package/python-typepy/Config.in        | 1 +
 8 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/python-dataproperty/Config.in b/package/python-dataproperty/Config.in
index 2d42b02c6c..a0167edc11 100644
--- a/package/python-dataproperty/Config.in
+++ b/package/python-dataproperty/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_DATAPROPERTY
 	bool "python-dataproperty"
+	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder
 	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_FUTURES if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
diff --git a/package/python-mbstrdecoder/Config.in b/package/python-mbstrdecoder/Config.in
index 017002c97a..8982814cea 100644
--- a/package/python-mbstrdecoder/Config.in
+++ b/package/python-mbstrdecoder/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MBSTRDECODER
 	bool "python-mbstrdecoder"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  multi-byte character string decoder.
 
diff --git a/package/python-pytablereader/Config.in b/package/python-pytablereader/Config.in
index 6d61208bb6..302acb0ef3 100644
--- a/package/python-pytablereader/Config.in
+++ b/package/python-pytablereader/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYTABLEREADER
 	bool "python-pytablereader"
-	depends on BR2_PACKAGE_PYTHON3 # python-pathpy
+	depends on BR2_PACKAGE_PYTHON3 # pyhton-mbstrdecoder, python-pathpy
 	select BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4 # runtime
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
diff --git a/package/python-pytablewriter/Config.in b/package/python-pytablewriter/Config.in
index 9fed52c83f..e711bcc593 100644
--- a/package/python-pytablewriter/Config.in
+++ b/package/python-pytablewriter/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYTABLEWRITER
 	bool "python-pytablewriter"
+	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
diff --git a/package/python-simplesqlite/Config.in b/package/python-simplesqlite/Config.in
index c03411b90f..f86a093309 100644
--- a/package/python-simplesqlite/Config.in
+++ b/package/python-simplesqlite/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SIMPLESQLITE
 	bool "python-simplesqlite"
+	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
diff --git a/package/python-sqliteschema/Config.in b/package/python-sqliteschema/Config.in
index b9568adbea..8383647129 100644
--- a/package/python-sqliteschema/Config.in
+++ b/package/python-sqliteschema/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SQLITESCHEMA
 	bool "python-sqliteschema"
+	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
diff --git a/package/python-tabledata/Config.in b/package/python-tabledata/Config.in
index bd856d23e4..869f505690 100644
--- a/package/python-tabledata/Config.in
+++ b/package/python-tabledata/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TABLEDATA
 	bool "python-tabledata"
+	depends on BR2_PACKAGE_PYTHON3 # python-dataproperty, python-typepy
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
diff --git a/package/python-typepy/Config.in b/package/python-typepy/Config.in
index 6079857070..4c3765f82c 100644
--- a/package/python-typepy/Config.in
+++ b/package/python-typepy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TYPEPY
 	bool "python-typepy"
+	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
-- 
2.25.1
