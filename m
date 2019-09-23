From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 23 Sep 2019 13:22:31 -0700
Subject: [Buildroot] [PATCH] package/devmem2: remove reference from
 package/Config.in
Message-ID: <20190923202231.805-1-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change that removed package/devmem2 didn't remove reference to it from
the package/Config.in. As a result make menuconfig fails with the
following message now:

  package/Config.in:428: can't open file "package/devmem2/Config.in"

Remove reference to the package/devmem2 from package/Config.in.

Cc: Carlos Santos <unixmania@gmail.com>
Fixes: 2b2579afebfc ("package/devmem2: remove package")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 2fc11065f68d..c336dfeda342 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -425,7 +425,6 @@ endmenu
 	source "package/dbus-glib/Config.in"
 	source "package/dbus-python/Config.in"
 	source "package/dbus-triggerd/Config.in"
-	source "package/devmem2/Config.in"
 	source "package/dfu-util/Config.in"
 	source "package/dmidecode/Config.in"
 	source "package/dmraid/Config.in"
-- 
2.11.0
