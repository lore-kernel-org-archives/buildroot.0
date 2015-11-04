From: Steven Noonan <steven@uplinklabs.net>
Date: Wed,  4 Nov 2015 00:36:37 -0800
Subject: [Buildroot] [PATCH] haveged: fix systemd service path
Message-ID: <1446626197-25693-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'haveged' is installed in /usr/sbin, not /usr/bin.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/haveged/haveged.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haveged/haveged.service b/package/haveged/haveged.service
index d87fe5b..91035c6 100644
--- a/package/haveged/haveged.service
+++ b/package/haveged/haveged.service
@@ -3,7 +3,7 @@ Description=Entropy Harvesting Daemon
 Documentation=man:haveged(8)
 
 [Service]
-ExecStart=/usr/bin/haveged -F -w 1024 -v 1
+ExecStart=/usr/sbin/haveged -F -w 1024 -v 1
 SuccessExitStatus=143
 
 [Install]
-- 
2.6.2
