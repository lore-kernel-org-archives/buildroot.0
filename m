From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
Date: Thu, 4 Apr 2019 09:01:11 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/3] toolchain: add
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
Message-ID: <1905283465.159802.1554361271608.JavaMail.zimbra@kalray.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clement Leger <clement.leger@kalray.eu>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 552220123f..8c5a4fb88e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -404,10 +404,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	default "5.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 	default "4.20" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	default "4.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
-- 
2.15.0.276.g89ea799
