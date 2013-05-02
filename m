From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu,  2 May 2013 15:00:48 +0200
Subject: [Buildroot] [PATCH v3 09/11] toolchain/toolchain-buildroot: Disable
	NPTL for ARC
In-Reply-To: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
References: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1367499650-29869-10-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NPTL is not yet supported for ARC.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 toolchain/toolchain-buildroot/Config.in.2 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 7f19b09..35d6db2 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -97,6 +97,7 @@ choice
 		depends on !BR2_x86_i386
 		depends on !BR2_avr32
 		depends on !BR2_xtensa
+		depends on !BR2_arc
 endchoice
 
 config BR2_PTHREAD_DEBUG
-- 
1.7.0.4
