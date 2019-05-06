From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 May 2019 09:35:21 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.0.x series
Message-ID: <20190506073032.A5C4B884D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a1fde4b3c84c17284361cd56b10eb093480fe62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index debba03ec1..4875454195 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.0.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.0.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index e5a88d9899..035c324447 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 18db623665cad3802e79eef22830fc2aac8a76c41cd3c3ae6cc4bbe245957fa0  linux-5.0.11.tar.xz
+sha256 bcfd52bf1faa24f5f712146a873959461e001656ad67717e80b947aa6ad53479  linux-5.0.13.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 6a3fdfa02dbc61ee8120ff0947a6eb0d6595b9bbe27e30a1b6f53b905f0bcd7f  linux-4.19.38.tar.xz
-sha256 b7ae61711a1323053d68fd47911b92977afd526d302755518e42744251516186  linux-4.14.115.tar.xz
-sha256 49428e30989cc0b069a6f4b7bc08988deb02d10f910ca0c4d1e44b22155eb40e  linux-4.9.172.tar.xz
+sha256 6fd8cd4d8a15d7bfb4a7968fbe104f97f8c5ff557c752aae43fe13a6ca073fb0  linux-4.19.40.tar.xz
+sha256 a05afa95163eab4ec76dabb51f54aea8c40ef63d5ea2d112ac04e6b79a8e8dbd  linux-4.14.116.tar.xz
+sha256 bc579d904f7d7d04adf03ed66dc8ac0a29d6cc74d989d3aa5c6ae2dedaf51168  linux-4.9.173.tar.xz
 sha256 2c6a9d2765ef182f2470afed5af74de6c435ba9aaf422af54db8c5dc2b4f27d1  linux-4.4.179.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 61fcdc7a9f..6c848aa2e2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -294,11 +294,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.179"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.172"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.115"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.38"	if BR2_KERNEL_HEADERS_4_19
+	default "4.9.173"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.116"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.40"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
-	default "5.0.11"	if BR2_KERNEL_HEADERS_5_0
+	default "5.0.13"	if BR2_KERNEL_HEADERS_5_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
