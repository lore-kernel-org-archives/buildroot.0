From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 16 May 2019 10:25:42 +0200
Subject: [Buildroot] [PATCH] package/gerbera: fix pidfile name in
 start-stop-script
Message-ID: <20190516082542.28530-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

`NAME` is not set resulting in a pidfile without a basename:
`/var/run/.pid`. Use the correct variable `DAEMON` instead.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/gerbera/S99gerbera | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gerbera/S99gerbera b/package/gerbera/S99gerbera
index 8bbd221ce2..d1c74c887c 100644
--- a/package/gerbera/S99gerbera
+++ b/package/gerbera/S99gerbera
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 DAEMON="gerbera"
-PIDFILE="/var/run/$NAME.pid"
+PIDFILE="/var/run/$DAEMON.pid"
 
 GERBERA_ARGS="-c /etc/gerbera/config.xml -l /var/log/gerbera.log"
 
-- 
2.21.0
