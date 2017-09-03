From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  3 Sep 2017 19:58:31 -0300
Subject: [Buildroot] [PATCH 1/4] toolchain: add 4.13.x choice for headers
Message-ID: <1504479514-30816-1-git-send-email-festevam@gmail.com>
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
index dd192b9..d87d4d7 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -249,10 +249,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 	default "4.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	default "4.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
 	default "4.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index ae343dd..a285340 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -93,6 +93,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13
+	bool "4.13.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12
 	bool "4.12.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
-- 
2.7.4
