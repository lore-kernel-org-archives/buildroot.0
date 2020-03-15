From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 16:07:52 +0100
Subject: [Buildroot] [git commit] package/kodi: needs python 2to3 library
Message-ID: <20200315145537.479248027C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b5d07b7d07cbde919d75002643b5436e022d3f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kodi is in transition to support python3 instead of python2:
https://kodi.wiki/view/General_information_about_migration_to_Python_3

"For Kodi 18 (Leia), only addons that are compatible with both Python 2
 and 3 will be accepted to the official addon repository."

Some of these addons depend on the Kodi addon script.module.future to
provide support for both python versions.

The script.module.future addon contains python-future:
https://kodi.wiki/view/General_information_about_migration_to_Python_3#Future
which in turn needs lib2to3 to be included in the target build of
python2: http://python-future.org/automatic_conversion.html

Kodi addons depending on the script.module.future addon are crashing on
buildroot due to lib2to3 missing in the build.

LibreELEC added lib2to3 to python2 to fix the problem:
https://forum.libreelec.tv/thread/21239-lib2to3-pgen2-parse-missing/
https://github.com/LibreELEC/LibreELEC.tv/pull/4147

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index fd08f3de61..81bd3874f0 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -92,6 +92,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
+	select BR2_PACKAGE_PYTHON_2TO3
 	select BR2_PACKAGE_PYTHON_BSDDB
 	select BR2_PACKAGE_PYTHON_CURSES
 	select BR2_PACKAGE_PYTHON_PYEXPAT
