From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 22:55:12 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] transmission: don't test
 if the binary exists in the init script
Message-ID: <20180611211536.E1A628832D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3814a98852f46b3f31c5926ac65e9ef5dab359a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 296f148c15e8eac85a41b33558d879591663b2ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
