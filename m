From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu,  2 May 2013 21:51:26 +0200
Subject: [Buildroot] [PATCH v4 05/12] arc: disable Crosstool-NG for ARC
In-Reply-To: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
References: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1367524293-32081-6-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 toolchain/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index fa78cf4..e6a3b25 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -22,7 +22,7 @@ config BR2_TOOLCHAIN_EXTERNAL
 
 config BR2_TOOLCHAIN_CTNG
 	bool "Crosstool-NG toolchain"
-	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_xtensa
+	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_xtensa && !BR2_arc
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	help
 	  Say 'y' if you want to generate the toolchain with crosstool-NG
-- 
1.7.0.4
