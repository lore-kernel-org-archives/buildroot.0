From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:06:52 +0200
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-andes-nds32: add missing
 dependencies/select
Message-ID: <20190530220727.BF58688692@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5179649bc9b53ff29b881d7b755ad0d28ff10aba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This external toolchain is pre-built for x86, so it can only work on
x86 and x86-64, and for the latter, the ia32 libraries are necessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in | 2 ++
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
