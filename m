From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 20:40:18 +0100
Subject: [Buildroot] [git commit] libmicrohttpd: disable curl testcases
Message-ID: <20140301194456.58FC78AC85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25c438bce1c02775f2c23d8878ab71c3022b0c95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They require a toolchain with IPv6. Fixes:
http://autobuild.buildroot.net/results/edb/edb1b5ee1ffaa6a495b4d7c2976f618c8331b5d2/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmicrohttpd/libmicrohttpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 95d066d..2312a4d 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -8,7 +8,7 @@ LIBMICROHTTPD_VERSION = 0.9.34
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-LIBMICROHTTPD_CONF_OPT = --disable-spdy
+LIBMICROHTTPD_CONF_OPT = --disable-curl --disable-spdy
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPLv2.1+
