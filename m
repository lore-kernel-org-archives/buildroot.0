From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri,  6 Mar 2020 16:25:01 -0700
Subject: [Buildroot] [PATCH 1/1] package/ser2net: check for new config file
 format
Message-ID: <20200306232501.119626-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When running ser2net it looks for config files in the legacy conf
format and the new yaml format so we need to allow either in the
sysv init script.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ser2net/S50ser2net | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ser2net/S50ser2net b/package/ser2net/S50ser2net
index 200dfd0e4d..1b178c18f4 100644
--- a/package/ser2net/S50ser2net
+++ b/package/ser2net/S50ser2net
@@ -5,7 +5,7 @@
 
 start() {
     printf  "Starting ser2net: "
-    if [ ! -f /etc/ser2net.conf ] ; then
+    if [ ! -f /etc/ser2net.conf ] && [ ! -f /etc/ser2net/ser2net.yaml ] ; then
 	echo "no configuration file"
 	exit 1
     fi
-- 
2.20.1
