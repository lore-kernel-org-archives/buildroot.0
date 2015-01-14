From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 17:16:56 -0300
Subject: [Buildroot] [PATCH 1/2] rsyslog: remove pointless umask from sysv
	initscript
Message-ID: <1421266617-9201-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsyslog/S01logging | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rsyslog/S01logging b/package/rsyslog/S01logging
index 97d519a..6471676 100644
--- a/package/rsyslog/S01logging
+++ b/package/rsyslog/S01logging
@@ -2,7 +2,6 @@
 
 start() {
   echo -n "Starting rsyslog daemon: "
-  umask 077
   start-stop-daemon -S -q -p /var/run/rsyslogd.pid --exec /usr/sbin/rsyslogd
   [ $? = 0 ] && echo "OK" || echo "FAIL"
 }
-- 
2.0.5
