From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 May 2010 23:26:40 +0200
Subject: [Buildroot] [PATCH 6/9] linux-fusion: add dependency on
	!BR2_KERNEL_none
In-Reply-To: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c8617ac61f2728a706f305e3e971c1c3ad22ec8f.1273440344.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linux-fusion is composed of a kernel module, and linux-fusion.mk uses
several variable definitions that only exist when Buildroot compiles a
kernel.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-fusion/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
