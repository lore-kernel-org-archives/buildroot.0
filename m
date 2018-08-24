From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:44:29 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] dahdi-tools: unify
 dependencies comments
Message-ID: <20180824083650.CCA838E5E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=850e1d03a9a2626b585f977795cdcb47f82efc7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

The threads dependency comment is currently shown even though the
toolchain supports threads, only because kernel build is disabled.

Merge the kernel and threads comments. This is similar to what we have
in other packages that need the kernel.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f70b13a7cb6eb01e9d78fddcb695b84a22e5699b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dahdi-tools/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/dahdi-tools/Config.in b/package/dahdi-tools/Config.in
index 39042df041..a5f145dfe8 100644
--- a/package/dahdi-tools/Config.in
+++ b/package/dahdi-tools/Config.in
@@ -15,9 +15,5 @@ config BR2_PACKAGE_DAHDI_TOOLS
 
 	  http://www.asterisk.org/downloads/dahdi
 
-# Two comments, otherwise it may not fit in menuconfig for narrow terminals
-comment "dahdi-tools needs a toolchain w/ threads"
+comment "dahdi-tools needs a toolchain w/ threads and a Linux kernel to be built"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LINUX_KERNEL
-
-comment "dahdi-tools needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
