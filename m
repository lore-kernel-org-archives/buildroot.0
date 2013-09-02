From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 02 Sep 2013 22:07:52 +0200
Subject: [Buildroot] [PATCH 3 of 9 v4] Config.in.legacy: add separator to
 description for users
In-Reply-To: <patchbomb.1378152469@argentina>
References: <patchbomb.1378152469@argentina>
Message-ID: <390f292e28ee40bd9575.1378152472@argentina>
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
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
This patch is pure aesthetics. I kept it as a separate patch so it can be
rejected easily if you don't feel the same way.

v4: no changes
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
@@ -94,6 +95,7 @@ comment "Note: at some point in the futu
 comment "options will be removed, and configuration files    "
 comment "that still have those options set, will fail to     "
 comment "build, or run, in unpredictable ways.               "
+comment "----------------------------------------------------"
 endif
 
 ###############################################################################
