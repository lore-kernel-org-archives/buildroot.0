From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 15:27:34 +0200
Subject: [Buildroot] [git commit branch/next] package/mono: remove target
 mips architecture
Message-ID: <20180810132109.422CB8B899@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=726184ebf107254189713b56b157e10da6817e73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Current version of mono doesn't compile on mips due to a bug, so
disabling the mips target architecture until the bug is fixed upstream.

Fixes: http://autobuild.buildroot.net/results/b402af8cb7f00dc2e69c219926b474a8e0c8d372
and many others.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mono/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index 63208fef49..a375a98448 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	bool
-	default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
-		      BR2_mipsel || BR2_powerpc || BR2_x86_64)
+	default y if (BR2_arm || BR2_armeb || BR2_i386 || \
+		      BR2_powerpc || BR2_x86_64)
 	depends on BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MONO
