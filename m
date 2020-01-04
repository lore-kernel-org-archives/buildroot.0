From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 16:56:51 +0100
Subject: [Buildroot] [PATCH 2/2] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.4.x series
In-Reply-To: <20200104155651.3511603-1-bernd.kuhls@t-online.de>
References: <20200104155651.3511603-1-bernd.kuhls@t-online.de>
Message-ID: <20200104155651.3511603-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 93e89a0702..80cfb9e300 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.88-cip16" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.82-cip14-rt5" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 97d77dc785..454d51d227 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 568e9f27fbba86131c2e2849f296d54216e2ed3e8c4d8aa78a93b417cab23ec0  linux-5.4.5.tar.xz
+sha256 abc9b21d9146d95853dac35f4c4489a0199aff53ee6eee4b0563d1b37079fcc9  linux-5.4.7.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 5da5e16fe08fa506f8f74aa4f17be22b52c0f513e9a3f7e7ae22fc53597ad493  linux-4.4.206.tar.xz
-sha256 1df27899a9bc4dd874f3830ab9e7b638f0026dffd67a2e230444e5d2805ccad6  linux-4.9.206.tar.xz
-sha256 e8d42d3a1b85d180141e9bc11c4a0e87f8a413c0e989b0f24c1b7c40f8a826f2  linux-4.14.159.tar.xz
-sha256 29d86c0a6daf169ec0b4b42a12f8d55dc894c52bd901f876f52a05906a5cf7fd  linux-4.19.90.tar.xz
+sha256 5899ff2a85e2b84607148349fd8e646f94399655caf0e4e55d1eb0567e48520e  linux-4.4.208.tar.xz
+sha256 b7ad1c9841d671d026c55a4c91c77205f8b488ca5f980f838591c68662e0525a  linux-4.9.208.tar.xz
+sha256 f65170224cd4359ce8b2793b492bd8127abdd0b91350484e001bce13f0c98b4b  linux-4.14.162.tar.xz
+sha256 29c37cf8bbfa717ce98bc931371c35fcee3482734ad5faba32d02aff209883a2  linux-4.19.92.tar.xz
 # Locally computed
 sha256 6d60ce76bce2e1938f64027d12b1988c95245751feb635adfc551a021d5b3f26  linux-cip-4.19.88-cip16.tar.gz
 sha256 74ec782e11344e5c5db8e48899b464e296ef37acfb43ce7dfb01c09ea8d3e959  linux-cip-4.19.82-cip14-rt5.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c0ca531bcf..6977d6d422 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -309,11 +309,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.206"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.206"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.159"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.90"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.5"		if BR2_KERNEL_HEADERS_5_4
+	default "4.4.208"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.208"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.162"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.92"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.7"		if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
