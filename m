From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 18:52:06 +0100
Subject: [Buildroot] [git commit] dcron: startup fails with setpgid:
	Operation not permitted
Message-ID: <20151128175221.1F6847FAB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7c4eddda8d7ebbd7f7650f915aa637aa555ef8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dale Ghent <daleg@omniti.com>
Reviewed-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dcron/dcron.service |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
