From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri, 28 Feb 2020 09:25:39 +0100
Subject: [Buildroot] [PATCH] package/exim: fix systemd service binary path
Message-ID: <20200228082539.4530-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

modern versions of exim are installed into sbin not bin

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/exim/exim.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exim/exim.service b/package/exim/exim.service
index 26daabc4c0..fe97727ab5 100644
--- a/package/exim/exim.service
+++ b/package/exim/exim.service
@@ -3,7 +3,7 @@ Description=Exim MTA
 After=syslog.target network.target
 
 [Service]
-ExecStart=/usr/bin/exim -bdf
+ExecStart=/usr/sbin/exim -bdf
 Restart=always
 
 [Install]
-- 
2.17.1
