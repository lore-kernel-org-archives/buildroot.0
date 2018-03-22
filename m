From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 22 Mar 2018 17:27:49 -0300
Subject: [Buildroot] [PATCH 3/6] tpm2-abrmd: declare dependency on a
 toolchain with C++
In-Reply-To: <20180322202752.2562-1-casantos@datacom.ind.br>
References: <20180322202752.2562-1-casantos@datacom.ind.br>
Message-ID: <20180322202752.2562-4-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It depends on tpm2-tss, whose current version contains C++ code.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/tpm2-abrmd/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
index 31c5ae7d6b..5c236d1d5c 100644
--- a/package/tpm2-abrmd/Config.in
+++ b/package/tpm2-abrmd/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_TPM2_ABRMD
 
 	  https://github.com/tpm2-software/tpm2-abrmd
 
-comment "tpm2-abrmd needs a toolchain w/ wchar, threads"
+comment "tpm2-abrmd needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.14.3
