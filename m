From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Jul 2017 18:06:34 +0100
Subject: [Buildroot] [PATCH 4/5] toolchains/mips: state that Codescape
	toolchains support -mdspr3
In-Reply-To: <20170721170635.41202-1-Vincent.Riera@imgtec.com>
References: <20170721170635.41202-1-Vincent.Riera@imgtec.com>
Message-ID: <20170721170635.41202-4-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-mdspr3 is not yet available in upstream gcc, but Codescape toolchains
contain the necessary patches for supporting it.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../toolchain-external/toolchain-external-codescape-img-mips/Config.in   | 1 +
 .../toolchain-external/toolchain-external-codescape-mti-mips/Config.in   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index e29c4dcb87..114a1ae724 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -8,6 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_MDSPR3_OPTION
 	help
 	  Codescape IMG GNU Linux Toolchain 2016.05 for the MIPS
 	  architecture, from Imagination Technologies. It uses gcc
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
index efe6f8527e..5cf3c8754e 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -9,6 +9,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_MDSPR3_OPTION
 	help
 	  Codescape MTI GNU Linux Toolchain 2016.05 for the MIPS
 	  architecture, from Imagination Technologies. It uses gcc
-- 
2.13.0
