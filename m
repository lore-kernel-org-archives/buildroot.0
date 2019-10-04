From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Fri, 4 Oct 2019 15:23:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/uacme: fix c99 detection on
 !wchar toolchains
Message-ID: <20191004132303.uridblmtnvsp2xee@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
 V1->V2: changed as suggested
 http://lists.busybox.net/pipermail/buildroot/2019-October/261596.html

 package/uacme/uacme.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 999cc36..d3d692b 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -13,6 +13,8 @@ UACME_LICENSE = GPL-3.0+
 UACME_LICENSE_FILES = COPYING
 UACME_DEPENDENCIES = libcurl
 
+UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
-- 
2.1.4
