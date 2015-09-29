From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 00:20:30 +0200
Subject: [Buildroot] [git commit] dos2unix: needs host-gettext
Message-ID: <20150929223556.B518481D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ba132b371e0df7892fc73542e73edeb080ac73f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dos2unix uses xgettext to generate its .pot file.

Fixes:
http://autobuild.buildroot.net/results/eda/eda7eeb2fdf7a22c299858ac99d1b1953b15575e/
http://autobuild.buildroot.net/results/aaf/aaf2b77f964eb6259e2e4b1d5a13838c3a1eef21/
http://autobuild.buildroot.net/results/922/92289b63ebdf133ab910f058ffca8ba34e574208/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dos2unix/dos2unix.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 55608c6..f448e14 100644
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
 
