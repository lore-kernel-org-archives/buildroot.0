From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:44:08 +0200
Subject: [Buildroot] [git commit] package/znc: requires blowfish support in
 openssl
Message-ID: <20210612211620.4C8F68101A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a66ceb1a4681d94ff32234a0f1f1ca7b6c459287
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable blowfish in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/600f2b09da919d511df87d3f19fea71149c1260c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/znc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/znc/Config.in b/package/znc/Config.in
index 4fc7bbb95b..915b5f632c 100644
--- a/package/znc/Config.in
+++ b/package/znc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_ZNC
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Advanced IRC bouncer
 
