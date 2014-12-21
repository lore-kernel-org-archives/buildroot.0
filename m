From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 21 Dec 2014 14:34:11 -0300
Subject: [Buildroot] [PATCH] libtool: fix help2man related failure
Message-ID: <1419183251-26734-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libtool sometimes requires help2man to build manpages, but since we
don't use/need them and want to avoid pulling in and/or building
dependencies for that we just disable it. Fixes:
http://autobuild.buildroot.net/results/bfb/bfb9e298196d877b623580f882b6fe74b30bec9b/

Also add host-m4 as dependency, it's not strictly required but silences
many build warnings.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libtool/libtool.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index c392e25..92c6dce 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -8,6 +8,8 @@ LIBTOOL_VERSION = 2.4.4
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
+LIBTOOL_CONF_ENV = HELP2MAN=true
+LIBTOOL_DEPENDENCIES = host-m4
 LIBTOOL_LICENSE = GPLv2+
 LIBTOOL_LICENSE_FILES = COPYING
 
-- 
2.0.4
