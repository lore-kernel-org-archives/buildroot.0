From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 21:50:24 +0100
Subject: [Buildroot] [git commit] package/rng-tools: systemd: support extra
	options
Message-ID: <20151104205040.BD8A6807F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=463d0b9d1b628283edb77defa507df3c9d0d2d76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a DAEMON_ARGS configuration variable in order to make it possible to
pass custom extra options to rngd. This environment variable must
defined in /etc/default/rngd if needed, like with the SysV init script.
This file does not have to be present if not needed.

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau.dev@gmail.com>
Reviewed-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rng-tools/rngd.service |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
