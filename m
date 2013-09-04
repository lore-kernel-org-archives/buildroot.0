From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  4 Sep 2013 23:35:55 +0200
Subject: [Buildroot] [PATCH 3/4] targets: move target options to their own
	sub-menu
In-Reply-To: <cover.1378330371.git.yann.morin.1998@free.fr>
References: <cover.1378330371.git.yann.morin.1998@free.fr>
Message-ID: <fea6f0a0620d98f3e2971fc4f2920fd1909ae7c7.1378330371.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, all target options lie in the top-level menu.
This looks a bit clumsy, since all other options are neatly
folded into their own sematic sub-menus each.

Move the target option into their own sub-menu too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 14899ca..3fd8c1c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -1,3 +1,5 @@
+menu "Target options"
+
 config BR2_ARCH_IS_64
 	bool
 
@@ -335,3 +337,5 @@ endif
 if BR2_xtensa
 source "arch/Config.in.xtensa"
 endif
+
+endmenu # Target options
-- 
1.8.1.2
