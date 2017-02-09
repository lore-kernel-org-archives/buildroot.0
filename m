From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  9 Feb 2017 18:47:55 +0100
Subject: [Buildroot] [PATCH 2/6] arch: mark NIOS II as affected by GCC PR
	libstdc++/64735
In-Reply-To: <20170209174759.15819-1-joerg.krause@embedded.rocks>
References: <20170209174759.15819-1-joerg.krause@embedded.rocks>
Message-ID: <20170209174759.15819-3-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NIOS II does not support always lock-free atomic ints. Therefore,
exception_ptr, nested_exception, and future from libstdc++ are not
available before GCC 7.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 arch/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in b/arch/Config.in
index 7149b2cb3..31e674d92 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -154,6 +154,7 @@ config BR2_mips64el
 config BR2_nios2
 	bool "Nios II"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	help
 	  Nios II is a soft core processor from Altera Corporation.
 	  http://www.altera.com/
-- 
2.11.1
