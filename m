From: Wade Berrier <wberrier@gmail.com>
Date: Tue, 6 Sep 2011 13:10:23 -0600
Subject: [Buildroot] [PATCH] intltool: use built host libexpat during
	configure
Message-ID: <20110906191020.GA29969@berrier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding this fix the build in one of my environments (rhel5).  Otherwise, the configure
check for the perl module failed.

Wade

set LD_LIBRARY_PATH during configure so libexpat is found when checking for XML::Parser

Signed-off-by: Wade Berrier <wberrier@gmail.com>
---
 package/intltool/intltool.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 746ebb1..45b52ed 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -9,7 +9,8 @@ INTLTOOL_SITE:=http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/
 
 HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
 HOST_INTLTOOL_CONF_OPT = \
-  PERLLIB=$(HOST_DIR)/usr/lib/perl
+  PERLLIB=$(HOST_DIR)/usr/lib/perl \
+  LD_LIBRARY_PATH=$(HOST_DIR)/usr/lib
 
 $(eval $(call AUTOTARGETS,package,intltool))
 $(eval $(call AUTOTARGETS,package,intltool,host))
-- 
1.7.0.4
