From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:57 +0200
Subject: [Buildroot] [git commit] squid: don't test if the binary exists in
 the init script
Message-ID: <20180416053718.F004C88325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=999d1a690c6dd87c01a5cb16b7dc1562db76698a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/squid/S97squid | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/squid/S97squid b/package/squid/S97squid
index 535b1d9622..05fb93e317 100755
--- a/package/squid/S97squid
+++ b/package/squid/S97squid
@@ -1,6 +1,5 @@
 #!/bin/sh
 
-[ -x /usr/sbin/squid ] || exit 0
 [ -f /etc/squid.conf ] || exit 0
 
 case "$1" in
