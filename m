From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 14:45:33 +0200
Subject: [Buildroot] [git commit] package/log4cpp: force autoreconf
Message-ID: <20170903123825.54A16819A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c32ead07479285c72c0b94885cbce1fc0a71456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream provided configure script produces a broken
log4cpp-1.1.3/log4cpp/include/log4cpp/config.h file with its custom
AC_CREATE_PREFIX_CONFIG_H m4 macro. Running autoreconf fixes this
problem.

Fixes
http://autobuild.buildroot.net/results/9be23d91098d2f3724bb9535333fed8d27ef992a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/log4cpp/log4cpp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
index aab05f2..8664a54 100644
--- a/package/log4cpp/log4cpp.mk
+++ b/package/log4cpp/log4cpp.mk
@@ -13,6 +13,9 @@ LOG4CPP_LICENSE = LGPL-2.1+
 LOG4CPP_LICENSE_FILES = log4cpp/COPYING
 LOG4CPP_INSTALL_STAGING = YES
 LOG4CPP_CONF_OPTS = --enable-doxygen=no --enable-dot=no
+# needed to fix broken configure script
+LOG4CPP_AUTORECONF = YES
+LOG4CPP_AUTORECONF_OPTS = -I m4
 
 # The default <pkg>_CONFIG_SCRIPTS handling does not apply
 define LOG4CPP_STAGING_CONFIG_SCRIPT_FIXUP
