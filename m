From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 11:14:26 +0200
Subject: [Buildroot] [PATCH]
 toolchain/toolchain-external/toolchain-external-andes-nds32: add missing
 dependencies/select
Message-ID: <20190528091426.10302-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This external toolchain is pre-built for x86, so it can only work on
x86 and x86-64, and for the latter, the ia32 libraries are necessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/toolchain-external-andes-nds32/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
index 2596fc3c8b..9c937b8c44 100644
--- a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
@@ -2,6 +2,8 @@ config BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
 	bool "Andes nds32"
 	depends on BR2_nds32
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
-- 
2.21.0
