From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 2 Nov 2015 15:56:51 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain: add 4.3.x choice for headers
Message-ID: <1446476213-28962-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-common.in          | 5 +++++
 toolchain/toolchain-external/Config.in | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 4e880a2..6871d8b 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -231,10 +231,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 	default "4.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
 	default "4.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
 	default "4.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 4291394..3f6b8e8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1030,6 +1030,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3
+	bool "4.3.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_2
 	bool "4.2.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
-- 
2.4.10
