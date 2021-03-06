From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Mar 2021 16:46:28 +0100
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_99410
Message-ID: <20210306152449.12FF28679F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d667267b8f7acdb54993981813aaa05d97fdbebe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

belle-sip package fails to build for the Nios2 architecture with
optimization enabled with gcc < 8.x:
http://autobuild.buildroot.net/results/71f26fd81db8e9b19b3f18f3f3cefd9c768f094f/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 553612c4aa..fdc0f9ba59 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -166,6 +166,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 	bool
 	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
+# Error: branch offset out of range on Nios II. This bug
+# no longer exists in gcc >= 8.x.
+config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
+	bool
+	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
