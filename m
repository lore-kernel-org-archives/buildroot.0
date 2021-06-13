From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 09:26:13 +0200
Subject: [Buildroot] [git commit] package/snmppp: requires DES support in
 openssl
Message-ID: <20210613065532.D8A107FB28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab7312a3f90c65f2171bf85dcdff590c8de227ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/2aece7e503d36ebee2bce526f11b2400b9df761e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/snmppp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index de1a09ca4b..1f05f53f9f 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -23,6 +23,7 @@ config BR2_PACKAGE_SNMPPP_SNMPV3
 	default y
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Enable optional support for SNMP++. This selects OpenSSL.
 
