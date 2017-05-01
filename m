From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 May 2017 20:54:42 +0200
Subject: [Buildroot] [git commit] toolchain: add 4.11.x choice for headers
Message-ID: <20170501185524.EB3F582853@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a381d855053ef0a6d89cfcd59a4f990b6d41b0fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in                                        | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 379006d..37079fa 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -247,10 +247,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
 	default "4.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	default "4.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	default "4.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 668ea3d..ba5b977 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -89,6 +89,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_11
+	bool "4.11.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10
 	bool "4.10.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
