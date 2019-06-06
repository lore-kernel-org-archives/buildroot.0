From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 08:45:05 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/gerbera: fix
 pidfile name in start-stop-script
Message-ID: <20190606064907.5B49F812B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d794f06e4912c1ffa3837abba2952f138cf6b412
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

`NAME` is not set resulting in a pidfile without a basename:
`/var/run/.pid`. Use the correct variable `DAEMON` instead.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bd03727531428ba7bcf7d1918d9913f88c8e15c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
