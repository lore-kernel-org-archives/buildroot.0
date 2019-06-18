From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 18 Jun 2019 10:45:33 +0200
Subject: [Buildroot] [PATCH 2/4] toolchain: bug 90620 has not been fixed in
 gcc 8.x
In-Reply-To: <20190618084535.75870-1-giulio.benetti@micronovasrl.com>
References: <20190618084535.75870-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190618084535.75870-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gcc bug 90620 appears on gcc 8.x so remove version check dependency and
keep only the BR2_microblaze one.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 toolchain/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3f562e8d3c..db3ce3cf24 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -154,11 +154,10 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
 # ICE: in do_output_reload, at reload1.c:7978 on microblaze.
-# It's been fixed on Gcc 8.x but reappeared on Gcc 9.x
+# It's still not fixed in gcc 9.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	bool
 	default y if BR2_microblaze
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
-- 
2.17.1
