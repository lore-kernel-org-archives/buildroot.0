From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 May 2019 20:30:01 +0200
Subject: [Buildroot] [PATCH 05/15] toolchain: add gcc 9 entry
In-Reply-To: <20190506183011.4856-1-romain.naour@gmail.com>
References: <20190506183011.4856-1-romain.naour@gmail.com>
Message-ID: <20190506183011.4856-6-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to add gcc 9 support for internal and external toolchain in
follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_9 symbol.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 8c5a4fb88e..467d6bd84f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -500,10 +500,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_8
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
2.14.5
