From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Wed, 21 Oct 2015 00:43:28 +0200
Subject: [Buildroot] [PATCH] package/rng-tools: systemd: support extra
	options
Message-ID: <1445381008-5165-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a DAEMON_ARGS configuration variable in order to make it possible to
pass custom extra options to rngd. This environment variable must
defined in /etc/default/rngd if needed, like with the SysV init script.
This file does not have to be present if not needed.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
---
 package/rng-tools/rngd.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rng-tools/rngd.service b/package/rng-tools/rngd.service
index 3bdc4c1..c0bcffe 100644
--- a/package/rng-tools/rngd.service
+++ b/package/rng-tools/rngd.service
@@ -2,8 +2,9 @@
 Description=Hardware RNG Entropy Gatherer Daemon
 
 [Service]
-ExecStart=/usr/sbin/rngd -f
+ExecStart=/usr/sbin/rngd -f $DAEMON_ARGS
 SuccessExitStatus=66
+EnvironmentFile=-/etc/default/rngd
 
 [Install]
 WantedBy=multi-user.target
-- 
2.1.4
