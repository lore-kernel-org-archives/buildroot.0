From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  9 Jun 2020 00:13:43 +0200
Subject: [Buildroot] [PATCH 1/5] toolchain: add gcc 10 entry
Message-ID: <20200608221347.2639059-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to add gcc 10 support for internal and external toolchain in
follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_10 symbol.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6865199ffc..83f5286701 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -591,10 +591,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "10"	if BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	default "9"	if BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	default "8"	if BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	default "7"	if BR2_TOOLCHAIN_GCC_AT_LEAST_7
-- 
2.25.4
