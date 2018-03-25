From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 22:07:22 +0200
Subject: [Buildroot] [git commit] package/libss7: propagate dependency from
 dahdi-tools
Message-ID: <20180325200728.D5D2483B53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76e6837cd670449740f21015a406d722e089a084
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
