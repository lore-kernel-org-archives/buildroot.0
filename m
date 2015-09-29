From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Sep 2015 09:55:48 +0300
Subject: [Buildroot] [PATCH] dos2unix: needs host-gettext
Message-ID: <7d8f19570aef65d2409bb7025251f73e6844a889.1443509748.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dos2unix uses xgettext to generate its .pot file.

Fixes:
http://autobuild.buildroot.net/results/eda/eda7eeb2fdf7a22c299858ac99d1b1953b15575e/
http://autobuild.buildroot.net/results/aaf/aaf2b77f964eb6259e2e4b1d5a13838c3a1eef21/
http://autobuild.buildroot.net/results/922/92289b63ebdf133ab910f058ffca8ba34e574208/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dos2unix/dos2unix.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 55608c653f9c..f448e1406d5f 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -11,7 +11,9 @@ DOS2UNIX_LICENSE_FILES = COPYING.txt
 DOS2UNIX_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 HOST_DOS2UNIX_DEPENDENCIES =
 
-ifeq ($(BR2_ENABLE_LOCALE),)
+ifeq ($(BR2_ENABLE_LOCALE),y)
+DOS2UNIX_DEPENDENCIES += host-gettext
+else
 DOS2UNIX_MAKE_OPTS += ENABLE_NLS=
 endif
 
-- 
2.5.3
