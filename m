From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 May 2016 08:58:12 -0300
Subject: [Buildroot] [PATCH 1/3] toolchain: add 4.6.x choice for headers
Message-ID: <1463399894-9649-1-git-send-email-gustavo@zacarias.com.ar>
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
index be02484..1fe28a9 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -241,10 +241,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 	default "4.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	default "4.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 	default "4.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index b7f9241..a037d67 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -769,6 +769,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_6
+	bool "4.6.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_5
 	bool "4.5.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
-- 
2.7.3
