From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 13 Jun 2019 06:50:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/vdr-plugin-vnsiserver: needs
 host-gettext
Message-ID: <20190613045042.31272-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

msgfmt is needed to build vdr-plugin-vnsiserver
https://github.com/FernetMenta/vdr-plugin-vnsiserver/blob/master/Makefile#L106

On hosts which provide msgfmt the build succeeds

msgmerge -U --no-wrap --no-location --backup=none -q -N po/lt_LT.po po/vnsiserver.pot
msgmerge -U --no-wrap --no-location --backup=none -q -N po/de_DE.po po/vnsiserver.pot
msgfmt -c -o po/lt_LT.mo po/lt_LT.po
msgfmt -c -o po/de_DE.mo po/de_DE.po

On other systems the build fails:

msgmerge -U --no-wrap --no-location --backup=none -q -N po/de_DE.po po/vnsiserver.pot
msgmerge -U --no-wrap --no-location --backup=none -q -N po/lt_LT.po po/vnsiserver.pot
fopen: No such file or directory
fopen: No such file or directory

Hopefully fixes
http://autobuild.buildroot.net/results/777/77784c9c169b7cee63ad331c5af9eede1ab0ee00/
and many others.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
index 20644d3f6b..0919cf722e 100644
--- a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
@@ -8,7 +8,7 @@ VDR_PLUGIN_VNSISERVER_VERSION = v1.8.0
 VDR_PLUGIN_VNSISERVER_SITE = $(call github,FernetMenta,vdr-plugin-vnsiserver,$(VDR_PLUGIN_VNSISERVER_VERSION))
 VDR_PLUGIN_VNSISERVER_LICENSE = GPL-2.0+
 VDR_PLUGIN_VNSISERVER_LICENSE_FILES = COPYING
-VDR_PLUGIN_VNSISERVER_DEPENDENCIES = vdr
+VDR_PLUGIN_VNSISERVER_DEPENDENCIES = host-gettext vdr
 
 VDR_PLUGIN_VNSISERVER_CXXFLAGS = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC"
 
-- 
2.20.1
