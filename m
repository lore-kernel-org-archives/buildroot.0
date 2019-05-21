From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 21 May 2019 15:39:21 +0200
Subject: [Buildroot] [PATCH v2 01/12] toolchain: specify GCC_BUG_85180 is
 true only if GCC version < 8.x
In-Reply-To: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190521133932.81841-2-giulio.benetti@micronovasrl.com>
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
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 467d6bd84f..d05ad88af4 100644
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
