From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 11 Jun 2019 12:29:46 +0200
Subject: [Buildroot] [PATCH v3 04/15] toolchain: add gcc 9 entry
In-Reply-To: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
References: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190611102957.7145-5-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@gmail.com>

In order to add gcc 9 support for internal and external toolchain in
follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_9 symbol.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 2da537e7d4..7726ae6fae 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -507,10 +507,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "9"	if BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	default "8"	if BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	default "7"	if BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	default "6"	if BR2_TOOLCHAIN_GCC_AT_LEAST_6
-- 
2.17.1
