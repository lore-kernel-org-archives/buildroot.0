From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 11 Dec 2016 20:01:49 -0200
Subject: [Buildroot] [PATCH] toolchain: add 4.9.x choice for headers
Message-ID: <1481493709-20669-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 toolchain/toolchain-common.in                                        | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index bf9dc7b..7a217b6 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -228,10 +228,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	default "4.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 	default "4.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	default "4.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 5ff2491..ed2b082 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -89,6 +89,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9
+	bool "4.9.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_8
 	bool "4.8.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
-- 
2.7.4
