From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 20 Feb 2017 08:57:34 -0300
Subject: [Buildroot] [PATCH v2 2/4] toolchain: add 4.10.x choice for headers
In-Reply-To: <1487591856-22997-1-git-send-email-festevam@gmail.com>
References: <1487591856-22997-1-git-send-email-festevam@gmail.com>
Message-ID: <1487591856-22997-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None

 toolchain/toolchain-common.in                                        | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 96d5709..379006d 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -243,10 +243,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	default "4.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	default "4.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 	default "4.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index ed2b082..668ea3d 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -89,6 +89,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10
+	bool "4.10.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9
 	bool "4.9.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
-- 
2.7.4
