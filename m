From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Mar 2016 09:28:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/lirc-tools: needs host-libxslt
Message-ID: <1458376107-14776-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e5c/e5c4199a77b66a67da1060d1e9b74150c1c12a7e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lirc-tools/lirc-tools.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index ccdc8d3..2e437a6 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -9,9 +9,10 @@ LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
 LIRC_TOOLS_LICENSE = GPLv2+
 LIRC_TOOLS_LICENSE_FILES = COPYING
-LIRC_TOOLS_DEPENDENCIES = host-pkgconf
+LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf
 LIRC_TOOLS_INSTALL_STAGING = YES
 
+LIRC_TOOLS_CONF_ENV = XSLTPROC=yes
 LIRC_TOOLS_CONF_OPTS = --without-x
 
 define LIRC_TOOLS_INSTALL_INIT_SYSV
-- 
2.7.0
