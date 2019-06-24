From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 20:54:30 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.1.x series
Message-ID: <20190624190446.ADAA1868B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5de89341827a98cb3af3e18e46104a16b0d4f5ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Includes fixes for the "TCP SACK PANIC" vulnerability:

https://access.redhat.com/security/vulnerabilities/tcpsack

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 19f6b3281c03a1892900723c47cc766e6770e862)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 95ee1cf542..0bc9612551 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.1.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.1.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 6477991daa..497e8e4d6f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 39063041532579cb7e9fab5837313a8e6639c1c583cd39c72b313b3abfa9fbcf  linux-5.1.10.tar.xz
+sha256 11fd93207290272389ad284b8b042041d088fbee0ed5798e933bf8e91697d219  linux-5.1.11.tar.xz
 sha256 98d307a546c95a215dee675ffa4b63c2a7a29e7af839f0d8dfb96dbb61aac2d7  linux-5.0.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 7afa920d776f8ca3fc3ced5026cc02c5ccc960c58314050982c307589b5a8d70  linux-4.19.51.tar.xz
-sha256 6a2e89504d8560b132ab743a0206ffce026bff2697b705819421c5f125633970  linux-4.14.126.tar.xz
-sha256 8fcd223e11cba322801bc38cdb8b581d64c0115f585dcb6604de8561b574fced  linux-4.9.181.tar.xz
-sha256 b2ab69813192d49b1b7f89257a3319ef3fd73a54f441f3296d68b744b1c681d3  linux-4.4.181.tar.xz
+sha256 266ee655620c3689ae94761970d6827fffc919760caf815427ad22730ba4381e  linux-4.19.52.tar.xz
+sha256 d7464c2379cdee46548ae9f848671f4669d4003af4034f3f738f2f0511ec75b3  linux-4.14.127.tar.xz
+sha256 b16e12681a0638368479d73a9b1b8e9407c1ae4b7ae52fdf236d9e5657999695  linux-4.9.182.tar.xz
+sha256 c409d88f61cd9a37cbba36d5d9c8162263eb1e5c9380efaf880a3ec10cd88527  linux-4.4.182.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3ddf4a75f6..2bdce9b7f8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -297,12 +297,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.181"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.181"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.126"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.51"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.182"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.182"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.127"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.52"	if BR2_KERNEL_HEADERS_4_19
 	default "5.0.21"	if BR2_KERNEL_HEADERS_5_0
-	default "5.1.10"	if BR2_KERNEL_HEADERS_5_1
+	default "5.1.11"	if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
