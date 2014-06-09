From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 Jun 2014 08:30:33 -0300
Subject: [Buildroot] [PATCH 1/3] toolchain: add 3.15 choice for headers
Message-ID: <1402313435-9013-1-git-send-email-gustavo@zacarias.com.ar>
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
index 1573e00..6720c7d 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -180,10 +180,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "3.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	default "3.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	default "3.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	default "3.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f4a5ccf..aa21f22 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1018,6 +1018,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_15
+	bool "3.15.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14
 	bool "3.14.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
-- 
1.8.5.5
