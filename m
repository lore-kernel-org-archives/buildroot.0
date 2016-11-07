From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:04 +0100
Subject: [Buildroot] [PATCH v4 09/22] toolchain-external-codesourcery-arm:
	Cortex-A12 and Cortex-A17 not supported
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-10-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's gcc 4.8.3 which doesn't support those cores yet.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: new patch
---
 .../toolchain-external/toolchain-external-codesourcery-arm/Config.in    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
index 037985b..3cdfc86 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
@@ -3,6 +3,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
+	# Unsupported ARM cores
+	depends on !BR2_cortex_a12 && !BR2_cortex_a17
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
-- 
2.10.2
