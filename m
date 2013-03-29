From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Mar 2013 08:19:52 -0300
Subject: [Buildroot] [PATCH 3/6] intltool: host variant needs host-gettext
In-Reply-To: <1364555995-32259-1-git-send-email-gustavo@zacarias.com.ar>
References: <1364555995-32259-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1364555995-32259-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes issues like:
http://autobuild.buildroot.net/results/1c7d2e50b622179aff469fddedaa4dc2015fb496/
http://autobuild.buildroot.net/results/7d85ff51b339f1da720bb079eb05e7fba179f101/
and probably a lot more.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/intltool/intltool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 19b5238..1a32a79 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -8,7 +8,7 @@ INTLTOOL_VERSION = 0.40.6
 INTLTOOL_SOURCE = intltool-$(INTLTOOL_VERSION).tar.bz2
 INTLTOOL_SITE = http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/
 
-HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
+HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
 HOST_INTLTOOL_CONF_OPT = \
   PERLLIB=$(HOST_DIR)/usr/lib/perl
 
-- 
1.8.1.5
