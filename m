From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 29 May 2018 23:52:54 +0200
Subject: [Buildroot] [PATCH v3 for-next 2/5] toolchain: add gcc 8 entry
In-Reply-To: <20180529215257.17686-1-romain.naour@gmail.com>
References: <20180529215257.17686-1-romain.naour@gmail.com>
Message-ID: <20180529215257.17686-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to add gcc 8 support for internal and external toolchain in
follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_8 symbol.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 77f95ee1c3..064bd4c28c 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -404,10 +404,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "8"	if BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	default "7"	if BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	default "6"	if BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	default "5"	if BR2_TOOLCHAIN_GCC_AT_LEAST_5
-- 
2.14.3
