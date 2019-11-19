From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 08:56:43 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/kodi: drop
 readline dependency
Message-ID: <20191119074953.502B5821B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24acf3d9e3d44a1f1a1eb635a10111acf4e60f2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

{python-,}readline is (no longer) a required dependency of kodi, and
readline (GPL-3.0+) is not license compatible with kodi (GPL-2.0), so drop
the dependency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6d588b718de3cc17aee95462fd356933c6470006)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in | 2 --
 package/kodi/kodi.mk   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 279b4ead0d..28c56ac1b5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -81,12 +81,10 @@ menuconfig BR2_PACKAGE_KODI
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
index 590af15b7c..db6ae2f5ca 100644
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
