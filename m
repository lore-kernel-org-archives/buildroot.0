From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Fri, 4 Oct 2019 11:53:15 +0200
Subject: [Buildroot] [PATCH 1/1] uacme: fix c99 detection on microblazeel,
 powerpc
Message-ID: <20191004095315.g6arwc7yy46c4o6u@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

microblazeel http://autobuild.buildroot.net/results/bc715a2f53f72630ae13e3d226e6a029915c4ee4
powerpc      http://autobuild.buildroot.net/results/07d5e454ffd11527d70268681fe15e9de77379e4

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
 package/uacme/uacme.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 999cc36..c920a90 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -13,6 +13,10 @@ UACME_LICENSE = GPL-3.0+
 UACME_LICENSE_FILES = COPYING
 UACME_DEPENDENCIES = libcurl
 
+ifneq (,$(filter $(ARCH),microblazeel powerpc))
+UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+endif
+
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
-- 
2.1.4
