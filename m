From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 May 2010 09:13:14 +0200
Subject: [Buildroot] [git commit master] linux-fusion: add dependency on
	!BR2_KERNEL_none
Message-ID: <20100511071422.76AE6AA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6040190e920674913c0dd3dc4391a8590735f0fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linux-fusion is composed of a kernel module, and linux-fusion.mk uses
several variable definitions that only exist when Buildroot compiles a
kernel.

We also add the same dependency to BR2_PACKAGE_DIRECTFB_MULTI, which
relies on linux-fusion.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/Config.in     |    1 +
 package/linux-fusion/Config.in |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 5e81b7e..8a0a736 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -10,6 +10,7 @@ if BR2_PACKAGE_DIRECTFB
 config BR2_PACKAGE_DIRECTFB_MULTI
 	bool "directfb multi application"
 	select BR2_PACKAGE_LINUX_FUSION
+	depends on !BR2_KERNEL_none
 	help
 	  Enable use of multiple concurrent DirectFB applications
 
diff --git a/package/linux-fusion/Config.in b/package/linux-fusion/Config.in
index 6fb5260..ebd00b4 100644
--- a/package/linux-fusion/Config.in
+++ b/package/linux-fusion/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_LINUX_FUSION
+	depends on !BR2_KERNEL_none
 	bool "linux-fusion communication layer for DirectFB multi"
 	help
 	  DirectFB Communication Layer allowing multiple DirectFB
-- 
1.6.3.3
