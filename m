From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Fri, 21 Aug 2015 18:45:16 +0200
Subject: [Buildroot] [PATCH v2 5/8] package/dhcp: remove sleep from SysV
	init scripts restart
In-Reply-To: <1440175519-478-1-git-send-email-benoit@wsystem.com>
References: <1440175519-478-1-git-send-email-benoit@wsystem.com>
Message-ID: <1440175519-478-6-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No sleep is required for the restart and force-reload operations to
succeed.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/dhcp/S80dhcp-relay  | 1 -
 package/dhcp/S80dhcp-server | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/dhcp/S80dhcp-relay b/package/dhcp/S80dhcp-relay
index dbcfa62..c8f79ff 100755
--- a/package/dhcp/S80dhcp-relay
+++ b/package/dhcp/S80dhcp-relay
@@ -43,7 +43,6 @@ case "$1" in
 		;;
 	restart | force-reload)
 		$0 stop
-		sleep 2
 		$0 start
 		;;
 	*)
diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index 7c1695c..1f27b54 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -33,7 +33,6 @@ case "$1" in
 		;;
 	restart | force-reload)
 		$0 stop
-		sleep 2
 		$0 start
 		if [ "$?" != "0" ]; then
 			exit 1
-- 
2.1.4
