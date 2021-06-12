From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:11:07 +0200
Subject: [Buildroot] [git commit] package/transmission: requires RC4 support
 in openssl
Message-ID: <20210612114933.6A3577FBEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6676ca56f93b3892f05ab78735b14a46ad139c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable RC4 in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/c658beb245cbf06786aa4155c7649c3e1a613e39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - move the 'select' of the option closer to the 'select' on openssl
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/transmission/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index dac4d1b330..980b042e33 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_TRANSMISSION
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBEVENT
 	help
