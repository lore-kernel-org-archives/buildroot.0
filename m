From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 May 2018 16:17:48 +0200
Subject: [Buildroot] [git commit] libcoap: needs host-pkgconf
Message-ID: <20180525141648.84E198270E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=861103a1ad48460ef33357c703b39336e4a07d82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libcoap configure script uses pkg-config.

Fixes:
http://autobuild.buildroot.net/results/746/746c6dcbf3f941c7baa5b382bd264d830d839be1/
http://autobuild.buildroot.net/results/d98/d9840a22ae5eb6572b6641b93f8beadc27d2abb5/
http://autobuild.buildroot.net/results/905/905f122213ad9623ea5dd9d32c352efd151319f3/

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcoap/libcoap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 31a6822dd3..4f87886ba0 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -9,6 +9,7 @@ LIBCOAP_SITE = $(call github,obgm,libcoap,$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = GPL-2.0+ or BSD-2-Clause
 LIBCOAP_LICENSE_FILES = COPYING LICENSE.GPL LICENSE.BSD
+LIBCOAP_DEPENDENCIES = host-pkgconf
 LIBCOAP_CONF_OPTS = --disable-examples
 LIBCOAP_AUTORECONF = YES
 
