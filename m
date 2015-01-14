From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:05:21 +0100
Subject: [Buildroot] [git commit] rsyslog: remove pointless umask from sysv
	initscript
Message-ID: <20150114211411.C029B80D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82e4f72546248b1b9abde9e9babffc7428071180
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsyslog/S01logging |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

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
