From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 1 Jun 2009 10:45:02 +0200
Subject: [Buildroot] [git commit] target/Config.in.arch: fix
	BR2_GCC_TARGET_ARCH for arm926t
Message-ID: <20090601084842.008D87783B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9bf6aac83afc83e2a211796418966e00e496a42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Closes #367.

arm926t was wrongly listed as armv4t, and not armv5te - leading to
the following error while compiling the kernel (2.6.28):

  CC      arch/arm/kernel/traps.o
{standard input}: Assembler messages:
{standard input}:1094: Error: selected processor does not support `pld [r6,#0]'

Signed-off-by: Alex Dobrynin <alex_dobrynin@hotmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 29d2b4a..4a20e44 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -659,7 +659,7 @@ config BR2_GCC_TARGET_ARCH
 	default armv4t		if BR2_arm720t
 	default armv4t		if BR2_arm920t
 	default armv4t		if BR2_arm922t
-	default armv4t		if BR2_arm926t
+	default armv5te		if BR2_arm926t
 	default armv5t		if BR2_arm10t
 	default armv6j		if BR2_arm1136jf_s
 	default armv6zk		if BR2_arm1176jz_s
-- 
1.6.0.6
