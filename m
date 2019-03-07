From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 21:47:25 +0100
Subject: [Buildroot] [git commit] package/mender: add missing double quote
 in service file
Message-ID: <20190307204455.F30FA8E943@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93321e5f166d08426e38a14bce318e9807d7d45d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There was a missing double quotes that would prevent the service from
starting.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Acked-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/mender.service b/package/mender/mender.service
index 8b60a4f1aa..2a5f476ee5 100644
--- a/package/mender/mender.service
+++ b/package/mender/mender.service
@@ -12,7 +12,7 @@ if [ -L /var/lib/mender \
     if rm -f /var/lib/mender >/dev/null 2>&1; then \
         mkdir -p /var/lib/mender; \
     else \
-        echo "No persistent location to store mender data. Data will be lost\
+        echo "No persistent location to store mender data. Data will be lost" \
         echo "at reboot. Are you sure this is what you want to do?"; \
         mkdir -p "$(readlink /var/lib/mender)"; \
     fi; \
