From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 29 Aug 2013 14:59:18 +0200
Subject: [Buildroot] [PATCH 3 of 9 v3] Config.in.legacy: add separator to
 description for users
In-Reply-To: <patchbomb.1377781155@argentina>
References: <patchbomb.1377781155@argentina>
Message-ID: <240f7d7c4c60ebb1a259.1377781158@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When legacy symbols are selected, the menuconfig shows the explanation for
users, immediately followed by the line "Legacy options removed in 2013.08".
In order to visually keep these apart, we introduce a separator.

Note that a line with all spaces is not correctly shown by menuconfig (the
width will not be kept at 80 characters, so the output is '***   ***').
A dashed line seemed a logical alternative, and with another dashed line on
top, the description becomes a block.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
This patch is pure aesthetics. I kept it as a separate patch so it can be
rejected easily if you don't feel the same way.

(v3): new patch in this series

 Config.in.legacy |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -68,6 +68,7 @@ comment "Legacy detected: check the cont
 menu "Legacy config options"
 
 if BR2_LEGACY
+comment "----------------------------------------------------"
 comment "Your old configuration uses legacy options that no  "
 comment "longer exist in buildroot, as indicated in the menu "
 comment "below. As long as these options stay selected, or in"
@@ -89,6 +90,7 @@ comment "Note: at some point in the futu
 comment "options will be removed, and configuration files    "
 comment "that still have those options set, will fail to     "
 comment "build, or run, in unpredictable ways.               "
+comment "----------------------------------------------------"
 endif
 
 ###############################################################################
