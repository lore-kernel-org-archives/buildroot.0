From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:48:42 +0200
Subject: [Buildroot] [git commit] package/python3: add optional support for
	lzma
Message-ID: <20161009204943.6C359819F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d4bdb272644675a54ac4a3e7621273ce72db6b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by the upcoming python-mwscrape2slob package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: move "select" after "bool".]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/Config.in  | 6 ++++++
 package/python3/python3.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 0f4fc88..bf2cd7c 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -98,6 +98,12 @@ config BR2_PACKAGE_PYTHON3_PYEXPAT
 	help
 	  pyexpat and xml libraries for Python3.
 
+config BR2_PACKAGE_PYTHON3_XZ
+	bool "xz module"
+	select BR2_PACKAGE_XZ
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
