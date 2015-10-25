From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sun, 25 Oct 2015 02:59:34 +0200
Subject: [Buildroot] [PATCH v3 08/13] package/dhcp: remove sleep from SysV
	init scripts restart
In-Reply-To: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <1445734779-7212-8-git-send-email-benoit.thebaudeau.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Beno?t Th?baudeau <benoit@wsystem.com>

No sleep is required for the restart and force-reload operations to
succeed.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

---
Changes v2 -> v3: none.

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
