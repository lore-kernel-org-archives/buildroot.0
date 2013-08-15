From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Aug 2013 22:28:02 +0200
Subject: [Buildroot] [PATCH] targets: move target options to their own
	sub-menu
Message-ID: <1376598482-9492-1-git-send-email-yann.morin.1998@free.fr>
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
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 0b5b218..640926a 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -1,3 +1,5 @@
+menu "Target options"
+
 config BR2_ARCH_IS_64
 	bool
 
@@ -324,3 +326,5 @@ endif
 if BR2_xtensa
 source "arch/Config.in.xtensa"
 endif
+
+endmenu # Target options
-- 
1.8.1.2
