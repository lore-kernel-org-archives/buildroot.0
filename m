From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:11:23 +0200
Subject: [Buildroot] [git commit] package/softether: requires DES,
 MD4 and RC4 support in openssl
Message-ID: <20210612204105.98AF486F32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a2ccdb145c213fe0d36a28a44c69322bcede429
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES, MD4 and RC4 in openssl to fix build failure raised since
commit a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/ce601fb26d143e03adb39c41f2fdfca3b3191127

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - drop conditionals on selects: libopenssl is forced
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/softether/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/softether/Config.in b/package/softether/Config.in
index bfb45b0315..f8933cdc00 100644
--- a/package/softether/Config.in
+++ b/package/softether/Config.in
@@ -6,6 +6,9 @@ config BR2_PACKAGE_SOFTETHER
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4
 	select BR2_PACKAGE_READLINE
 	help
 	  The SoftEther Server is a fully integrated implementation of
