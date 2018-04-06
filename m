From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 19:53:03 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/libss7: propagate
 dependency from dahdi-tools
Message-ID: <20180407175148.07AF37FCCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54dd5d2ec6b8d19e0b59ec71dde21f6fa44b9d93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 76e6837cd670449740f21015a406d722e089a084)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libss7/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libss7/Config.in b/package/libss7/Config.in
index b99c578182..bdf5fbe3a8 100644
--- a/package/libss7/Config.in
+++ b/package/libss7/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSS7
 	bool "libss7"
+	depends on BR2_USE_MMU # dahdi-tools <- perl
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_DAHDI_LINUX
