From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:12:32 +0200
Subject: [Buildroot] [git commit] package/busybox: re-enable SELinux support
 on ARC
Message-ID: <20191009221024.72514800A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6ce2699b95ea00c491a5b9986d2adf25fd67894
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libselinux is now available on ARC, so we can re-enable the SELinux
support in Busybox on ARC as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index cddf9f3908..be8b0e4799 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -40,7 +40,6 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 	bool "Enable SELinux support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_arc
 	select BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 	select BR2_PACKAGE_LIBSELINUX
 	help
