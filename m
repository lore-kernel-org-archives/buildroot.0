From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Wed, 10 Sep 2014 16:46:27 +0400
Subject: [Buildroot] [PATCH] arc: Fix warning if atomics are selected
Message-ID: <1410353187-16974-1-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If atomic instructions were selected for ARC, there was a warning, like:
"(BR2_ARC_ATOMIC_EXT) selects BR2_ARCH_HAS_ATOMICS which has unmet direct
dependencies". This patch removes the reason of this warning by adding a
respective configuration entry.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.arc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 8a7f290..d2ccf09 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -1,3 +1,6 @@
+config  BR2_ARCH_HAS_ATOMICS
+	bool
+
 # Choise of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-- 
1.8.4.1
