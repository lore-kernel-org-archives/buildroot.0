From: Dale Ghent <daleg@omniti.com>
Date: Thu, 13 Aug 2015 19:33:56 +0000
Subject: [Buildroot] [PATCH 1/1] dcron: startup fails with setpgid:
	Operation not permitted
Message-ID: <1439494436-944-1-git-send-email-daleg@omniti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dale Ghent <daleg@omniti.com>
---
 package/dcron/dcron.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dcron/dcron.service b/package/dcron/dcron.service
index b9fa489..924ed72 100644
--- a/package/dcron/dcron.service
+++ b/package/dcron/dcron.service
@@ -3,8 +3,8 @@ Description=Task scheduler daemon
 After=syslog.target
 
 [Service]
-ExecStart=/usr/sbin/crond -f -S
-Restart=always
+ExecStart=/usr/sbin/crond -S
+Type=forking
 
 [Install]
 WantedBy=multi-user.target
-- 
1.9.1
