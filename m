From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 May 2021 15:22:07 +0300
Subject: [Buildroot] [PATCH next] package/wget: enable MD4 and DES support
 in openssl
Message-ID: <2ffb7d4dbe4777e9554e7bb132e5e3a9a91993cc.1622118127.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NTLM support in wget requires MD4 and DES. Make sure that openssl
supports these algorithms.

Fixes:
http://autobuild.buildroot.net/results/a342a4547dce1551e141c06c454f6e5f0830b671/
http://autobuild.buildroot.net/results/12b1f6f701b46a1dd2de5e32c86beecf590b6530/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wget/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wget/Config.in b/package/wget/Config.in
index acb20f8f0993..9459fc971a58 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_WGET
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Network utility to retrieve files from http, https and ftp.
 
-- 
2.30.2
