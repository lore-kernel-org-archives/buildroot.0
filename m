From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 Dec 2009 15:59:15 +0100
Subject: [Buildroot] [git commit master] kernel-headers: add 2.6.32
Message-ID: <20091203163920.709DF777B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b80b4051dcdd31e28a7dd2cfad7c1617d2cdd678
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 42173f1..19f0ae8 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -34,10 +34,14 @@ choice
 
 	config BR2_KERNEL_HEADERS_2_6_30
 		bool "Linux 2.6.30.x kernel headers"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_2_6_31
 		bool "Linux 2.6.31.x kernel headers"
+		depends on BR2_DEPRECATED || BR2_RECENT
+
+	config BR2_KERNEL_HEADERS_2_6_32
+		bool "Linux 2.6.32.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
@@ -67,5 +71,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.9"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.6"	if BR2_KERNEL_HEADERS_2_6_31
+	default "2.6.32"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.6.3.3
