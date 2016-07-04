From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:59 +0200
Subject: [Buildroot] [PATCH 48/83 v2] package/ipsec-tools: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <39df47b2c8338c4f297b679deff64e295c1f89bb.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ipsec-tools has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ipsec-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 36c5a65..b0d0765 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_IPSEC_TOOLS
+menuconfig BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree
-- 
2.7.4
