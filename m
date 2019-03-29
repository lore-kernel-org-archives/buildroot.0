From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:00:52 +0100
Subject: [Buildroot] [git commit] package/mtd: add openssl optional
 dependency
Message-ID: <20190329155722.187B689046@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1d1347bde41d35630d65898d27d87b99a519cb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mkfs.ubifs now uses openssl when available.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mtd/mtd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index aa19e94c39..94c8b8b1da 100644
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
