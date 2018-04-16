From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:43 +0200
Subject: [Buildroot] [git commit] mpd: don't test if the binary exists in
 the init script
Message-ID: <20180416053718.2240088325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e1219462670b6ce8d9f4a7717ed579805dffec6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/S95mpd | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mpd/S95mpd b/package/mpd/S95mpd
index 9f68b45837..a258930b3e 100644
--- a/package/mpd/S95mpd
+++ b/package/mpd/S95mpd
@@ -1,7 +1,6 @@
 #!/bin/sh
 
 # Sanity checks
-test -f /usr/bin/mpd || exit 0
 test -f /etc/mpd.conf || exit 0
 
 start() {
