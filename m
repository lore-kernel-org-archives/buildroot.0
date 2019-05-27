From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 23:05:09 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: GCC bug 68485
Message-ID: <20190527210510.70987-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC <= 9.x hangs while building brotli for the Microblaze Arch:
http://autobuild.buildroot.net/results/d86/d86251974a0a348a64d9a1d1fd7d02dd4aff0792/

Reported:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485

Still not fixed. Every Microblaze Gcc version <= 9.x is affected.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 toolchain/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 829ecd442a..d01a96f8a8 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -131,6 +131,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	default y if !BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS && \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug still
+# exists in gcc 9.x
+config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
+	bool
+	default y if BR2_microblaze
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
 # longer exists in gcc 8.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
-- 
2.17.1
