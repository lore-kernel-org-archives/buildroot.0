From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2019 18:37:10 +0100
Subject: [Buildroot] [git commit] package/kodi: drop readline dependency
Message-ID: <20191114172951.7C2C88EF32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d588b718de3cc17aee95462fd356933c6470006
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

{python-,}readline is (no longer) a required dependency of kodi, and
readline (GPL-3.0+) is not license compatible with kodi (GPL-2.0), so drop
the dependency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
