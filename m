From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Sep 2020 17:38:40 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/nginx: use /run
 for PIDFile
Message-ID: <20200928211214.17B8E80FFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bf6de98ad6da39e6758b974ce98afdff396a844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:

systemd[1]: /usr/lib/systemd/system/nginx.service:7: PIDFile= references
a path below legacy directory /var/run/, updating /var/run/nginx.pid ???
/run/nginx.pid; please update the unit file accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4027ba29f448b9f70347dbfd27cdeddab44e40b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/nginx.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nginx/nginx.service b/package/nginx/nginx.service
index 320df9a80e..9fd215fd3e 100644
--- a/package/nginx/nginx.service
+++ b/package/nginx/nginx.service
@@ -4,7 +4,7 @@ After=syslog.target network.target
 
 [Service]
 Type=forking
-PIDFile=/var/run/nginx.pid
+PIDFile=/run/nginx.pid
 ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx
 ExecStartPre=/usr/sbin/nginx -t -q -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
 ExecStart=/usr/sbin/nginx -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
