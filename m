From: Christian Stewart <christian@paral.in>
Date: Thu, 14 Jul 2016 12:05:02 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/chrony: fix systemd service
Message-ID: <1468523102-4191-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the systemd service, the binary is located at /usr/sbin not
/usr/bin.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/chrony/chrony.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/chrony/chrony.service b/package/chrony/chrony.service
index 6000fce..325b63c 100644
--- a/package/chrony/chrony.service
+++ b/package/chrony/chrony.service
@@ -4,7 +4,7 @@ After=syslog.target network.target
 Conflicts=systemd-timesyncd.service
 
 [Service]
-ExecStart=/usr/bin/chronyd -n
+ExecStart=/usr/sbin/chronyd -n
 Restart=always
 
 [Install]
-- 
2.7.3
