From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Oct 2019 23:13:12 +0200
Subject: [Buildroot] [git commit] package/busybox: selinux support now
 available on !glibc configs
Message-ID: <20191009221023.B9B5481767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae13ad43599d146fc8d4d4ed5dc5ff63df9e77e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libselinux can now be selected for non-glibc toolchains, so
BR2_PACKAGE_BUSYBOX_SELINUX can loose its BR2_TOOLCHAIN_USES_GLIBC
dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index bab00bf835..cddf9f3908 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -40,7 +40,6 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 	bool "Enable SELinux support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
 	select BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 	select BR2_PACKAGE_LIBSELINUX
