From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 22:02:54 +0200
Subject: [Buildroot] [git commit] package/botan: requires RC4 and RMD160
 support in openssl
Message-ID: <20210613193436.841C38D4FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=617c76b9586a57efed895a79cd4c1e5d720bdff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable RC4 and RMD160 in openssl to fix build failure raised since
commit a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/795671a39b754747725b09cf0e196defd6b0e59a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/botan/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 95367b9000..341fa7c622 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -20,6 +20,8 @@ config BR2_PACKAGE_BOTAN
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Botan is a crypto library for C++
 
