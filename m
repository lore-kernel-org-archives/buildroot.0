From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 14:34:04 +0200
Subject: [Buildroot] [git commit] mtd-utils-2.1.2: ubihealthd depends on
 ubifs support
Message-ID: <20210613120349.3689D8B70A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a15b79728a738665f65bd39c8b085d6b04375c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ubihealthd is only being built, if mtd-utils are being built
--with-ubifs. Reflect that dependency within buildroot.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998 at free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mtd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index c7ad3b3cdc..26b7797718 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -140,6 +140,7 @@ config BR2_PACKAGE_MTD_UBIFORMAT
 config BR2_PACKAGE_MTD_UBIHEALTHD
 	bool "ubihealthd"
 	default y
+	depends on BR2_PACKAGE_MTD_UBIFS_UTILS
 
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
