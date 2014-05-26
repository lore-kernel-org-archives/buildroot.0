From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 12:13:38 +0200
Subject: [Buildroot] [git commit] python2: Fix disabling module bsddb
Message-ID: <20140526102400.DB59D9CDD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b9d07fb5d4c334d14966e1ee599d7fcbb42fdeb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using this minimal defconfig

BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_BERKELEYDB=y

the current code does not prevent the build of

output/build/python-2.7.6/Modules/_bsddb.o

because the module is really called _bsddb,
see python-2.7.6/Modules/_bsddb.c, line 9604.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/python-110-optional-db.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python/python-110-optional-db.patch b/package/python/python-110-optional-db.patch
index ea756da..a3e5fe8 100644
--- a/package/python/python-110-optional-db.patch
+++ b/package/python/python-110-optional-db.patch
@@ -70,7 +70,7 @@ Index: b/configure.ac
 +	AS_HELP_STRING([--disable-bsddb], [disable BerkeyleyDB]),
 +	[ if test "$enableval" = "no"; then
 +    	     BSDDB=no
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bsddb"
++    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _bsddb"
 +  	  else
 +	     BSDDB=yes
 +  	  fi], [ BSDDB=yes ])
