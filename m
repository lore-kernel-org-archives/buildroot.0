From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Sep 2017 13:53:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/log4cpp: force autoreconf
Message-ID: <20170903115337.23832-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upstream provided configure script produces a broken
log4cpp-1.1.3/log4cpp/include/log4cpp/config.h file with its custom
AC_CREATE_PREFIX_CONFIG_H m4 macro.
Running autoreconf fixes this problem.

Fixes
http://autobuild.buildroot.net/results/9be/9be23d91098d2f3724bb9535333fed8d27ef992a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/log4cpp/log4cpp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
index aab05f22f..6d6de16d3 100644
--- a/package/log4cpp/log4cpp.mk
+++ b/package/log4cpp/log4cpp.mk
@@ -13,6 +13,8 @@ LOG4CPP_LICENSE = LGPL-2.1+
 LOG4CPP_LICENSE_FILES = log4cpp/COPYING
 LOG4CPP_INSTALL_STAGING = YES
 LOG4CPP_CONF_OPTS = --enable-doxygen=no --enable-dot=no
+LOG4CPP_AUTORECONF = YES
+LOG4CPP_AUTORECONF_OPTS = -I m4
 
 # The default <pkg>_CONFIG_SCRIPTS handling does not apply
 define LOG4CPP_STAGING_CONFIG_SCRIPT_FIXUP
-- 
2.11.0
