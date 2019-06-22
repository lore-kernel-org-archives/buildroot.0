From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:36:32 +0200
Subject: [Buildroot] [git commit] toolchain: gcc bug 90620 has not been
 fixed in gcc 8.x
Message-ID: <20190622185146.93F4B8270F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed2cb94787a3dac9aa164cac7fce36764d24bba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc bug 90620 appears with gcc 8.x so remove the version check
dependency and keep only the BR2_microblaze one.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6d1696ea83..82d2658a1d 100644
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
