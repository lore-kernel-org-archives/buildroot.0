From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  5 Mar 2021 16:37:30 +0100
Subject: [Buildroot] [PATCH] toolchain: disable gcc bug 68485 if gcc version
 >= 10.x
Message-ID: <20210305153730.3671327-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since gcc version 10.x bug 68485 doesn't show anymore, so let's make it
enabled up to versino 10.x excluded.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 553612c4aa..0cd8b82059 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -131,11 +131,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	default y if !BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS && \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug still
-# exists in gcc 9.x
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug no
+# longer exists in gcc 10.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 	bool
 	default y if BR2_microblaze
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
 # longer exists in gcc 8.x.
-- 
2.25.1
