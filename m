From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:22 -0000
Subject: [Buildroot] [git commit] toolchain: add 4.18.x choice for headers
Message-ID: <20180907111530.4E056811F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f62d8122bc42b84608cad34fb005b4870c143d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in                                                  | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3a53a32a6d..1cba82af8e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -340,10 +340,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 	default "4.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 	default "4.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 	default "4.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 6a9921c149..4639232bfb 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,6 +123,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_18
+	bool "4.18.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_17
 	bool "4.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
