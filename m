From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  2 Sep 2020 08:17:53 +0200
Subject: [Buildroot] [PATCH v2,3/3] package/zeromq: disable -Werror
In-Reply-To: <20200902061753.3668480-1-fontaine.fabrice@gmail.com>
References: <20200902061753.3668480-1-fontaine.fabrice@gmail.com>
Message-ID: <20200902061753.3668480-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will avoid the following build failure with openpgm 5.3:

In file included from /home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/include/pgm-5.3/pgm/skbuff.h:39,
                 from /home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/include/pgm-5.3/pgm/msgv.h:33,
                 from /home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/include/pgm-5.3/pgm/pgm.h:44,
                 from src/ip.cpp:67:
/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/include/pgm-5.3/pgm/socket.h:207:1: error: ?const char* pgm_family_string(int)? defined but not used [-Werror=unused-function]
  207 | pgm_family_string (
      | ^~~~~~~~~~~~~~~~~

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zeromq/zeromq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 04f7e7d3f2..ac8a09eaaa 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -8,7 +8,7 @@ ZEROMQ_VERSION = 4.3.2
 ZEROMQ_SITE = https://github.com/zeromq/libzmq/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
-ZEROMQ_CONF_OPTS = --without-documentation
+ZEROMQ_CONF_OPTS = --disable-Werror --without-documentation
 ZEROMQ_LICENSE = LGPL-3.0+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
 # We're patching acinclude.m4
-- 
2.28.0
