From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  6 Feb 2018 09:02:09 -0500
Subject: [Buildroot] [PATCH 1/1] 2017.11.x: fix refpolicy build failure
Message-ID: <20180206140209.18298-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to fix the fallthrough.

Taken from upstream:
Fixes:
http://autobuild.buildroot.net/results/54e240243aba31da33a2cbecdcc234b44f24dcf7

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../refpolicy/0001-fix-fall-through-error.patch    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/refpolicy/0001-fix-fall-through-error.patch

diff --git a/package/refpolicy/0001-fix-fall-through-error.patch b/package/refpolicy/0001-fix-fall-through-error.patch
new file mode 100644
index 0000000000..524884b254
--- /dev/null
+++ b/package/refpolicy/0001-fix-fall-through-error.patch
@@ -0,0 +1,29 @@
+From 4c71351e7dc7817bdc553cf0104c491e029e1b59 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Tue, 6 Feb 2018 08:58:41 -0500
+Subject: [PATCH] fix fall through error
+
+Backported from upstream.
+
+Fixes:
+http://autobuild.buildroot.net/results/54e240243aba31da33a2cbecdcc234b44f24dcf7
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ support/fc_sort.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/support/fc_sort.c b/support/fc_sort.c
+index 5561288..b75c7b4 100644
+--- a/support/fc_sort.c
++++ b/support/fc_sort.c
+@@ -292,6 +292,7 @@ void fc_fill_data(file_context_node_t *fc_node)
+ 			/* If a escape character is found,
+ 			 *  skip the next character. */
+ 			c++;
++			break;
+ 		default:
+ 			/* If no meta character has been found yet,
+ 			 *  add one to the stem length. */
+-- 
+2.14.3
+
-- 
2.14.3
