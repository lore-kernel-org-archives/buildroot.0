From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:27 -0300
Subject: [Buildroot] [PATCH 09/26] mpd: don't test if the binary exists in
 the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-10-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
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
-- 
2.14.3
