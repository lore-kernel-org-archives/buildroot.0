From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon,  2 Jan 2012 23:27:12 -0500
Subject: [Buildroot] [PATCH v2] mdev.conf: Add ttyO devices
Message-ID: <1325564832-3149-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed to support the serial ports on OMAP/AM335x devices
when using mdev.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/busybox/mdev.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
index 247c0ed..7fb71bc 100644
--- a/package/busybox/mdev.conf
+++ b/package/busybox/mdev.conf
@@ -20,6 +20,7 @@ tty		root:tty 666
 tty[0-9]*	root:tty 660
 vcsa*[0-9]*	root:tty 660
 ttyS[0-9]*	root:root 660
+ttyO[0-9]*	root:root 660
 
 # alsa sound devices
 pcm.*		root:audio 660 =snd/
-- 
1.7.0.4
