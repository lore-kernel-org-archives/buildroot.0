From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 15 Mar 2018 09:55:58 -0300
Subject: [Buildroot] [PATCH 1/5] tmp2-tss: remove architecture restriction
Message-ID: <20180315125602.26186-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Followingig a suggestion from Peter Korsgaard, remove the restriction to
x86 and x86_64. It is preferable to expose the package unless there is a
build time dependency on an architecture or the package is specific to a
certain SoC or board.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/tpm2-tss/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 1eb69d3e93..ebf0fd262d 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
-	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_LIBURIPARSER
 	help
 	  OSS implementation of the Trusted Computing Group's (TCG) TPM2
-- 
2.14.3
