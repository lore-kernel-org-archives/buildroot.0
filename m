From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu,  2 May 2013 15:00:41 +0200
Subject: [Buildroot] [PATCH v3 02/11] arc: Add option for ARC-specific
	download site
In-Reply-To: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
References: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1367499650-29869-3-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As ARC support is not yet in all upstream packages, a different location is
required to download the packages from. This adds an option to specify a
site for ARC-specific versions of packages such as binutils, gcc.

When ARC support has been upstreamed for all packages, this option can be
removed again.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 arch/Config.in.arc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 60b59f0..9f68b46 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -12,3 +12,7 @@ config BR2_ENDIAN
 
 config BR2_GCC_TARGET_CPU
 	default "arc700"
+
+config BR2_ARC_SITE
+	string
+	default "http://www.synopsys.com/apps/arc-developer/"
-- 
1.7.0.4
