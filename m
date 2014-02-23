From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Feb 2014 00:40:52 +0100
Subject: [Buildroot] [PATCH 05/13] toolchain/external/custom: add choice to
	select 'AT_LEAST_XXX' header version
In-Reply-To: <cover.1393198603.git.yann.morin.1998@free.fr>
References: <cover.1393198603.git.yann.morin.1998@free.fr>
Message-ID: <e925473993a96727db7ab9554acc3f956925cf6b.1393198603.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Select the appropriate BR2_TOOLCHAIN_HEADERS_AT_LEAST_XXX options for the
external, custom toolchain backend.

We try to be conservative here, and default to kernel headers 2.6.x.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

---
Changes v1 -> v2:
  - add help entry  (Thomas DS)
---
 toolchain/toolchain-external/Config.in | 79 ++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9c4ee28..d119880 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -945,6 +945,85 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
+	bool "External toolchain kernel headers series"
+	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM
+	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
+	help
+	  Set to the kernel headers version that were used to build
+	  this external toolchain.
+
+	  This is used to hide/show some packages that have strict
+	  requirements on the version of kernel headers.
+
+	  If unsure what version your toolchain is using, you can look
+	  at the value of LINUX_VERSION_CODE in linux/version.h in your
+	  toolchain. The Linux version is M.m.p, with:
+	    M = ( LINUX_VERSION_CODE >> 16 ) & 0xFF
+	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
+	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13
+	bool "3.13.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12
+	bool "3.12.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_11
+	bool "3.11.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10
+	bool "3.10.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9
+	bool "3.9.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_8
+	bool "3.8.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_7
+	bool "3.7.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_6
+	bool "3.6.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_5
+	bool "3.5.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_4
+	bool "3.4.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_3
+	bool "3.3.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2
+	bool "3.2.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_1
+	bool "3.1.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_0
+	bool "3.0.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
+	bool "2.6.x"
+
+endchoice
+
+choice
 	prompt "External toolchain C library"
 	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
-- 
1.8.3.2
