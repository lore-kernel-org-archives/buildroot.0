From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 21:13:25 +0200
Subject: [Buildroot] [git commit] valgrind: allow selection on aarch64
Message-ID: <20180415191653.3CF1181E03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=134b7aca7958a1e12408dd4d7d23217020d032b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

valgrind works fine on aarch64, so allow selecting it on that
architecture.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/valgrind/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 75b779d214..56e4af21fa 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	bool
+	default y if BR2_aarch64
 	default y if BR2_ARM_CPU_ARMV7A
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_i386 || BR2_x86_64
