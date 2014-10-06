From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Oct 2014 08:44:39 -0300
Subject: [Buildroot] [PATCH 2/4] toolchain: add 3.17 choice for headers
In-Reply-To: <1412595881-13831-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412595881-13831-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412595881-13831-2-git-send-email-gustavo@zacarias.com.ar>
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
index 82ac26a..2dfaecc 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -213,10 +213,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "3.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	default "3.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 	default "3.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	default "3.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 67ad450..8c94871 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -992,6 +992,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17
+	bool "3.17.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3.17
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16
 	bool "3.16.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
-- 
2.0.4
