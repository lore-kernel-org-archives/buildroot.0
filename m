From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:12:16 +0200
Subject: [Buildroot] [git commit] package/rhash: requires RMD160 support in
 openssl
Message-ID: <20210612115002.3B1448368E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35aded3c8bd0bd9af148b68d6ee230beb62da32e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable RMD160 in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/e3733ad25de55616b2eafff0b489aea2bee65e06

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rhash/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rhash/Config.in b/package/rhash/Config.in
index 2ddcb00feb..35ccb3833e 100644
--- a/package/rhash/Config.in
+++ b/package/rhash/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RHASH
 	bool "rhash"
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  LibRHash is a professional, portable, thread-safe C library
 	  for computing a wide variety of hash sums, such as CRC32,
