From: Julien Boibessot <julien.boibessot@free.fr>
Date: Sun, 25 Oct 2009 22:16:01 +0100
Subject: [Buildroot] [git commit master] package: Don't hide all editors in
	menuconfig
Message-ID: <20091025211704.7E155777C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8ec5a866162772b60deba2060917cd281eb64cae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't hide all editors in config if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not
selected. Indeed vi is the only editor already provided by busybox.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in         |    5 -----
 package/editors/Config.in |    3 +++
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index afcface..6afa211 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -114,14 +114,9 @@ endif
 
 source "package/database/Config.in"
 
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-# busybox has an editor
-
 # text editors
 source "package/editors/Config.in"
 
-endif
-
 menu "Networking"
 
 comment "Networking applications"
diff --git a/package/editors/Config.in b/package/editors/Config.in
index a1b5fd3..f58f96b 100644
--- a/package/editors/Config.in
+++ b/package/editors/Config.in
@@ -2,5 +2,8 @@ menu "Text editors"
 source "package/editors/ed/Config.in"
 source "package/editors/nano/Config.in"
 source "package/editors/uemacs/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+# busybox has vi
 source "package/editors/vim/Config.in"
+endif
 endmenu
-- 
1.6.3.3
