From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:35:00 +0200
Subject: [Buildroot] [git commit] transmission: don't test if the binary
 exists in the init script
Message-ID: <20180416053719.36BD188325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=296f148c15e8eac85a41b33558d879591663b2ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/transmission/S92transmission | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/transmission/S92transmission b/package/transmission/S92transmission
index e5976b0cfb..29d7cd5863 100644
--- a/package/transmission/S92transmission
+++ b/package/transmission/S92transmission
@@ -51,9 +51,6 @@ DAEMON=$(which $NAME)
 PIDFILE=/var/run/$NAME.pid
 SCRIPTNAME=/etc/init.d/$NAME
 
-# Exit if the package is not installed
-[ -x "$DAEMON" ] || exit 0
-
 # Read configuration variable file if it is present
 [ -r /etc/default/$NAME ] && . /etc/default/$NAME
 
