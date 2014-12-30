From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Dec 2014 23:22:07 +0100
Subject: [Buildroot] [PATCH 1/4] toolchain: add hidden option to specify it
	has libssp
In-Reply-To: <cover.1419977553.git.yann.morin.1998@free.fr>
References: <cover.1419977553.git.yann.morin.1998@free.fr>
Message-ID: <bab875399305fe78248df7fd33030e3aeb066d37.1419977553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although SSP support is usuaaly provided by the C library, some
toolchains may provide it using an alternate libssp implementation, most
notably the one from gcc.

Add a new option a toolchain may select if it provides SSP support using
a separate libssp.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 2ee2019..9be5420 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -44,6 +44,9 @@ config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 config BR2_TOOLCHAIN_HAS_SSP
 	bool
 
+config BR2_TOOLCHAIN_HAS_LIBSSP
+	bool
+
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	help
-- 
1.9.1
