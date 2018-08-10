From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 15:27:42 +0200
Subject: [Buildroot] [git commit branch/next] Revert "package/mono: remove
 target mips architecture"
Message-ID: <20180810132109.4AD648B894@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5cb6b99ec7d0c7b38332c6f83b21e7e492680e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit 0f96073561badde3c7abdf338abca7d00dba56dd cause the
newly released mono version (5.14.0.177) fixed the bug upstream.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mono/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index a375a98448..63208fef49 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	bool
-	default y if (BR2_arm || BR2_armeb || BR2_i386 || \
-		      BR2_powerpc || BR2_x86_64)
+	default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
+		      BR2_mipsel || BR2_powerpc || BR2_x86_64)
 	depends on BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MONO
