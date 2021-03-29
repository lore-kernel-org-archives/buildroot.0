From: Alexander Dahl <post@lespocky.de>
Date: Mon, 29 Mar 2021 21:29:05 +0200
Subject: [Buildroot] [PATCH] package/fastd: add FASTD_CPE_ID_VERSION
In-Reply-To: <20210329152803.594a910f@windsurf.home>
References: <20210329152803.594a910f@windsurf.home>
Message-ID: <20210329192905.19883-1-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With that FASTD_CPE_ID expands to:

    cpe:2.3:a:fastd_project:fastd:21.0:*:*:*:*:*:*:*

That's the same as listed on
https://nvd.nist.gov/products/cpe/detail/826746

Signed-off-by: Alexander Dahl <post@lespocky.de>
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

base-commit: 86d70b64815ca5ced09525d0537e48aa69f6976c
-- 
2.20.1
