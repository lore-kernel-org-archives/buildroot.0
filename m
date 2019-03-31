From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:02:16 +0200
Subject: [Buildroot] [git commit] package/rpm: fix threads comment
Message-ID: <20190331130146.2BC2B88125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1940ef66d7cf85259744f86b97bfee271416a4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rpm depends on pthreads because it uses it, not because of beecrypt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpm/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index aa857ef2be..58451a9fcc 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_RPM
 	bool "rpm"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_BERKELEYDB
