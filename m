From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Nov 2012 17:07:52 -0800
Subject: [Buildroot] [git commit] manual: give example where _INSTALL_TARGET
	= NO
Message-ID: <20121128011239.1FC8997200@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50b32848c2e8065a4b3646a5e0c17a0adb54781e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tutorial for autotools-package and cmake-package currently gives
the bad example of setting _INSTALL_TARGET to YES, which is the default.
So change this into an example with _INSTALL_TARGET = NO, and explain in
which case this is relevant.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-autotools.txt |   16 ++++++++--------
 docs/manual/adding-packages-cmake.txt     |   14 +++++++-------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 4127df4..84d76f9 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -21,8 +21,8 @@ package, with an example :
 07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
 08: LIBFOO_SITE = http://www.foosoftware.org/download
 09: LIBFOO_INSTALL_STAGING = YES
-10: LIBFOO_INSTALL_TARGET = YES
-11: LIBFOO_CONF_OPT = --enable-shared
+10: LIBFOO_INSTALL_TARGET = NO
+11: LIBFOO_CONF_OPT = --disable-shared
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
 13:
 14: $(eval $(autotools-package))
@@ -44,13 +44,13 @@ other libraries or applications depending on them. Also by default, when
 staging installation is enabled, packages are installed in this location
 using the +make install+ command.
 
-On line 10, we tell Buildroot to also install the package to the
+On line 10, we tell Buildroot to not install the package to the
 target directory. This directory contains what will become the root
-filesystem running on the target. Usually, we try not to install header
-files and to install stripped versions of the binary. By default, target
-installation is enabled, so in fact, this line is not strictly
-necessary. Also by default, packages are installed in this location
-using the +make install+ command.
+filesystem running on the target. For purely static libraries, it is
+not necessary to install them in the target directory because they will
+not be used at runtime. By default, target installation is enabled; setting
+this variable to NO is almost never needed. Also by default, packages are
+installed in this location using the +make install+ command.
 
 On line 11, we tell Buildroot to pass a custom configure option, that
 will be passed to the +./configure+ script before configuring
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 4a9e893..bb1705b 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -21,7 +21,7 @@ with an example :
 07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
 08: LIBFOO_SITE = http://www.foosoftware.org/download
 09: LIBFOO_INSTALL_STAGING = YES
-10: LIBFOO_INSTALL_TARGET = YES
+10: LIBFOO_INSTALL_TARGET = NO
 11: LIBFOO_CONF_OPT = -DBUILD_DEMOS=ON
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
 13:
@@ -44,13 +44,13 @@ other libraries or applications depending on them. Also by default, when
 staging installation is enabled, packages are installed in this location
 using the +make install+ command.
 
-On line 10, we tell Buildroot to also install the package to the
+On line 10, we tell Buildroot to not install the package to the
 target directory. This directory contains what will become the root
-filesystem running on the target. Usually, we try not to install header
-files and to install stripped versions of the binary. By default, target
-installation is enabled, so in fact, this line is not strictly
-necessary. Also by default, packages are installed in this location
-using the +make install+ command.
+filesystem running on the target. For purely static libraries, it is
+not necessary to install them in the target directory because they will
+not be used at runtime. By default, target installation is enabled; setting
+this variable to NO is almost never needed. Also by default, packages are
+installed in this location using the +make install+ command.
 
 On line 11, we tell Buildroot to pass custom options to CMake when it is
 configuring the package.
