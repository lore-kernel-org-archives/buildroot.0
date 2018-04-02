From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  2 Apr 2018 15:00:26 +0200
Subject: [Buildroot] [PATCH v2 1/3] toolchain: add 4.16.x choice for headers
Message-ID: <20180402130028.4518-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 toolchain/Config.in                                                  | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index b33eaffd52..e2ef1e7ef3 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -323,10 +323,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 	default "4.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	default "4.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	default "4.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 6c12b1619c..8cc9db6841 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -108,6 +108,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16
+	bool "4.16.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_15
 	bool "4.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
-- 
2.14.2
