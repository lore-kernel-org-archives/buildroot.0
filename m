From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Tue, 13 Oct 2015 11:35:26 +0200
Subject: [Buildroot] [PATCH v2 5/8] package/dhcp: remove sleep from SysV
	init scripts restart
In-Reply-To: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
References: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
Message-ID: <1444728929-46246-5-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No sleep is required for the restart and force-reload operations to
succeed.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

---
Changes v1 -> v2:
 - Rebase.
---
 package/dhcp/S80dhcp-relay  | 1 -
 package/dhcp/S80dhcp-server | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/dhcp/S80dhcp-relay b/package/dhcp/S80dhcp-relay
index 6493eda..211431b 100755
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
index c56e7c3..dc9c433 100755
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
