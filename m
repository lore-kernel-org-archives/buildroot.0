From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 22:34:26 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.3.x series
Message-ID: <20191031212757.A50A18E383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37adc90231975b3293fca87c4b1a07a53d176b61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6646b220af9db55933dbf4d264f47b9c42de1d3b)
[Peter: drop 5.3.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 93664f7aaa..61e4fb6d72 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.80" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.81" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index fb2f122ca5..33db15ab5b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 80a9ba764e088aa7fddfef5a97c0236905e291468a37832243b6f3828d36e7ec  linux-4.19.80.tar.xz
-sha256 65c5a4b86b858ba58642f46ae8c983990376d1946e59cc7e054e85b1b7eb57b0  linux-4.14.150.tar.xz
-sha256 553568b6728d505da70efa8247a66ad158e849c8f5f40d715612ef4e9ed14a0c  linux-4.9.197.tar.xz
-sha256 9cf484511e51861486d2eafc7373f9e47f9c1f50a82e30614073b51570a0ee7a  linux-4.4.197.tar.xz
+sha256 293ec1ae0f6b3b4be83a217224b51d137f2163cf2d9d294eecf5d0a354e4e29d  linux-4.19.81.tar.xz
+sha256 ff519c428ee9bbb513a84db5ec32a7e3705cd8c23a57104b25b944cb79583fae  linux-4.14.151.tar.xz
+sha256 9572ebfa6ba0efcf9f1ec7b62c7b89baa36a621ab9fd4c5ad025196c549605ac  linux-4.9.198.tar.xz
+sha256 ecf808d88d04086da25bf44288d63a7110dd99948c17bc1162e5301abccff312  linux-4.4.198.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6cdecc8bc2..d581e5916c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.197"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.197"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.150"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.80"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.198"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.198"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.151"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.81"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
