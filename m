From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 11:50:34 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/wireguard-linux-compat: tweak kernel-headers < 5.6 logic
Message-ID: <20200508093729.D38B491054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b3ca0be160ae5a2b1ee5da26772f02d7f130f6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The reason why the external wireguard kernel module is not allowed with
kernel headers >= 5.6 is that wireguard is included in the upstream kernel
since 5.6 rather than some kind of (fixable) incompatibility issue.  Adjust
the comment to make that clear.

While we're at it, drop the redundant !5.6 dependency on the kernel headers
dependency comment.  If headers are older than 3.10, then they are also
older than 5.6, so the statement is redundant.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 74a865b1fc85352b814d032fa8725ace13f27eca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/wireguard-linux-compat/Config.in b/package/wireguard-linux-compat/Config.in
index 6e41a0951b..5a323a35e5 100644
--- a/package/wireguard-linux-compat/Config.in
+++ b/package/wireguard-linux-compat/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
 	depends on BR2_LINUX_KERNEL
 	# kernel module requires 3.10+
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-	# kernel module incompatible with 5.6+
+	# kernel module in upstream linux since 5.6
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 	help
 	  WireGuard is an extremely simple yet fast and modern VPN
@@ -23,5 +23,4 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
 
 comment "wireguard-linux-compat needs a toolchain w/ headers >= 3.10"
 	depends on BR2_LINUX_KERNEL
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
