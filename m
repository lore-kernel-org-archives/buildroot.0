From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Sep 2013 15:45:24 +0200
Subject: [Buildroot] [git commit] targets: move target options to their own
	sub-menu
Message-ID: <20130905134646.C1A058CA3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b5650cf7ffb6800d56d620aca7377500cc26b37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, all target options lie in the top-level menu.
This looks a bit clumsy, since all other options are neatly
folded into their own sematic sub-menus each.

Move the target option into their own sub-menu too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
