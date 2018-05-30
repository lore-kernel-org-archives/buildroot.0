From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 21:44:12 +0200
Subject: [Buildroot] [git commit branch/next] toolchain: add gcc 8 entry
Message-ID: <20180530202335.B192583497@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0eb91bf1d1a716e2345d68ef4bc18c03f092cf93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In order to add gcc 8 support for internal and external toolchain in
follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_8 symbol.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
