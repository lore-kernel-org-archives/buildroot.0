From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 15:26:37 +0100
Subject: [Buildroot] [git commit] package/ljsyscall: fix build with aarch64
Message-ID: <20191214141929.AAA9F8A523@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac31b3465ff07b1b5422d1d951b4f7a88e8d5b82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

luajit supports aarch64 since commit
2ca0accc21a090874ac6e97670b47153a1f0a0b5

However this raise a build failure with ljsyscall because aarch64
directory does not exist so use arm64 instead

Fixes:
 - http://autobuild.buildroot.org/results/3a0bd14349b3cab3e09d0b8b24ddab66dfab91ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ljsyscall/ljsyscall.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
index 30b5cde22a..12dfbcb4ae 100644
--- a/package/ljsyscall/ljsyscall.mk
+++ b/package/ljsyscall/ljsyscall.mk
@@ -18,6 +18,8 @@ else ifeq ($(BR2_powerpc),y)
 LJSYSCALL_ARCH = ppc
 else ifeq ($(BR2_arm)$(BR2_armeb),y)
 LJSYSCALL_ARCH = arm
+else ifeq ($(BR2_aarch64),y)
+LJSYSCALL_ARCH = arm64
 else ifeq ($(BR2_mips)$(BR2_mipsel),y)
 LJSYSCALL_ARCH = mips
 else
