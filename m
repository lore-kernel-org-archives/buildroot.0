From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 13:45:01 +0200
Subject: [Buildroot] [PATCH v3 1/8] package/nginx: use /run for PIDFile
In-Reply-To: <20200915215645.2010-1-buildroot@heine.tech>
References: <20200915215645.2010-1-buildroot@heine.tech>
Message-ID: <20200916114508.3575-2-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

systemd[1]: /usr/lib/systemd/system/nginx.service:7: PIDFile= references
a path below legacy directory /var/run/, updating /var/run/nginx.pid ?
/run/nginx.pid; please update the unit file accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
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
-- 
2.25.1
