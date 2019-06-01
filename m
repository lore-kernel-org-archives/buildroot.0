From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jun 2019 22:33:51 +0200
Subject: [Buildroot] [PATCH 2/2] arch/arc: arc7x0 always needs -matomic
In-Reply-To: <cover.1559421222.git.yann.morin.1998@free.fr>
References: <cover.1559421222.git.yann.morin.1998@free.fr>
Message-ID: <16241cb355b045ba585ba806f0f4c829f5aea9f8.1559421222.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by Alexey:
    https://patchwork.ozlabs.org/patch/1087480/
    https://patchwork.ozlabs.org/patch/1087471/

Reported-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 arch/arch.mk.arc | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 arch/arch.mk.arc

diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
new file mode 100644
index 0000000000..d324e5c1e1
--- /dev/null
+++ b/arch/arch.mk.arc
@@ -0,0 +1,4 @@
+# ARC7x0 needs -matomic, always
+ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
+ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
+endif
-- 
2.20.1
