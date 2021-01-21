From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 21 Jan 2021 14:36:31 +0100
Subject: [Buildroot] [PATCH 04/15] package/rauc: add RAUC_CPE_ID_VENDOR
In-Reply-To: <20210121133639.7332-1-heiko.thiery@gmail.com>
References: <20210121133639.7332-1-heiko.thiery@gmail.com>
Message-ID: <20210121133639.7332-4-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:pengutronix:rauc is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/detail/850005?namingFormat=2.3&orderBy=CPEURI&keyword=rauc&status=FINAL

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/rauc/rauc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index fd39f000a8..51087e9f36 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -9,6 +9,7 @@ RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
 RAUC_LICENSE_FILES = COPYING
+RAUC_CPE_ID_VENDOR = pengutronix
 RAUC_DEPENDENCIES = host-pkgconf openssl libglib2 dbus
 
 ifeq ($(BR2_PACKAGE_RAUC_NETWORK),y)
-- 
2.30.0
