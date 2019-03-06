From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed,  6 Mar 2019 10:49:53 -0500
Subject: [Buildroot] [PATCH 1/1] package/mender: Fix service file.
Message-ID: <20190306154953.119334-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

There was a missing double quotes that would prevent the service from starting.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
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
-- 
2.20.1
