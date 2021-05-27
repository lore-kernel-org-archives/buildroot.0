From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 May 2021 17:33:00 +0200
Subject: [Buildroot] [git commit] package/wget: enable MD4 and DES support
 in openssl
Message-ID: <20210607144658.48F1B814BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=154b99d0a7fb15756b70736f381ec607d9b564a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NTLM support in wget requires MD4 and DES. Make sure that openssl
supports these algorithms.

Fixes:
http://autobuild.buildroot.net/results/a342a4547dce1551e141c06c454f6e5f0830b671/
http://autobuild.buildroot.net/results/12b1f6f701b46a1dd2de5e32c86beecf590b6530/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wget/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wget/Config.in b/package/wget/Config.in
index acb20f8f09..ba03a75e7a 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_WGET
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Network utility to retrieve files from http, https and ftp.
 
