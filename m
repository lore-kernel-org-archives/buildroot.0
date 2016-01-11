From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2016 17:32:41 +0100
Subject: [Buildroot] [git commit] toolchain: add 4.4.x choice for headers
Message-ID: <20160111163526.932BA826C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df2ad61b5e18a84369ecf4552b3322ec1c6d40d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in          | 5 +++++
 toolchain/toolchain-external/Config.in | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 6871d8b..014a23d 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -235,10 +235,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 	default "4.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 	default "4.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
 	default "4.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e3b5ad5..baa8a05 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -679,6 +679,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4
+	bool "4.4.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3
 	bool "4.3.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
