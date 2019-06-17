From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 19:41:41 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{0, 1}.x series
Message-ID: <20190617174130.49E158165D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2676d4fb2ab72f8756d23a8f2661ba57cf8ebbd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a6a16deee0..95ee1cf542 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.1.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.1.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index edb3839e0f..6477991daa 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 9d68a206b0808d81ce582c861d0bda0d1095bcbd0f181db063665b68fc9cf478  linux-5.1.6.tar.xz
-sha256 3ba720f3189e5a08e7c533da8c12595d662a6c11d3466db6a0ff164ef4e54b68  linux-5.0.20.tar.xz
+sha256 39063041532579cb7e9fab5837313a8e6639c1c583cd39c72b313b3abfa9fbcf  linux-5.1.10.tar.xz
+sha256 98d307a546c95a215dee675ffa4b63c2a7a29e7af839f0d8dfb96dbb61aac2d7  linux-5.0.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 5d08f3890e7ca2b94529675120f170c5b764f795e6dd184a1190c23a40ef5365  linux-4.19.47.tar.xz
-sha256 25f58cb56bde388ac9bcee984f5f2d0ca094b0a8af6b92ad1f5b2fd0e6725b85  linux-4.14.123.tar.xz
-sha256 d25a490d62a3e96a587333e163862585eac4086fc8d4893b4ec1711e7d387c5f  linux-4.9.180.tar.xz
-sha256 1a450217d381bb7fd259d026d3b7a57c717e8d1f66754cd6fcc9df3c4a8a6a7a  linux-4.4.180.tar.xz
+sha256 7afa920d776f8ca3fc3ced5026cc02c5ccc960c58314050982c307589b5a8d70  linux-4.19.51.tar.xz
+sha256 6a2e89504d8560b132ab743a0206ffce026bff2697b705819421c5f125633970  linux-4.14.126.tar.xz
+sha256 8fcd223e11cba322801bc38cdb8b581d64c0115f585dcb6604de8561b574fced  linux-4.9.181.tar.xz
+sha256 b2ab69813192d49b1b7f89257a3319ef3fd73a54f441f3296d68b744b1c681d3  linux-4.4.181.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f75e834505..eb957b4f12 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -301,12 +301,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.180"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.180"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.123"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.47"	if BR2_KERNEL_HEADERS_4_19
-	default "5.0.20"	if BR2_KERNEL_HEADERS_5_0
-	default "5.1.6"		if BR2_KERNEL_HEADERS_5_1
+	default "4.4.181"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.181"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.126"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.51"	if BR2_KERNEL_HEADERS_4_19
+	default "5.0.21"	if BR2_KERNEL_HEADERS_5_0
+	default "5.1.10"	if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
