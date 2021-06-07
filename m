From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:41 -0000
Subject: [Buildroot] [git commit] package/libcurl: make sure openssl
 supports DES
Message-ID: <20210607144655.7092E814AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f25c820a4f93ad0ca7eaf5e504667bd4099b878c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DES support in openssl is optional since commit a83d41867c8d
("package/libopenssl: add option to enable some features"). curl uses
DES support in openssl when enabled. Select DES support to avoid build
failure.

Fixes:
http://autobuild.buildroot.net/results/8931fd2b71eb2490cdc041b47eff58377ac823da/
http://autobuild.buildroot.net/results/f159195adf05c375d7d314a270afd3a55d43ebdd/
http://autobuild.buildroot.net/results/e143c75bccd7bcd4216954b76099404a38cf9bc1/

Cc: Erwan GAUTRON <erwan.gautron@bertin.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcurl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index b89c46f5ef..466f9ee3a1 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -51,6 +51,7 @@ choice
 config BR2_PACKAGE_LIBCURL_OPENSSL
 	bool "OpenSSL"
 	depends on BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 
 config BR2_PACKAGE_LIBCURL_BEARSSL
 	bool "BearSSL"
