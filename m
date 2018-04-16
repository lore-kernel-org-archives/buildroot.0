From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:42 +0200
Subject: [Buildroot] [git commit] modem-manager: don't test if the binary
 exists in the init script
Message-ID: <20180416053718.0F43A88325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef0b7e752177254de38873a35b0383a32857e28c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Drop the MODEMMANAGER_BIN variable, which was never initialized.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/modem-manager/S44modem-manager | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/modem-manager/S44modem-manager b/package/modem-manager/S44modem-manager
index cf6d89601d..a3f5003aa1 100755
--- a/package/modem-manager/S44modem-manager
+++ b/package/modem-manager/S44modem-manager
@@ -5,8 +5,6 @@
 
 PIDFILE=/var/run/ModemManager.pid
 
-[ -x $MODEMMANAGER_BIN ] || exit 0
-
 start() {
 	printf "Starting ModemManager: "
 	umask 077
