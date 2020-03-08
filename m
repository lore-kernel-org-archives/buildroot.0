From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Mar 2020 15:02:52 +0100
Subject: [Buildroot] [git commit] package/ser2net: S50ser2net: alsoc heck
 for new config file format
Message-ID: <20200308135201.962B18FE61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55514e8c63504d210402e1cf13f7ca9ce1208c56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When running ser2net it looks for config files in the legacy conf
format and the new yaml format so we need to allow either in the
sysv init script.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
