From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Oct 2009 09:28:40 +0100
Subject: [Buildroot] [git commit master] Allow for specifying kernel version
	manually
Message-ID: <20091027082900.A8D20775E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=434b007fce010a471c64164a3e22b13f4440159d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index f3d5530..07f9f4d 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -39,9 +39,11 @@ choice
 	config BR2_KERNEL_HEADERS_2_6_31
 		bool "Linux 2.6.31.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_VERSION
+		bool "Linux 2.6 (manually specified version)"
+
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Linux 2.6 snapshot"
-
 endchoice
 
 config BR2_KERNEL_HEADERS_RT
@@ -50,6 +52,13 @@ config BR2_KERNEL_HEADERS_RT
 	help
 	  Apply Ingo's realtime extensions to linux
 
+config BR2_DEFAULT_KERNEL_VERSION
+	string "linux version"
+	depends on BR2_KERNEL_HEADERS_VERSION
+	help
+	  Specify the version you want to use.
+	  E.g.: 2.6.31.2
+
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
@@ -59,4 +68,4 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.30.9"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.5"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
-
+	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.6.3.3
