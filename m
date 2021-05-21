From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 16:00:08 +0200
Subject: [Buildroot] [git commit] package/lvm2: drop legacy default
Message-ID: <20210521133445.74100886DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c07dfcc1a52e2804011574a3e022523a20546c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f289b1b36f5c (legacy: drop options removed more than 5 years ago
now) forgot to remove a legacy default.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lvm2/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index f8bcdffb38..317027929e 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -26,7 +26,6 @@ if BR2_PACKAGE_LVM2
 
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
-	default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11
 	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
