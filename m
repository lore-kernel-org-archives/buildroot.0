From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 13:45:03 +0200
Subject: [Buildroot] [PATCH v3 3/8] package/dhcpcd: use /run for PIDFile
In-Reply-To: <20200915215645.2010-1-buildroot@heine.tech>
References: <20200915215645.2010-1-buildroot@heine.tech>
Message-ID: <20200916114508.3575-4-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/dhcpcd.pid ? /run/dhcpcd.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
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
 
-- 
2.25.1
