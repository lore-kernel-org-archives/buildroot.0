From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Jun 2021 21:58:13 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/lvm2: default
 standard install to y
Message-ID: <20210621201128.354A08D259@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cc35cb59908769480e08290759416e0a8746e51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Until commit 5c07dfcc1a52e2804011574a3e022523a20546c8
BR2_PACKAGE_LVM2_STANDARD_INSTALL would default to y. Indeed, the
default read:

      default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11

Since the legacy symbol is normally not selected, this defaults to y.

Commit 5c07dfcc1a52e2804011574a3e022523a20546c8 inadvertedly removed the
entire line instead of just the condition.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=13846
For-stable: 2021.02, 2021.05
Cc: dominique.tronche at atos.net
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6d758f59e65c33b067076cdb89a8404d5471c7ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 5e767e2e97..2d4d6a2bba 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -26,6 +26,7 @@ if BR2_PACKAGE_LVM2
 
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
+	default y
 	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
