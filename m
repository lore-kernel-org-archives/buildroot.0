From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:12:54 +0200
Subject: [Buildroot] [git commit] package/mender: requires MD4 and RMD160
 support in openssl
Message-ID: <20210612115005.DA6E57FDAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7075cc34558cf650aea96c4e661e374f366dd3eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable MD4 and RMD160 in openssl to fix build failure raised since
commit a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/0b9ad028609f7e3e4eddd4439deaf7b3aa1d1273

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mender/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 5ac8bb1676..cccb46361b 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
