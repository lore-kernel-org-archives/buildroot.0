From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 20 Nov 2018 15:30:06 +0200
Subject: [Buildroot] [PATCH next 1/5] toolchain: add 4.19.x choice for
 headers
Message-ID: <fb495883400fc9180b163358cf5c17d2f2c2e7d5.1542720610.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/Config.in                                          | 5 +++++
 .../toolchain-external-custom/Config.in.options              | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index c2192a52b1f3..474e3c8bba9d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -361,10 +361,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	default "4.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 	default "4.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 	default "4.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 8665d2e2a734..288fc3f3e080 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,6 +123,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19
+	bool "4.19.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_18
 	bool "4.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
-- 
2.19.1
