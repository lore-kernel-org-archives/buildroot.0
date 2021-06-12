From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:40:05 +0200
Subject: [Buildroot] [git commit] package/libfreefare: requires DES support
 in openssl
Message-ID: <20210612210930.48CB8836F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f40ffd17fcf94bd5e745425960f8fe737014ba13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/889ac8e5799e5b48c5964592acefb67feec1c021

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libfreefare/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
index b330b2256a..574787e83b 100644
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBFREEFARE
 	bool "libfreefare"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBNFC
 	help
 	  Library for high level manipulation of MIFARE cards.
