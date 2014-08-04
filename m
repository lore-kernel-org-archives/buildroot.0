From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  3 Aug 2014 23:29:22 -0300
Subject: [Buildroot] [PATCH 1/3] toolchain: add 3.16 choice for headers
Message-ID: <1407119364-17135-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-common.in          | 5 +++++
 toolchain/toolchain-external/Config.in | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 48ba840..6d43700 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -213,10 +213,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "3.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 	default "3.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	default "3.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	default "3.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index b524ac7..e210011 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -960,6 +960,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16
+	bool "3.16.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_15
 	bool "3.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
-- 
1.8.5.5
