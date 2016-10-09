From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Oct 2016 14:46:16 +0200
Subject: [Buildroot] [PATCH v4 01/10] package/python3: add optional support
	for lzma
Message-ID: <20161009124625.23303-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by the upcoming python-mwscrape2slob package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: no changes
v3: no changes, included in mwscrape2slob patch series
v2: never released

 package/python3/Config.in  | 6 ++++++
 package/python3/python3.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 0f4fc88..29ee5e3 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -98,6 +98,12 @@ config BR2_PACKAGE_PYTHON3_PYEXPAT
 	help
 	  pyexpat and xml libraries for Python3.
 
+config BR2_PACKAGE_PYTHON3_XZ
+	select BR2_PACKAGE_XZ
+	bool "xz module"
+	help
+	  xz (a.k.a lzma) module for Python3
+
 config BR2_PACKAGE_PYTHON3_ZLIB
 	bool "zlib module"
 	select BR2_PACKAGE_ZLIB
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 393b9fb..b3f31c0 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -103,6 +103,10 @@ ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_XZ),y)
+PYTHON3_DEPENDENCIES += xz
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_ZLIB),y)
 PYTHON3_DEPENDENCIES += zlib
 endif
-- 
2.9.3
