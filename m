From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:04:36 +0200
Subject: [Buildroot] [git commit] config menu: which is also provided by
	busybox
Message-ID: <20111015213656.96FFC8E273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=933693d81c209b3bb612d5addad3166aae19f8a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Busybox has a which applet so hide regular which unless
BR2_BUSYBOX_SHOW_OTHERS is true.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7dc8887..39a80a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -515,7 +515,9 @@ source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
 source "package/screen/Config.in"
 source "package/sudo/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/which/Config.in"
+endif
 source "package/xmlstarlet/Config.in"
 endmenu
 
