From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2015 23:31:28 +0100
Subject: [Buildroot] [git commit] package/fastd: propagate libcap dependency
Message-ID: <20151114223226.A4F4981D42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40b29611dbc6518d4e3bb99c00823ea0a123466c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcap neds headers >= 3.0, so propagate that down to fastd which
selects libcap.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alexander Dahl <post@lespocky.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fastd/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 07118f3..4170ea1 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FASTD
 	bool "fastd"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	select BR2_PACKAGE_LIBUECC
 	select BR2_PACKAGE_LIBSODIUM
 	select BR2_PACKAGE_LIBCAP
@@ -21,6 +22,7 @@ config BR2_PACKAGE_FASTD_STATUS_SOCKET
 
 endif
 
-comment "fastd needs a toolchain w/ threads"
+comment "fastd needs a toolchain w/ threads, headers >= 3.0"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
