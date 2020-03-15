From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 14:47:07 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/sysklogd: fix
 daemon paths in systemd unit files
Message-ID: <20200315133507.BA3FF87F77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5188824ce85f885a75c1e693231c7cd61556190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

They are at /sbin, not /usr/sbin.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/klogd.service   | 2 +-
 package/sysklogd/syslogd.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/klogd.service b/package/sysklogd/klogd.service
index c66795b449..b5dbb93d7d 100644
--- a/package/sysklogd/klogd.service
+++ b/package/sysklogd/klogd.service
@@ -2,7 +2,7 @@
 Description=Kernel Log Daemon
 
 [Service]
-ExecStart=/usr/sbin/klogd -n
+ExecStart=/sbin/klogd -n
 StandardOutput=null
 Restart=on-failure
 
diff --git a/package/sysklogd/syslogd.service b/package/sysklogd/syslogd.service
index 70e4cff27e..adaac679f2 100644
--- a/package/sysklogd/syslogd.service
+++ b/package/sysklogd/syslogd.service
@@ -4,7 +4,7 @@ Requires=syslog.socket
 Wants=klogd.service
 
 [Service]
-ExecStart=/usr/sbin/syslogd -m 0 -n
+ExecStart=/sbin/syslogd -m 0 -n
 StandardOutput=null
 Restart=on-failure
 
