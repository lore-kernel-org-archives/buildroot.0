From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Nov 2019 16:17:18 +0100
Subject: [Buildroot] [PATCH 05/11] package/kodi: drop readline dependency
In-Reply-To: <20191113151724.12155-1-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
Message-ID: <20191113151724.12155-6-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

{python-,}readline is (no longer) a required dependency of kodi, and
readline (GPL-3.0+) is not license compatible with kodi (GPL-2.0), so drop
the dependency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in | 2 --
 package/kodi/kodi.mk   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 40bee1b898..db6931ed8a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -72,12 +72,10 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_PYTHON_BZIP2
 	select BR2_PACKAGE_PYTHON_CURSES
 	select BR2_PACKAGE_PYTHON_PYEXPAT
-	select BR2_PACKAGE_PYTHON_READLINE
 	select BR2_PACKAGE_PYTHON_SQLITE
 	select BR2_PACKAGE_PYTHON_SSL
 	select BR2_PACKAGE_PYTHON_UNICODEDATA
 	select BR2_PACKAGE_PYTHON_ZLIB
-	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TINYXML
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 028bf551bc..49728e464b 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -38,7 +38,6 @@ KODI_DEPENDENCIES = \
 	openssl \
 	pcre \
 	python \
-	readline \
 	sqlite \
 	taglib \
 	tinyxml \
-- 
2.20.1
