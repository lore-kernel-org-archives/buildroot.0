From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Feb 2013 15:43:25 -0300
Subject: [Buildroot] [PATCH] toolchain/kernel-headers: not just 2.6 for
	manual version
Message-ID: <1360176205-12224-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The manual linux headers option may specify versions other than the 2.6
series, so drop the "2.6"

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 710dd13..38e051f 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -43,7 +43,7 @@ choice
 		bool "Linux 3.7.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_VERSION
-		bool "Linux 2.6 (manually specified version)"
+		bool "Manually specified Linux version"
 
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Local Linux snapshot (linux-2.6.tar.bz2)"
-- 
1.7.12.4
