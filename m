From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 3 May 2019 17:25:47 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.0.x series
Message-ID: <20190503152133.AA13684659@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a79bb4871a0f091b012421789b8bae56bf09707
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a800a40af7..debba03ec1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.0.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.0.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 1af2cb110f..e5a88d9899 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 ea1c1323c2c7e70bebf5463619b543f9bc353730b44ac62d9efadd4fe5625e76  linux-5.0.10.tar.xz
+sha256 18db623665cad3802e79eef22830fc2aac8a76c41cd3c3ae6cc4bbe245957fa0  linux-5.0.11.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 ecb0b30ec32c0c7d614c394158c7d37099a815507ed62235cca32052d7ff9c65  linux-4.19.37.tar.xz
-sha256 b75e1dcfabc8d18051a07cbf9b60eaee8ac470a2311fed20447fd0d022c19e15  linux-4.14.114.tar.xz
-sha256 431cd992bf74da9851dd5938dbe45ff7577219b84b237ae5e30067d483b57f01  linux-4.9.171.tar.xz
+sha256 6a3fdfa02dbc61ee8120ff0947a6eb0d6595b9bbe27e30a1b6f53b905f0bcd7f  linux-4.19.38.tar.xz
+sha256 b7ae61711a1323053d68fd47911b92977afd526d302755518e42744251516186  linux-4.14.115.tar.xz
+sha256 49428e30989cc0b069a6f4b7bc08988deb02d10f910ca0c4d1e44b22155eb40e  linux-4.9.172.tar.xz
 sha256 2c6a9d2765ef182f2470afed5af74de6c435ba9aaf422af54db8c5dc2b4f27d1  linux-4.4.179.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 78a14071ff..61fcdc7a9f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -294,11 +294,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.179"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.171"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.114"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.37"	if BR2_KERNEL_HEADERS_4_19
+	default "4.9.172"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.115"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.38"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
-	default "5.0.10"	if BR2_KERNEL_HEADERS_5_0
+	default "5.0.11"	if BR2_KERNEL_HEADERS_5_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
