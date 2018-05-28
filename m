From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:12:14 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] toolchain/buildroot: fix
 default of C library choice
Message-ID: <20180528142834.51B9C805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91bc7e042f741c42a740ac49b7f9ef1c9526f57b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The BR2_TOOLCHAIN_UCLIBC symbol doesn't exist, it was meant to be
BR2_TOOLCHAIN_BUILDROOT_UCLIBC.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d0527483fae228c31c3bb36aeba347c0a8df4eba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 9668f8d41a..3f576297aa 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -22,7 +22,7 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 choice
 	prompt "C library"
-	default BR2_TOOLCHAIN_UCLIBC
+	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
