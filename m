From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Jun 2013 00:28:32 -0300
Subject: [Buildroot] [PATCH] freetype: fix includedir
Message-ID: <1371094112-7523-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set includedir to point to staging because freetype-config and
freetype2.pc otherwise point to /usr/include causing all kind of havoc
because it expands configure --prefix now instead of using the
.pc/-config one.

Fixes:
http://autobuild.buildroot.net/results/1c7/1c70ce0ff350623cc38baf4b8b61c8a7a8586aba/
...and many others.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 16f00fe..4ea678b 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -9,6 +9,7 @@ FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
+FREETYPE_CONF_OPT = --includedir="$(STAGING_DIR)/usr/include"
 FREETYPE_LICENSE = Dual FTL/GPLv2+
 FREETYPE_LICENSE_FILES = docs/FTL.TXT docs/GPLv2.TXT
 FREETYPE_DEPENDENCIES = host-pkgconf \
-- 
1.8.1.5
