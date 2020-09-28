From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Sep 2020 22:47:19 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/dhcpcd: use /run
 for PIDFile
Message-ID: <20200928211214.30B0C8D4B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0600b47b68d329419746d53b36a9cdae175b548e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/dhcpcd.pid ??? /run/dhcpcd.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9668296056c265836b61f2e7afe6bcd7c9d773ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcpcd/dhcpcd.service b/package/dhcpcd/dhcpcd.service
index 0552b5c73a..e648092c9b 100644
--- a/package/dhcpcd/dhcpcd.service
+++ b/package/dhcpcd/dhcpcd.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 EnvironmentFile=-/etc/default/dhcpcd
-PIDFile=/var/run/dhcpcd.pid
+PIDFile=/run/dhcpcd.pid
 ExecStart=/sbin/dhcpcd $DAEMON_ARGS
 Restart=always
 
