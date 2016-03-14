From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Mar 2016 07:14:10 -0300
Subject: [Buildroot] [PATCH 1/3] toolchain: add 4.5.x choice for headers
Message-ID: <1457950452-17459-1-git-send-email-gustavo@zacarias.com.ar>
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
index 1b7b416..46970a6 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -233,10 +233,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	default "4.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 	default "4.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 	default "4.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0b0a1cb..ff759a0 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -818,6 +818,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_5
+	bool "4.5.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4
 	bool "4.4.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
-- 
2.4.10
