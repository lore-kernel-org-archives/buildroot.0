From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu,  9 Aug 2018 14:31:27 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "package/mono: remove target mips
 architecture"
In-Reply-To: <1533817887-8771-1-git-send-email-angelo@amarulasolutions.com>
References: <1533817887-8771-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1533817887-8771-2-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 0f96073561badde3c7abdf338abca7d00dba56dd cause the
newly released mono version (5.14.0.177) fixed the bug upstream.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mono/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index a375a98..63208fe 100644
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
-- 
2.7.4
