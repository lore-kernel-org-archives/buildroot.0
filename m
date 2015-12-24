From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 15:06:47 +0100
Subject: [Buildroot] [git commit] package/dhcp: remove sleep from SysV init
	scripts restart
Message-ID: <20151224142830.1F02082706@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77cdeaa929d88b9b1736ee503c3f647f967791a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No sleep is required for the restart and force-reload operations to
succeed.

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index f4e2209..21092ba 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -36,7 +36,6 @@ case "$1" in
 		;;
 	restart | force-reload)
 		$0 stop
-		sleep 2
 		$0 start
 		if [ "$?" != "0" ]; then
 			exit 1
