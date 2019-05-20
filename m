From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 20 May 2019 22:39:49 +0200
Subject: [Buildroot] [PATCH] toolchain: specify GCC_BUG_85180 is true only
 if GCC version < 8.x
Message-ID: <20190520203949.120720-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
has been fixed on Gcc version >= 8.x

So:
- add 'depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8' to 'config
  BR2_TOOLCHAIN_HAS_GCC_BUG_85180'.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 8c5a4fb88e..6421f6fcbb 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -129,6 +129,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 	bool
 	default y if BR2_microblaze
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862
 # An infinite loop exists in the find_base_term() logic of 6.x
-- 
2.17.1
