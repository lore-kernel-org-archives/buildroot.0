From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Feb 2014 18:27:23 +0100
Subject: [Buildroot] [PATCH 04/10] toolchain/external: add choice to select
	'AT_LEAST_XXX' header version
In-Reply-To: <cover.1392571021.git.yann.morin.1998@free.fr>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
Message-ID: <74d76e7816e2de0eccb9a24acd0b768c22078dfa.1392571021.git.yann.morin.1998@free.fr>
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
 toolchain/toolchain-external/Config-headers.in | 65 ++++++++++++++++++++++++++
 toolchain/toolchain-external/Config.in         |  2 +
 2 files changed, 67 insertions(+)
 create mode 100644 toolchain/toolchain-external/Config-headers.in

diff --git a/toolchain/toolchain-external/Config-headers.in b/toolchain/toolchain-external/Config-headers.in
new file mode 100644
index 0000000..60ac384
--- /dev/null
+++ b/toolchain/toolchain-external/Config-headers.in
@@ -0,0 +1,65 @@
+choice
+	bool "External toolchain kernel headers"
+	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM
+	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13
+	bool "3.13"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12
+	bool "3.12"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_11
+	bool "3.11"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10
+	bool "3.10"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9
+	bool "3.9"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_8
+	bool "3.8"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_7
+	bool "3.7"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_6
+	bool "3.6"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_5
+	bool "3.5"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_4
+	bool "3.4"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_3
+	bool "3.3"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2
+	bool "3.2"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_1
+	bool "3.1"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_0
+	bool "3.0"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
+	bool "2.6.x"
+
+endchoice
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f02f89b..3dd1c10 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -912,6 +912,8 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL
 
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
+source "toolchain/toolchain-external/Config-headers.in"
+
 choice
 	prompt "External toolchain C library"
 	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
-- 
1.8.1.2
