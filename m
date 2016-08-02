From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue,  2 Aug 2016 15:50:40 -0400
Subject: [Buildroot] [PATCH] initscripts: add newline to network stop message
Message-ID: <20160802195040.7210-1-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The output of "/etc/init.d/S40network stop" was lacking a newline due to
the usage of printf. Fix it by using echo instead.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 package/initscripts/init.d/S40network | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/initscripts/init.d/S40network b/package/initscripts/init.d/S40network
index 7b11d8b..213f5b5 100755
--- a/package/initscripts/init.d/S40network
+++ b/package/initscripts/init.d/S40network
@@ -12,7 +12,7 @@ case "$1" in
 	/sbin/ifup -a
 	;;
   stop)
-	printf "Stopping network..."
+	echo "Stopping network..."
 	/sbin/ifdown -a
 	;;
   restart|reload)
-- 
2.9.2
