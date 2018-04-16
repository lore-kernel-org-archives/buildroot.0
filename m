From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:38 +0200
Subject: [Buildroot] [git commit] dnsmasq: don't test if the binary exists
 in the init script
Message-ID: <20180416053717.CA0FE83B4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6cb9b6cb9220bb71a51a4d34c0657db64268159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dnsmasq/S80dnsmasq | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
index d2f8b0f6b4..b052259e87 100755
--- a/package/dnsmasq/S80dnsmasq
+++ b/package/dnsmasq/S80dnsmasq
@@ -1,6 +1,5 @@
 #!/bin/sh
 
-[ -x /usr/sbin/dnsmasq ] || exit 0
 [ -f /etc/dnsmasq.conf ] || exit 0
 
 case "$1" in
