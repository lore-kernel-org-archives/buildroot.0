From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2015 23:18:25 +0100
Subject: [Buildroot] [git commit] dhcp: dhcpd.service:
	/etc/default/dhcpd.conf is optional
Message-ID: <20151109222528.B2E3B81E65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21aa707a126155533748998f4fae328b1c63d1d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The environment file is for optional customization, so don't error out if it
isn't present.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcpd.service |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhcp/dhcpd.service b/package/dhcp/dhcpd.service
index 7b265cb..d58fbd5 100644
--- a/package/dhcp/dhcpd.service
+++ b/package/dhcp/dhcpd.service
@@ -7,7 +7,7 @@ Type=forking
 PIDFile=/run/dhcpd.pid
 ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $INTERFACES
 KillSignal=SIGINT
-EnvironmentFile=/etc/default/dhcpd.conf
+EnvironmentFile=-/etc/default/dhcpd.conf
 
 [Install]
 WantedBy=multi-user.target
