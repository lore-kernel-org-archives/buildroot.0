From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 25 May 2018 07:07:26 +0300
Subject: [Buildroot] [PATCH] libcoap: needs host-pkgconf
Message-ID: <05abd27599f212ded7d70da32f47585784d3cc1a.1527221246.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libcoap configure script uses pkg-config.

Fixes:
http://autobuild.buildroot.net/results/746/746c6dcbf3f941c7baa5b382bd264d830d839be1/
http://autobuild.buildroot.net/results/d98/d9840a22ae5eb6572b6641b93f8beadc27d2abb5/
http://autobuild.buildroot.net/results/905/905f122213ad9623ea5dd9d32c352efd151319f3/

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libcoap/libcoap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 31a6822dd3a2..4f87886ba08c 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -9,6 +9,7 @@ LIBCOAP_SITE = $(call github,obgm,libcoap,$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = GPL-2.0+ or BSD-2-Clause
 LIBCOAP_LICENSE_FILES = COPYING LICENSE.GPL LICENSE.BSD
+LIBCOAP_DEPENDENCIES = host-pkgconf
 LIBCOAP_CONF_OPTS = --disable-examples
 LIBCOAP_AUTORECONF = YES
 
-- 
2.17.0
