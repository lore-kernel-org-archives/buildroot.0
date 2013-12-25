From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 25 Dec 2013 10:13:51 +0100
Subject: [Buildroot] [PATCH] menu: visually split Shells from Utilities
Message-ID: <edb15c529ea743260f32.1387962831@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed in [1], add comments to distinghuish shells from utilities in
the 'Shells and Utilities' menu.

[1] http://lists.busybox.net/pipermail/buildroot/2013-December/083836.html

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/Config.in |  4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -948,12 +948,14 @@ source "package/xenomai/Config.in"
 endmenu
 
 menu "Shell and utilities"
-source "package/at/Config.in"
+comment "Shells"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bash/Config.in"
 source "package/dash/Config.in"
 source "package/zsh/Config.in"
 endif
+comment "Utilities"
+source "package/at/Config.in"
 source "package/dialog/Config.in"
 source "package/dtach/Config.in"
 source "package/file/Config.in"
