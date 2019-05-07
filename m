From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 19:45:08 +0200
Subject: [Buildroot] [git commit] package/linux-headers: drop support 4.20
 headers
Message-ID: <20190507180403.DDD147FB3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3bba8e4254ebeabf6fe1a2573b315b5bd4b450c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that support for 5.1 headers have been added, drop support for the
obsolete 4.20 series.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 3d49ea476a..549b4d5351 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,7 +2,6 @@
 sha256 d06a7be6e73f97d1350677ad3bae0ce7daecb79c2c2902aaabe806f7fa94f041  linux-5.1.tar.xz
 sha256 bcfd52bf1faa24f5f712146a873959461e001656ad67717e80b947aa6ad53479  linux-5.0.13.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
 sha256 6fd8cd4d8a15d7bfb4a7968fbe104f97f8c5ff557c752aae43fe13a6ca073fb0  linux-4.19.40.tar.xz
 sha256 a05afa95163eab4ec76dabb51f54aea8c40ef63d5ea2d112ac04e6b79a8e8dbd  linux-4.14.116.tar.xz
 sha256 bc579d904f7d7d04adf03ed66dc8ac0a29d6cc74d989d3aa5c6ae2dedaf51168  linux-4.9.173.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 66366628c5..2042702eb9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -45,10 +45,6 @@ config BR2_KERNEL_HEADERS_4_19
 	bool "Linux 4.19.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 
-config BR2_KERNEL_HEADERS_4_20
-	bool "Linux 4.20.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-
 config BR2_KERNEL_HEADERS_5_0
 	bool "Linux 5.0.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
@@ -305,7 +301,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.173"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.116"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.40"	if BR2_KERNEL_HEADERS_4_19
-	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default "5.0.13"	if BR2_KERNEL_HEADERS_5_0
 	default "5.1"		if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
