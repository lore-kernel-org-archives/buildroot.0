From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 22:43:06 +0100
Subject: [Buildroot] [git commit] package/dropbear: Respect user specific
	configurations
Message-ID: <20151102214323.1E263818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60016a6818d57f376a3fe28e85f0064673bc1210
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd .service file should respect /etc/default/dropbear

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropbear/dropbear.service |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/dropbear/dropbear.service b/package/dropbear/dropbear.service
index 1eb42f9..66ec9cf 100644
--- a/package/dropbear/dropbear.service
+++ b/package/dropbear/dropbear.service
@@ -19,7 +19,8 @@ if [ -L /etc/dropbear \
         mkdir -p "$(readlink /etc/dropbear)"; \
     fi; \
 fi'
-ExecStart=/usr/sbin/dropbear -F -R
+EnvironmentFile=/etc/default/dropbear
+ExecStart=/usr/sbin/dropbear -F -R $DROPBEAR_ARGS
 ExecReload=/bin/kill -HUP $MAINPID
 
 [Install]
