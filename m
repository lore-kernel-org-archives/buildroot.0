From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  9 Feb 2017 18:47:57 +0100
Subject: [Buildroot] [PATCH 4/6] arch/sparc: mark SPARCv8 as affected by GCC
	PR libstdc++/64735
In-Reply-To: <20170209174759.15819-1-joerg.krause@embedded.rocks>
References: <20170209174759.15819-1-joerg.krause@embedded.rocks>
Message-ID: <20170209174759.15819-5-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SPARCv8 does not support always lock-free atomic ints. Therefore,
exception_ptr, nested_exception, and future from libstdc++ are not
available before GCC 7.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 arch/Config.in.sparc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 307540fdb..85b7c8cd8 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -9,6 +9,7 @@ choice
 config BR2_sparc_v8
 	bool "v8"
 	depends on BR2_sparc
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 config BR2_sparc_leon3
 	bool "leon3"
 	depends on BR2_sparc
-- 
2.11.1
