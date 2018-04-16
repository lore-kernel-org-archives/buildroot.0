From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:33 +0200
Subject: [Buildroot] [git commit] bind: don't test if the binary exists in
 the init script
Message-ID: <20180416053717.7C17B83B4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f59d73426b5ead6c808ee83dd324049fb02c89aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/S81named | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bind/S81named b/package/bind/S81named
index bc4bb0f246..1da3008ae2 100644
--- a/package/bind/S81named
+++ b/package/bind/S81named
@@ -3,7 +3,6 @@
 CONFIG=/etc/bind/named.conf
 DAEMON=/usr/sbin/named
 
-[ -x $DAEMON ] || exit 0
 [ -f $CONFIG ] || exit 0
 
 case "$1" in
