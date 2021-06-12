From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 12 Jun 2021 11:40:11 +0200
Subject: [Buildroot] [PATCH 2/6] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_11 blind option
In-Reply-To: <20210612094015.6792-1-romain.naour@gmail.com>
References: <20210612094015.6792-1-romain.naour@gmail.com>
Message-ID: <20210612094015.6792-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to add gcc 11 support for internal and external toolchain in
follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_11 symbol.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 0181ef07de..fe327b9f46 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -630,10 +630,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "11"	if BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	default "10"	if BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	default "9"	if BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	default "8"	if BR2_TOOLCHAIN_GCC_AT_LEAST_8
-- 
2.31.1
