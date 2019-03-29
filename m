From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Mar 2019 13:44:47 +0300
Subject: [Buildroot] [PATCH 2/2] package/mtd: add openssl optional dependency
In-Reply-To: <4dfb0750e6edabebc3180054ac16ef875d7f41a0.1553856287.git.baruch@tkos.co.il>
References: <4dfb0750e6edabebc3180054ac16ef875d7f41a0.1553856287.git.baruch@tkos.co.il>
Message-ID: <fee15f1f5dd466ce33ec521464ff0c6a44b7cf3d.1553856287.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mkfs.ubifs now uses openssl when available.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mtd/mtd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index aa19e94c39d9..94c8b8b1dabf 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -21,6 +21,12 @@ endif
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
 MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
 MTD_CONF_OPTS += --with-ubifs
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MTD_DEPENDENCIES += openssl
+MTD_CONF_OPTS += --with-crypto
+else
+MTD_CONF_OPTS += --without-crypto
+endif
 else
 MTD_CONF_OPTS += --without-ubifs
 endif
-- 
2.20.1
