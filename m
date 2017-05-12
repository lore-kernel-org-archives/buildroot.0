From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 May 2017 21:15:09 +0200
Subject: [Buildroot] [PATCH] package/odroid-scripts: relax dependencies to
	include armeb
Message-ID: <20170512191509.25736-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

odroid-scripts are just scripts, so they should also work on a armeb
board.

Besides, odroid-mali selects it, but it only depends on arm-eabihf,
which means armeb is not ruled out.

Fixes unmet dependencies (with BR2_armeb=y):
    warning: (BR2_PACKAGE_ODROID_MALI) selects BR2_PACKAGE_ODROID_SCRIPTS
    which has unmet direct dependencies(BR2_aarch64 || BR2_arm)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Dagg Stompler <daggs@gmx.com>
---
 package/odroid-scripts/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/odroid-scripts/Config.in b/package/odroid-scripts/Config.in
index c4e09cad72..c07c3a4c09 100644
--- a/package/odroid-scripts/Config.in
+++ b/package/odroid-scripts/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_ODROID_SCRIPTS
 	bool "odroid-scripts"
-	depends on BR2_aarch64 || BR2_arm
+	depends on BR2_aarch64 || BR2_arm || BR2_armeb
 	select BR2_PACKAGE_FBSET # runtime
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # needed for fbset
 	help
-- 
2.11.0
