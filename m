From: Sven Neumann <neumann@teufel.de>
Date: Fri, 22 Nov 2013 23:00:41 +0100
Subject: [Buildroot] [PATCH 1/2] mpg123: do not disable optimizations
Message-ID: <1385157641.14731.34.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


It seems pointless to disable even the default optimizations.
If at all this should be made dependant on the values of the
BR2_OPTIMIZE variables.

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/mpg123/mpg123.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.4.2
