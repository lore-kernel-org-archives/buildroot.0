From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 23:34:14 +0100
Subject: [Buildroot] [git commit] mpg123: do not disable optimizations
Message-ID: <20131201201519.C7E149BE44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73343f2135b7aed811025c2a87bcc59cbe683aab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems pointless to disable even the default optimizations.
If at all this should be made dependant on the values of the
BR2_OPTIMIZE variables.

Signed-off-by: Sven Neumann <neumann@teufel.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 3332249..3db2843 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -7,7 +7,7 @@
 MPG123_VERSION = 1.16.0
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
-MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
+MPG123_CONF_OPT = --disable-lfs-alias
 MPG123_INSTALL_STAGING = YES
 MPG123_LICENSE = LGPLv2.1
 MPG123_LICENSE_FILES = COPYING
