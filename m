From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 May 2016 21:15:18 +0200
Subject: [Buildroot] [git commit branch/next] toolchain: add 4.6.x choice
	for headers
Message-ID: <20160516192028.18EDA80260@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51800d20b98e69b7572e607093c548558a9cf493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
