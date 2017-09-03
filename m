From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 11:53:52 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain/buildroot: glibc requires header
	>= 4.5 with NaN-2008
In-Reply-To: <cover.1504432422.git.yann.morin.1998@free.fr>
References: <cover.1504432422.git.yann.morin.1998@free.fr>
Message-ID: <a191b26508b5cddafe1059f13fcd2aa4b2ebd689.1504432422.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index f47001fcf6..94bf1d7a09 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -51,6 +51,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
 	depends on !BR2_powerpc_SPE
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our glibc.mk enables RPC support
-- 
2.11.0
