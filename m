From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 12:33:54 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/fastd: add
 FASTD_CPE_ID_VERSION
Message-ID: <20210403100914.CEBF08B564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed9993c307d8ae973620e339479f7f77141b2de8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

With that FASTD_CPE_ID expands to:

    cpe:2.3:a:fastd_project:fastd:21.0:*:*:*:*:*:*:*

That's the same as listed on
https://nvd.nist.gov/products/cpe/detail/826746

Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ebe599de08ec4aa521d9eeb0d6eb452c1285774f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fastd/fastd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index bbec63d963..c1db1cc472 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -9,6 +9,7 @@ FASTD_SITE = https://github.com/NeoRaider/fastd/releases/download/v$(FASTD_VERSI
 FASTD_SOURCE = fastd-$(FASTD_VERSION).tar.xz
 FASTD_LICENSE = BSD-2-Clause
 FASTD_LICENSE_FILES = COPYRIGHT
+FASTD_CPE_ID_VERSION = $(FASTD_VERSION).0
 FASTD_DEPENDENCIES = host-bison host-pkgconf libuecc libsodium
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
