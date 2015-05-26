From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:41:58 +0200
Subject: [Buildroot] [PATCH 03/21 RFC] docs/manual: slightly re-organise
	br2-external sections
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <48bb1d2d83dfbbbd04d95bff33cd8bfbcf72e048.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the defconfig section before the custom package recipes and before
the custom configuration files.

It is the easiest and most simple way to use BR2_EXTERNAL, so it seems
natural to make it first.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Besides, when we introduce support for multiple br2-external trees, it
will be the easiest section to update. ;-)
---
 docs/manual/customize-outside-br.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 9ad177d..a3d6efd 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -59,6 +59,12 @@ buildroot/ $ make BR2_EXTERNAL= xconfig
 
 +BR2_EXTERNAL+ allows three different things:
 
+ * One can store Buildroot defconfigs in the +configs+ subdirectory of
+   +$(BR2_EXTERNAL)+. Buildroot will automatically show them in the
+   output of +make list-defconfigs+ and allow them to be loaded with the
+   normal +make <name>_defconfig+ command. They will be visible under the
+   +User-provided configs+' label in the 'make list-defconfigs' output.
+
  * One can store all the board-specific configuration files there,
    such as the kernel configuration, the root filesystem overlay, or
    any other configuration file for which Buildroot allows to set its
@@ -101,9 +107,3 @@ And then in +$(BR2_EXTERNAL)/package/package1+ and
    package recipes, as explained in xref:adding-packages[].
    If you prefer, you can also group the packages in subdirectories
    called <boardname> and adapt the above paths accordingly.
-
- * One can store Buildroot defconfigs in the +configs+ subdirectory of
-   +$(BR2_EXTERNAL)+. Buildroot will automatically show them in the
-   output of +make list-defconfigs+ and allow them to be loaded with the
-   normal +make <name>_defconfig+ command. They will be visible under the
-   +User-provided configs+' label in the 'make list-defconfigs' output.
-- 
1.9.1
