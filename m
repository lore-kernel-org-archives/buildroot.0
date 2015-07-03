From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri,  3 Jul 2015 11:14:38 +1000
Subject: [Buildroot] [PATCH 1/1] package/libtool: disable makeinfo
Message-ID: <e64f1903478b53f185f3bf114f86c46948a31311.1435886073.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-libtool can fail to build if the host is missing makeinfo, so
disable it.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
Without this patch, buildroot fails to build host-libtool on my Debian
8 system, as it doesn't have the texinfo package installed.

 package/libtool/libtool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 28786d2..8688f8b 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -13,6 +13,7 @@ LIBTOOL_DEPENDENCIES = host-m4
 LIBTOOL_LICENSE = GPLv2+
 LIBTOOL_LICENSE_FILES = COPYING
 
+HOST_LIBTOOL_CONF_ENV = MAKEINFO=true
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
 # We have a patch that affects libtool.m4, which triggers an autoreconf
-- 
2.1.4
