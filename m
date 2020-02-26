From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 21:56:25 +0100
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_93847
Message-ID: <20200226210241.E95118EB50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb05f25ef2aacae8811e89daea51bd5a953636c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

git package fails to build for the Nios2 architecture with optimization
enabled with gcc < 9.x:
http://autobuild.buildroot.net/results/924/92484c49b655e4aa78ca52f124c6d8f605b9d06b/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 87509f3d64..bff572805d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -159,6 +159,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	bool
 	default y if BR2_microblaze
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
+# ICE: compiler error: Segmentation fault on Nios II. This bug
+# no longer exists in gcc 9.x.
+config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
+	bool
+	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
